# Carte des terrains pour la page d'accueil.
# À lancer depuis la racine du projet : source("R/workmap.R")
# Produit static/images/workmap.png (3000 x 1500 px), qui remplace l'ancienne carte.
#
# À REMPLIR : colonne mode, "field" (travail sur place) ou "remote" (à distance).

library(rnaturalearth)
library(sf)
library(ggplot2)
library(dplyr)

sf_use_s2(FALSE)

work <- tibble::tribble(
  ~iso_a3, ~pole,                             ~mode,
  "MLI",   "Chad and the Sahel",              "field",
  "NER",   "Chad and the Sahel",              "field",
  "TCD",   "Chad and the Sahel",              "field",
  "NGA",   "Chad and the Sahel",              "remote",
  "CAF",   "Central Africa",                  "remote",
  "COD",   "Central Africa",                  "remote",
  "SYR",   "Middle East",                     "remote",
  "YEM",   "Middle East",                     "field",
  "PNG",   "Papua New Guinea and the Pacific", "field"
)


if (!all(work$mode %in% c("field", "remote"))) {
  stop("Remplir la colonne mode avec \"field\" ou \"remote\" pour chaque pays.")
}

world <- ne_countries(scale = "medium", returnclass = "sf")
pts <- world %>%
  inner_join(work, by = "iso_a3") %>%
  st_point_on_surface()

map <- ggplot() +
  geom_sf(data = world, fill = "white", colour = "grey8", linewidth = 0.1) +
  geom_sf(data = pts, aes(colour = pole, shape = mode), size = 3.2, stroke = 1.2) +
  scale_shape_manual(values = c(field = 16, remote = 1),
                     labels = c(field = "Fieldwork-informed research", remote = "Remote / desk research")) +
  scale_colour_manual(breaks = c("Chad and the Sahel", "Central Africa", "Middle East",
                                 "Papua New Guinea and the Pacific"),
                      values = c("Chad and the Sahel"               = "#B2182B",
                                 "Central Africa"                   = "#E08214",
                                 "Middle East"                      = "#2166AC",
                                 "Papua New Guinea and the Pacific" = "#1B7837")) +
  coord_sf(ylim = c(-58, 84), expand = FALSE) +
  theme_void() +
  theme(panel.background  = element_rect(fill = "#D0D0D0", colour = NA),
        plot.background   = element_rect(fill = "#D0D0D0", colour = NA),
        legend.position   = "bottom",
        legend.box        = "vertical",
        legend.title      = element_blank(),
        legend.text       = element_text(size = 11))

ggsave("static/images/workmap.png", map, width = 12, height = 6.6, dpi = 250)
