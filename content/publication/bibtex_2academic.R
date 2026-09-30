
bibtex_2academic <- function(bibfile,
                             outfold,
                             abstract = TRUE,
                             overwrite = TRUE,
                             clean = TRUE) {

  require(RefManageR)
  require(dplyr)
  require(stringr)
  require(tibble)

  mypubs <- ReadBib(bibfile, check = "warn", .Encoding = "UTF-8") %>%
    as.data.frame() %>%
    rownames_to_column() %>%
    mutate(across(everything(), ~ str_remove_all(.x, "[{}\"]"))) %>%
    mutate(across(everything(), ~ str_replace_all(.x, "\\\\%", "%")))

  if (has_name(mypubs, "document_type") & !(has_name(mypubs, "bibtype"))) {
    mypubs <- mypubs %>% rename(bibtype = document_type)
  }

  # 0 = Uncategorized, 1 = Conference paper, 2 = Journal article,
  # 3 = Manuscript, 4 = Report, 5 = Book, 6 = Book section
  mypubs <- mypubs %>%
    mutate(pubtype = case_when(bibtype %in% c("Article", "Article in Press") ~ "2",
                               bibtype %in% c("InProceedings", "Proceedings", "Conference",
                                              "Conference Paper") ~ "1",
                               bibtype %in% c("MastersThesis", "PhdThesis", "Unpublished") ~ "3",
                               bibtype %in% c("Manual", "TechReport", "Report") ~ "4",
                               bibtype == "Book" ~ "5",
                               bibtype %in% c("InCollection", "InBook") ~ "6",
                               TRUE ~ "0"))

  dir.create(outfold, showWarnings = FALSE, recursive = TRUE)

  # Supprime les dossiers générés qui ne correspondent plus à une entrée du .bib
  if (clean) {
    old <- setdiff(list.dirs(outfold, recursive = FALSE, full.names = FALSE), mypubs$rowname)
    if (length(old) > 0) {
      message("Dossiers supprimés (plus dans le .bib) : ", paste(old, collapse = ", "))
      unlink(file.path(outfold, old), recursive = TRUE)
    }
  }

  # Valeur d'un champ, ou NA s'il est absent ou vide
  fld <- function(x, f) {
    if (!f %in% names(x)) return(NA_character_)
    v <- x[[f]]
    if (is.na(v) || str_trim(v) == "") NA_character_ else str_squish(v)
  }
  q <- function(s) paste0("\"", str_replace_all(s, "\"", "\\\\\""), "\"")
  month_num <- function(m) {
    if (is.na(m)) return("01")
    i <- match(tolower(str_sub(m, 1, 3)), tolower(month.abb))
    if (is.na(i)) i <- suppressWarnings(as.integer(m))
    if (is.na(i)) i <- 1
    sprintf("%02d", i)
  }

  create_md <- function(x) {
    year <- fld(x, "year")
    date <- if (is.na(year)) "2999-01-01" else paste0(year, "-", month_num(fld(x, "month")), "-01")

    # Référence affichée sous le titre
    italic <- !is.na(fld(x, "journal")) || !is.na(fld(x, "booktitle"))
    venue  <- coalesce(fld(x, "journal"), fld(x, "booktitle"), fld(x, "institution"),
                       fld(x, "publisher"), fld(x, "howpublished"))
    pub <- if (is.na(venue)) "" else if (italic) paste0("*", venue, "*") else venue
    if (x[["bibtype"]] %in% c("InCollection", "InBook")) pub <- paste0("In ", pub)
    if (!is.na(fld(x, "type"))) pub <- paste0(pub, ", ", fld(x, "type"))
    vol <- fld(x, "volume"); num <- fld(x, "number")
    if (!is.na(vol)) {
      pub <- paste0(pub, ", ", vol, if (!is.na(num)) paste0("(", num, ")") else "")
    } else if (!is.na(num)) {
      pub <- paste0(pub, ", no. ", num)
    }
    pg <- fld(x, "pages")
    if (!is.na(pg)) pub <- paste0(pub, ", pp. ", str_replace(pg, "-+", "–"))
    if (!is.na(fld(x, "note"))) pub <- paste0(pub, ". ", fld(x, "note"))
    pub <- str_remove(pub, "^, ")

    # Liens : PDF si l'adresse se termine par .pdf, sinon "Source"
    u <- fld(x, "url")
    if (!is.na(u) && !str_detect(u, "^https?://")) u <- paste0("https://", u)
    url_pdf    <- if (!is.na(u) &&  str_detect(u, "\\.pdf$")) u else ""
    url_source <- if (!is.na(u) && !str_detect(u, "\\.pdf$")) u else ""

    # Tags = pôles du site, depuis keywords
    kw   <- fld(x, "keywords")
    tags <- if (is.na(kw)) character(0) else str_trim(str_split(kw, ",")[[1]])

    authors <- str_split(fld(x, "author"), " and ")[[1]]

    outsubfold <- file.path(outfold, x[["rowname"]])
    dir.create(outsubfold, showWarnings = FALSE)
    fileConn <- file.path(outsubfold, "index.md")

    if (!file.exists(fileConn) | overwrite) {
      lines <- c(
        "+++",
        paste0("title = ", q(fld(x, "title"))),
        paste0("date = ", q(date)),
        paste0("authors = [", paste(sapply(authors, q), collapse = ", "), "]"),
        paste0("publication_types = [", q(x[["pubtype"]]), "]"),
        paste0("publication = ", q(pub)),
        paste0("publication_short = ", q(pub)),
        paste0("abstract = ", q(if (abstract && !is.na(fld(x, "abstract"))) fld(x, "abstract") else "")),
        paste0("doi = ", q(coalesce(fld(x, "doi"), ""))),
        "featured = false",
        paste0("tags = [", paste(sapply(tags, q), collapse = ", "), "]"),
        paste0("url_pdf = ", q(url_pdf)),
        paste0("url_source = ", q(url_source)),
        "url_code = \"\"",
        "url_dataset = \"\"",
        "+++"
      )
      writeLines(lines, fileConn, useBytes = FALSE)
    }

    # cite.bib : l'entrée seule, pour le bouton "Cite"
    df_entry <- as.data.frame(as.list(x), stringsAsFactors = FALSE) %>%
      select(-pubtype) %>%
      select(where(~ !is.na(.x))) %>%
      column_to_rownames("rowname")
    WriteBib(as.BibEntry(df_entry[1, ]), file.path(outsubfold, "cite.bib"), verbose = FALSE)
  }

  invisible(apply(mypubs, MARGIN = 1, FUN = create_md))
  message(nrow(mypubs), " publications générées dans ", outfold)
}
