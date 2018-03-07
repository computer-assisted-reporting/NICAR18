## clean up the text a bit (rm mentions and links)
rt$text2 <- gsub(
  "^RT:?\\s{0,}|#\\S+|@\\S+|https?[[:graph:]]+", "", rt$text)
## convert to lower case
rt$text2 <- tolower(rt$text2)
## trim extra white space
rt$text2 <- gsub("^\\s{1,}|\\s{1,}$", "", rt$text2)
rt$text2 <- gsub("\\s{2,}", " ", rt$text2)

## estimate pos/neg sentiment for each tweet using 3 different methods
rt$sentiment1 <- syuzhet::get_sentiment(rt$text2, "bing")
rt$sentiment2 <- syuzhet::get_sentiment(rt$text2, "syuzhet")
rt$sentiment3 <- syuzhet::get_sentiment(rt$text2, "afinn")

## average sentiment scores into single score per obs
rt$sentiment <- (scale(rt$sentiment1)[, 1] +
    scale(rt$sentiment2)[, 1] + scale(rt$sentiment3)[, 1]) / 3

## define function to round time into rounded var
round_time <- function(x, sec) {
  as.POSIXct(hms::hms(as.numeric(x) %/% sec * sec))
}

## plot by specified time interval (3-hours)
p <- rt %>%
  mutate(time = round_time(created_at, 60 * 60 * 3)) %>%
  group_by(time) %>%
  summarise(sentiment = mean(sentiment, na.rm = TRUE)) %>%
  mutate(valence = ifelse(sentiment > 0L, "Positive", "Negative")) %>%
  ggplot(aes(x = time, y = sentiment)) +
  geom_smooth(method = "loess", span = .1,
    colour = "#aa11aadd", fill = "#bbbbbb11") +
  geom_point(aes(fill = valence, colour = valence),
    shape = 21, alpha = .6, size = 3.5) +
  scale_fill_manual(
    values = c(Positive = "#2244ee", Negative = "#dd2222")) +
  scale_colour_manual(
    values = c(Positive = "#001155", Negative = "#550000")) +
  labs(x = NULL, y = NULL,
    title = "Sentiment (valence) of #NICAR18 tweets over time",
    subtitle = "Mean sentiment of tweets aggregated in three-hour intervals",
    caption = "\nSource: Data gathered using rtweet. Sentiment analysis done using syuzhet")

## save sentiment plot image
ggsave("img/sentiment.png", p, width = 9, height = 7, units = "in")
