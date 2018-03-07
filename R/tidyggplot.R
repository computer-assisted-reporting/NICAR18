## load tidyverse
suppressPackageStartupMessages(library(tidyverse))

## set ggplot2 theme
theme_set(
  theme_minimal(base_size = 15, base_family = "Roboto Condensed") +
    theme(
      legend.position = "none",
      plot.background = element_rect(colour = "#F6F8FA", fill = "#F6F8FA"),
      panel.background = element_rect(fill = "#F6F8FA", colour = "#F6F8FA"),
      panel.grid.major = element_line(colour = "#cccccc", size = rel(0.3)),
      panel.grid.minor = element_line(colour = "#cccccc", size = rel(0.15)),
      axis.text = element_text(colour = "#222222"),
      plot.title = element_text(size = rel(1.7), face = "bold"),
      plot.subtitle = element_text(size = rel(1.3)),
      plot.caption = element_text(colour = "#444444"))
)
