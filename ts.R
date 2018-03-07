## create ggplot object
p <- rt %>%
  filter(created_at > "2018-01-29") %>%
  ts_plot("2 hours", color = "transparent") +
  geom_smooth(method = "loess", se = FALSE, span = .1, size = 1.75, colour = "#0066aa") +
  geom_point(size = 4.5, shape = 21, fill = "#ADFF2F99", colour = "#000000dd") +
  labs(title = "Frequency of #NICAR18 tweets over time",
    subtitle = "Twitter status counts aggregated in two-hour intervals",
    caption = "\nSource: Data gathered via Twitter's standard `search/tweets` API using rtweet",
    x = NULL, y = NULL)

## save timefreq plot
ggsave("img/timefreq.png", p, width = 9, height = 7, units = "in")
