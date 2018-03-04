\#NICAR18 Tweets
================
A repository for tracking [\#NICAR18
tweets](https://twitter.com/hashtag/NICAR18?f=tweets&vertical=default&src=hash),
the official hashtag of 2018 annual Computer-Assisted Reporting
Conference.

## Data

### rtweet

Whether you lookup the status IDs or search/stream new tweets, you’ll
need to make sure to install the [rtweet](http://rtweet.info) package.
The code below will install \[if it’s not already\] and load rtweet.

``` r
## install rtweet if not already
if (!requireNamespace("rtweet", quietly = TRUE)) {
  install.packages("rtweet")
}

## load rtweet
library(rtweet)
```

Our data collection method is described in detail below. However, if you
want to get straight to the data, simply run the following code:

``` r
## download status IDs file
download.file(
  "https://github.com/computer-assisted-reporting/NICAR18/blob/master/data/search-ids.rds?raw=true",
  "NICAR18_status_ids.rds"
)

## read status IDs fromdownloaded file
ids <- readRDS("NICAR18_status_ids.rds")

## lookup data associated with status ids
rt <- rtweet::lookup_tweets(ids$status_id)
```

### Search

One of the easiest ways to gather Twitter data is to search for the data
(using Twitter’s REST API). Unlike streaming, searching makes it
possible to go back in time. Unfortunately, Twitter sets a rather
restrictive cap–roughly nine days–on how far back you can go.
Regardless, searching for tweets is often the preferred method. For
example, the code below is setup in such a way that it can be executed
once \[or even several times\] a day throughout the conference.

``` r
## search terms
nicar18conf <- c("NICAR18", "NICAR2018", "IRE_NICAR")

## use since_id from previous search (if exists)
if (file.exists(file.path("data", "search.rds"))) {
  since_id <- readRDS(file.path("data", "search.rds"))
  since_id <- since_id$status_id[1]
} else {
  since_id <- NULL
}

## search for up to 100,000 tweets mentioning nicar18
rt <- search_tweets(
  paste(nicar18conf, collapse = " OR "),
  n = 1e5, verbose = FALSE,
  since_id = since_id,
  retryonratelimit = TRUE
)

## if there's already a search data file saved, then read it in,
## drop the duplicates, and then update the `rt` data object
if (file.exists(file.path("data", "search.rds"))) {

  ## bind rows (for tweets AND users data)
  rt <- do_call_rbind(
    list(rt, readRDS(file.path("data", "search.rds"))))

  ## determine whether each observation has a unique status ID
  kp <- !duplicated(rt$status_id)

  ## only keep rows (observations) with unique status IDs
  users <- users_data(rt)[kp, ]

  ## the rows of users should correspond with the tweets
  rt <- rt[kp, ]

  ## restore as users attribute
  attr(rt, "users") <- users
}

## save the data
saveRDS(rt, file.path("data", "search.rds"))

## save shareable data (only status_ids)
saveRDS(rt[, "status_id"], file.path("data", "search-ids.rds"))
```

## Explore

To explore the Twitter data, we recommend using the
[tidyverse](http://tidyverse.org) packages. In the code below, we’ve
also included our customized [ggplot2](http://ggplot2.org) theme.

``` r
## load tidyverse
suppressPackageStartupMessages(library(tidyverse))

## set ggplot2 theme
theme_set(
  theme_minimal(base_size = 15, base_family = "Roboto Condensed") +
  theme(
    legend.position = "none",
    plot.background = element_rect(colour = "#F6F8FA", fill = "#F6F8FA"),
    panel.background = element_rect(fill = "#F6F8FA", colour = "#F6F8FA"),
    panel.grid.major = element_line(colour = "#cccccc"),
    panel.grid.minor = element_line(colour = "#cccccc"),
    axis.text = element_text(colour = "#222222"),
    plot.title = element_text(size = rel(1.7), face = "bold"),
    plot.subtitle = element_text(size = rel(1.3)),
    plot.caption = element_text(colour = "#444444"))
)
```

### Tweet frequency over time

In the code below, the data are summarized into a time series-like data
frame and then plotted in order depict the frequency of
tweets–aggregated in two-hour intevals–about \#nicar18 over time.

``` r
p <- rt %>%
  filter(created_at > "2018-01-29") %>%
  ts_plot("2 hours", color = "transparent") +
  geom_smooth(method = "loess", se = FALSE, span = .1,
  size = 1.75, colour = "#0066aa") +
  geom_point(size = 4.5,
    shape = 21, fill = "#ADFF2F99", colour = "#000000dd") +
  labs(title = "Frequency of #NICAR18 tweets over time",
    subtitle = "Twitter status counts aggregated in two-hour intervals",
    caption = "\n\nSource: Data gathered via Twitter's standard `search/tweets` API using rtweet",
    x = NULL, y = NULL)
ggsave("img/timefreq.png", p, width = 9, height = 7, units = "in")
```

<p align="center">

<img width="100%" height="auto" src="img/timefreq.png" />

</p>

 

### Positive/negative sentiment

Next, some sentiment analysis of the tweets so far.

``` r
## clean up the text a bit (rm mentions and links)
rt$text2 <- gsub(
  "^RT:?\\s{0,}|#|@\\S+|https?[[:graph:]]+", "", rt$text)
## convert to lower case
rt$text2 <- tolower(rt$text2)
## trim extra white space
rt$text2 <- gsub("^\\s{1,}|\\s{1,}$", "", rt$text2)
rt$text2 <- gsub("\\s{2,}", " ", rt$text2)

## estimate pos/neg sentiment for each tweet
rt$sentiment <- syuzhet::get_sentiment(rt$text2, "syuzhet")

## write function to round time into rounded var
round_time <- function(x, sec) {
  as.POSIXct(hms::hms(as.numeric(x) %/% sec * sec))
}

## plot by specified time interval (1-hours)
p <- rt %>%
  mutate(time = round_time(created_at, 60 * 60)) %>%
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
    subtitle = "Mean sentiment of tweets aggregated in one-hour intervals",
    caption = "\nSource: Data gathered using rtweet. Sentiment analysis done using syuzhet")

ggsave("img/sentiment.png", p, width = 9, height = 7, units = "in")
```

<p align="center">

<img width="100%" height="auto" src="img/sentiment.png" />

</p>

 

### Semantic networks

The code below provides a quick and dirty visualization of the semantic
network (connections via retweet, quote, mention, or reply) found in the
data.

``` r
## unlist observations into long-form data frame
unlist_df <- function(...) {
  dots <- lapply(list(...), unlist)
  tibble::as_tibble(dots)
}

## iterate by row
row_dfs <- lapply(
  seq_len(nrow(rt)), function(i)
    unlist_df(from_screen_name = rt$screen_name[i],
      reply = rt$reply_to_screen_name[i],
      mention = rt$mentions_screen_name[i],
      quote = rt$quoted_screen_name[i],
      retweet = rt$retweet_screen_name[i])
)

## bind rows, gather (to long), convert to matrix, and filter out NAs
rdf <- dplyr::bind_rows(row_dfs)
rdf <- tidyr::gather(rdf, interaction_type, to_screen_name, -from_screen_name)
mat <- as.matrix(rdf[, -2])
mat <- mat[apply(mat, 1, function(i) !any(is.na(i))), ]

## get rid of self references
mat <- mat[mat[, 1] != mat[, 2], ]

## filter out users who don't appear in RHS at least 3 times
apps1 <- table(mat[, 1])
apps1 <- apps1[apps1 > 1L]
apps2 <- table(mat[, 2])
apps2 <- apps2[apps2 > 1L]
apps <- names(apps1)[names(apps1) %in% names(apps2)]
mat <- mat[mat[, 1] %in% apps & mat[, 2] %in% apps, ]

## create graph object
g <- igraph::graph_from_edgelist(mat)

## calculate size attribute (and transform to fit)
matcols <- factor(c(mat[, 1], mat[, 2]), levels = names(igraph::V(g)))
size <- table(screen_name = matcols)
size <- (log(size) + sqrt(size)) / 3

## reorder freq table
size <- size[match(names(size), names(igraph::V(g)))]

## plot network
png("img/network.png", width = 32, height = 32, units = "in", res = 300)
par(mar = c(12, 6, 15, 6), bg = "#F6F8FA")
plot(g,
  edge.size = .4,
  curved = FALSE,
  margin = -.05,
  edge.arrow.size = 0,
  edge.arrow.width = 0,
  vertex.color = "#ADFF2F99",
  vertex.size = size,
  vertex.frame.color = "#003366",
  vertex.label.color = "#003366",
  vertex.label.cex = .8,
  vertex.label.family = "Roboto Condensed",
  edge.color = "#0066aa",
  edge.width = .2,
  main = "")
par(mar = c(9, 6, 9, 6))
title("Semantic network of users tweeting about #NICAR18",
  adj = 0, family = "Roboto Condensed", cex.main = 6.5)
mtext("Source: Data gathered using rtweet. Network analysis done using igraph",
  side = 1, line = 0, adj = 1.0, cex = 3.8,
  family = "Roboto Condensed", col = "#222222")
mtext("User connections by mentions, replies, retweets, and quotes",
  side = 3, line = -4.25, adj = 0,
  family = "Roboto Condensed", cex = 4.9)
dev.off()
#> quartz_off_screen 
#>                 2
```

<p align="center">

<img width="100%" height="auto" src="img/network.png" />

</p>

 

Ideally, the network visualization would be an interactive, searchable
graphic. Since it’s not, I’ve printed out the node size values below.

``` r
nodes <- as_tibble(sort(size, decreasing = TRUE))
nodes$rank <- seq_len(nrow(nodes))
nodes$screen_name <- paste0(
  '<a href="https://twitter.com/', nodes$screen_name, 
  '">@', nodes$screen_name, '</a>')
nodes$n <- round(nodes$n, 3)
dplyr::select(nodes, rank, screen_name, log_n = n)
```

<div class="kable-table">

| rank | screen\_name                                                       | log\_n |
| ---: | :----------------------------------------------------------------- | -----: |
|    1 | <a href="https://twitter.com/IRE_NICAR">@IRE\_NICAR</a>            |  3.537 |
|    2 | <a href="https://twitter.com/DougHaddix">@DougHaddix</a>           |  3.080 |
|    3 | <a href="https://twitter.com/bymarkwalker">@bymarkwalker</a>       |  2.644 |
|    4 | <a href="https://twitter.com/MacDiva">@MacDiva</a>                 |  2.594 |
|    5 | <a href="https://twitter.com/knightlab">@knightlab</a>             |  2.594 |
|    6 | <a href="https://twitter.com/sarhutch">@sarhutch</a>               |  2.594 |
|    7 | <a href="https://twitter.com/Danict89">@Danict89</a>               |  2.434 |
|    8 | <a href="https://twitter.com/asduner">@asduner</a>                 |  2.194 |
|    9 | <a href="https://twitter.com/charlesminshew">@charlesminshew</a>   |  2.057 |
|   10 | <a href="https://twitter.com/mgafni">@mgafni</a>                   |  1.983 |
|   11 | <a href="https://twitter.com/lucyparsonslabs">@lucyparsonslabs</a> |  1.983 |
|   12 | <a href="https://twitter.com/JoeGermuska">@JoeGermuska</a>         |  1.983 |
|   13 | <a href="https://twitter.com/rachel_shorey">@rachel\_shorey</a>    |  1.983 |
|   14 | <a href="https://twitter.com/emamd">@emamd</a>                     |  1.983 |
|   15 | <a href="https://twitter.com/citizenkrans">@citizenkrans</a>       |  1.905 |
|   16 | <a href="https://twitter.com/opennews">@opennews</a>               |  1.905 |
|   17 | <a href="https://twitter.com/TWallack">@TWallack</a>               |  1.822 |
|   18 | <a href="https://twitter.com/martinstabe">@martinstabe</a>         |  1.822 |
|   19 | <a href="https://twitter.com/sandhya__k">@sandhya\_\_k</a>         |  1.732 |
|   20 | <a href="https://twitter.com/city_bureau">@city\_bureau</a>        |  1.636 |
|   21 | <a href="https://twitter.com/ChiAppleseed">@ChiAppleseed</a>       |  1.636 |
|   22 | <a href="https://twitter.com/stiles">@stiles</a>                   |  1.636 |
|   23 | <a href="https://twitter.com/Orla_McCaffrey">@Orla\_McCaffrey</a>  |  1.531 |
|   24 | <a href="https://twitter.com/palewire">@palewire</a>               |  1.414 |
|   25 | <a href="https://twitter.com/davidherzog">@davidherzog</a>         |  1.414 |
|   26 | <a href="https://twitter.com/derekeder">@derekeder</a>             |  1.282 |
|   27 | <a href="https://twitter.com/myersjustinc">@myersjustinc</a>       |  1.282 |
|   28 | <a href="https://twitter.com/DJNF">@DJNF</a>                       |  1.282 |
|   29 | <a href="https://twitter.com/becca_aa">@becca\_aa</a>              |  1.282 |
|   30 | <a href="https://twitter.com/forestgregg">@forestgregg</a>         |  1.129 |
|   31 | <a href="https://twitter.com/AditiHBhandari">@AditiHBhandari</a>   |  1.129 |
|   32 | <a href="https://twitter.com/MadiLAlexander">@MadiLAlexander</a>   |  1.129 |
|   33 | <a href="https://twitter.com/kissane">@kissane</a>                 |  0.944 |
|   34 | <a href="https://twitter.com/robertrdenton">@robertrdenton</a>     |  0.702 |
|   35 | <a href="https://twitter.com/MikeStucka">@MikeStucka</a>           |  0.702 |
|   36 | <a href="https://twitter.com/SamanthaSunne">@SamanthaSunne</a>     |  0.702 |
|   37 | <a href="https://twitter.com/jonkeegan">@jonkeegan</a>             |  0.702 |
|   38 | <a href="https://twitter.com/pinardag">@pinardag</a>               |  0.702 |
|   39 | <a href="https://twitter.com/kschorsch">@kschorsch</a>             |  0.333 |
|   40 | <a href="https://twitter.com/DiannaNanez">@DiannaNanez</a>         |  0.333 |

</div>

<style>
table {
  display: table;
  width: unset;
  margin: 0 auto;
  min-width: 50%;
}
</style>
