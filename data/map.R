library(ggplot2)
install.packages("rnaturalearthdata")
library(rnaturalearth)
library(readr)

# Lieux
locations <- read_csv("C:/Users/camil/Documents/PersonnalWebsite/data/locations.csv")

# Carte du monde
world <- rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")

p <- ggplot(data = world) +
  geom_sf(fill = "#fafafa", color = "#cccccc") +          # soft land + borders
  geom_point(
    data = locations, 
    aes(x = lng, y = lat),
    color = "#d23a3a", fill = "white", shape = 21, size = 2, stroke = 0.8
  ) +
  theme_void()  


ggsave("static/images/workmap.png", plot = p, width = 10, height = 5)