library(ggplot2)

small <- read.table("data/small.txt", col.names = c("Wavelength", "Reflectance"))
medium <- read.table("data/medium.txt", col.names = c("Wavelength", "Reflectance"))
coarse <- read.table("data/coarse.txt", col.names = c("Wavelength", "Reflectance"))

small$GrainSize <- "Small"
medium$GrainSize <- "Medium"
coarse$GrainSize <- "Coarse"

snow <- rbind(small, medium, coarse)

ggplot(snow, aes(Wavelength, Reflectance, colour = GrainSize)) +
  geom_line() +
  scale_x_continuous(limits = c(0.3, 2.0)) +
  geom_vline(linetype = "dashed", xintercept = 1064e-3) +
  geom_vline(linetype = "dashed", xintercept = 1550e-3) +
  scale_color_discrete(guide = guide_legend(title = "Grain size")) +
  xlab("Wavelength (µm)") +
  ylab("Reflecance (%)") +
  ggtitle("Reflectance of snow, with two common LiDAR wavelengths marked")
ggsave("img/reflectance.png")
