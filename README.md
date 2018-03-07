NICAR18 Tweets
==============
================

-   [Data](#data)
    -   [rtweet](#rtweet)
    -   [Search](#search)
-   [Explore](#explore)
    -   [Tweet frequency over time](#tweet-frequency-over-time)
    -   [Positive/negative sentiment](#positivenegative-sentiment)
    -   [Semantic networks](#semantic-networks)

This is a dedicated repository for tracking [\#NICAR18 tweets](https://twitter.com/hashtag/NICAR18?f=tweets&vertical=default&src=hash) (the official hashtag of 2018 annual Computer-Assisted Reporting Conference).

Data
----

### rtweet

Whether you lookup the status IDs or search/stream new tweets, you'll need to make sure to install the [rtweet](http://rtweet.info) package. The code below will install \[if it's not already\] and load rtweet.

``` r
## install rtweet if not already
if (!requireNamespace("rtweet", quietly = TRUE)) {
  install.packages("rtweet")
}

## load rtweet
library(rtweet)
```

Our data collection method is described in detail below. However, if you want to get straight to the data, simply run the following code:

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

One of the easiest ways to gather Twitter data is to search for the data (using Twitter's REST API). Unlike streaming, searching makes it possible to go back in time. Unfortunately, Twitter sets a rather restrictive cap–roughly nine days–on how far back you can go. Regardless, searching for tweets is often the preferred method. For example, the code below is setup in such a way that it can be executed once \[or even several times\] a day throughout the conference. See the [R code here](R/search.R).

Here's some example code showing what essentially we're doing to collect the data:

``` r
## search terms
nicar18conf <- c("NICAR18", "NICAR2018", "IRE_NICAR")

## search for up to 10,000 tweets mentioning nicar18
rt <- search_tweets(paste(nicar18conf, collapse = " OR "), n = 10000)
```

Explore
-------

To explore the Twitter data, we recommend using the [tidyverse](http://tidyverse.org) packages. We're also using a customized [ggplot2](http://ggplot2.org) theme. See the [R code here](R/tidyggplot.R).

### Tweet frequency over time

To create the image below, the data were summarized into a time series-like data frame and then plotted in order depict the frequency of tweets–aggregated in two-hour intevals–about \#nicar18 over time. See the [R code here](R/ts.R).

<p align="center">
<img width="100%" height="auto" src="img/timefreq.png" />
</p>
 

### Positive/negative sentiment

Next, some sentiment analysis of the tweets so far. See the [R code here](R/sentiment.R).

<p align="center">
<img width="100%" height="auto" src="img/sentiment.png" />
</p>
 

### Semantic networks

The image below depicts a quick and dirty visualization of the semantic network (connections via retweet, quote, mention, or reply) as it is observed in the data. See the [R code here](R/network.R).

<p align="center">
<img width="100%" height="auto" src="img/network.png" />
</p>
 

Ideally, the network visualization would be an interactive, searchable graphic. Since it's not, I've printed out the node size values below.

|  rank| screen\_name                                                       |  log\_n|
|-----:|:-------------------------------------------------------------------|-------:|
|     1| <a href="https://twitter.com/IRE_NICAR">@IRE\_NICAR</a>            |   5.705|
|     2| <a href="https://twitter.com/jeremybowers">@jeremybowers</a>       |   3.303|
|     3| <a href="https://twitter.com/MacDiva">@MacDiva</a>                 |   3.195|
|     4| <a href="https://twitter.com/DougHaddix">@DougHaddix</a>           |   3.157|
|     5| <a href="https://twitter.com/sarhutch">@sarhutch</a>               |   3.080|
|     6| <a href="https://twitter.com/knightlab">@knightlab</a>             |   3.080|
|     7| <a href="https://twitter.com/bymarkwalker">@bymarkwalker</a>       |   3.001|
|     8| <a href="https://twitter.com/sharon000">@sharon000</a>             |   2.917|
|     9| <a href="https://twitter.com/charlesminshew">@charlesminshew</a>   |   2.917|
|    10| <a href="https://twitter.com/mgafni">@mgafni</a>                   |   2.831|
|    11| <a href="https://twitter.com/asduner">@asduner</a>                 |   2.831|
|    12| <a href="https://twitter.com/JSKstanford">@JSKstanford</a>         |   2.786|
|    13| <a href="https://twitter.com/thomasgpadilla">@thomasgpadilla</a>   |   2.786|
|    14| <a href="https://twitter.com/rachel_shorey">@rachel\_shorey</a>    |   2.786|
|    15| <a href="https://twitter.com/myersjustinc">@myersjustinc</a>       |   2.740|
|    16| <a href="https://twitter.com/miriamkp">@miriamkp</a>               |   2.740|
|    17| <a href="https://twitter.com/albertocairo">@albertocairo</a>       |   2.692|
|    18| <a href="https://twitter.com/DrewOCCRP">@DrewOCCRP</a>             |   2.644|
|    19| <a href="https://twitter.com/palewire">@palewire</a>               |   2.644|
|    20| <a href="https://twitter.com/gebeloffnyt">@gebeloffnyt</a>         |   2.594|
|    21| <a href="https://twitter.com/sarambsimon">@sarambsimon</a>         |   2.594|
|    22| <a href="https://twitter.com/Danict89">@Danict89</a>               |   2.594|
|    23| <a href="https://twitter.com/kristinhussey1">@kristinhussey1</a>   |   2.378|
|    24| <a href="https://twitter.com/IJNet">@IJNet</a>                     |   2.319|
|    25| <a href="https://twitter.com/SStirling">@SStirling</a>             |   2.319|
|    26| <a href="https://twitter.com/KCnSunshineJam">@KCnSunshineJam</a>   |   2.258|
|    27| <a href="https://twitter.com/emamd">@emamd</a>                     |   2.258|
|    28| <a href="https://twitter.com/MaryJoWebster">@MaryJoWebster</a>     |   2.258|
|    29| <a href="https://twitter.com/lucyparsonslabs">@lucyparsonslabs</a> |   2.258|
|    30| <a href="https://twitter.com/JournalismSandy">@JournalismSandy</a> |   2.194|
|    31| <a href="https://twitter.com/opennews">@opennews</a>               |   2.194|
|    32| <a href="https://twitter.com/mtdukes">@mtdukes</a>                 |   2.194|
|    33| <a href="https://twitter.com/sandhya__k">@sandhya\_\_k</a>         |   2.194|
|    34| <a href="https://twitter.com/ultracasual">@ultracasual</a>         |   2.127|
|    35| <a href="https://twitter.com/bugsact">@bugsact</a>                 |   2.127|
|    36| <a href="https://twitter.com/AxiosVisuals">@AxiosVisuals</a>       |   2.127|
|    37| <a href="https://twitter.com/NYTInteractive">@NYTInteractive</a>   |   2.057|
|    38| <a href="https://twitter.com/saleemkhan">@saleemkhan</a>           |   2.057|
|    39| <a href="https://twitter.com/JoeGermuska">@JoeGermuska</a>         |   2.057|
|    40| <a href="https://twitter.com/JadJaffar">@JadJaffar</a>             |   1.983|
|    41| <a href="https://twitter.com/CaitMcGlade">@CaitMcGlade</a>         |   1.983|
|    42| <a href="https://twitter.com/city_bureau">@city\_bureau</a>        |   1.983|
|    43| <a href="https://twitter.com/JOVRNALISM">@JOVRNALISM</a>           |   1.983|
|    44| <a href="https://twitter.com/ChiDM">@ChiDM</a>                     |   1.983|
|    45| <a href="https://twitter.com/christinezhang">@christinezhang</a>   |   1.983|
|    46| <a href="https://twitter.com/Lindenberger">@Lindenberger</a>       |   1.905|
|    47| <a href="https://twitter.com/citizenkrans">@citizenkrans</a>       |   1.905|
|    48| <a href="https://twitter.com/TWallack">@TWallack</a>               |   1.905|
|    49| <a href="https://twitter.com/TimBroderick">@TimBroderick</a>       |   1.905|
|    50| <a href="https://twitter.com/amber_waves">@amber\_waves</a>        |   1.822|
|    51| <a href="https://twitter.com/PBienenfeld">@PBienenfeld</a>         |   1.822|
|    52| <a href="https://twitter.com/morisy">@morisy</a>                   |   1.822|
|    53| <a href="https://twitter.com/martinstabe">@martinstabe</a>         |   1.822|
|    54| <a href="https://twitter.com/gerald_arthur">@gerald\_arthur</a>    |   1.732|
|    55| <a href="https://twitter.com/derekeder">@derekeder</a>             |   1.732|
|    56| <a href="https://twitter.com/abtran">@abtran</a>                   |   1.732|
|    57| <a href="https://twitter.com/ByNinaMartin">@ByNinaMartin</a>       |   1.732|
|    58| <a href="https://twitter.com/npenzenstadler">@npenzenstadler</a>   |   1.732|
|    59| <a href="https://twitter.com/ChiAppleseed">@ChiAppleseed</a>       |   1.732|
|    60| <a href="https://twitter.com/Orla_McCaffrey">@Orla\_McCaffrey</a>  |   1.636|
|    61| <a href="https://twitter.com/justinJprice">@justinJprice</a>       |   1.636|
|    62| <a href="https://twitter.com/allisonsross">@allisonsross</a>       |   1.636|
|    63| <a href="https://twitter.com/SooOh">@SooOh</a>                     |   1.636|
|    64| <a href="https://twitter.com/Disha_RC">@Disha\_RC</a>              |   1.636|
|    65| <a href="https://twitter.com/stiles">@stiles</a>                   |   1.636|
|    66| <a href="https://twitter.com/ByJohnRRoby">@ByJohnRRoby</a>         |   1.531|
|    67| <a href="https://twitter.com/tiffehr">@tiffehr</a>                 |   1.531|
|    68| <a href="https://twitter.com/davidherzog">@davidherzog</a>         |   1.531|
|    69| <a href="https://twitter.com/DJNF">@DJNF</a>                       |   1.531|
|    70| <a href="https://twitter.com/kleinmatic">@kleinmatic</a>           |   1.414|
|    71| <a href="https://twitter.com/jasongrotto">@jasongrotto</a>         |   1.414|
|    72| <a href="https://twitter.com/mattdrange">@mattdrange</a>           |   1.414|
|    73| <a href="https://twitter.com/ChadSDay">@ChadSDay</a>               |   1.414|
|    74| <a href="https://twitter.com/merbroussard">@merbroussard</a>       |   1.414|
|    75| <a href="https://twitter.com/jonkeegan">@jonkeegan</a>             |   1.414|
|    76| <a href="https://twitter.com/MikeStucka">@MikeStucka</a>           |   1.414|
|    77| <a href="https://twitter.com/kschorsch">@kschorsch</a>             |   1.414|
|    78| <a href="https://twitter.com/brentajones">@brentajones</a>         |   1.282|
|    79| <a href="https://twitter.com/dataeditor">@dataeditor</a>           |   1.282|
|    80| <a href="https://twitter.com/WSJGraphics">@WSJGraphics</a>         |   1.282|
|    81| <a href="https://twitter.com/elliot_bentley">@elliot\_bentley</a>  |   1.282|
|    82| <a href="https://twitter.com/write_this_way">@write\_this\_way</a> |   1.282|
|    83| <a href="https://twitter.com/SamanthaSunne">@SamanthaSunne</a>     |   1.282|
|    84| <a href="https://twitter.com/becca_aa">@becca\_aa</a>              |   1.282|
|    85| <a href="https://twitter.com/hunter_owens">@hunter\_owens</a>      |   1.129|
|    86| <a href="https://twitter.com/MateoClarke">@MateoClarke</a>         |   1.129|
|    87| <a href="https://twitter.com/UO_Catalyst">@UO\_Catalyst</a>        |   1.129|
|    88| <a href="https://twitter.com/forestgregg">@forestgregg</a>         |   1.129|
|    89| <a href="https://twitter.com/AditiHBhandari">@AditiHBhandari</a>   |   1.129|
|    90| <a href="https://twitter.com/MadiLAlexander">@MadiLAlexander</a>   |   1.129|
|    91| <a href="https://twitter.com/KarrieKehoe">@KarrieKehoe</a>         |   0.944|
|    92| <a href="https://twitter.com/kissane">@kissane</a>                 |   0.944|
|    93| <a href="https://twitter.com/EvaConstantaras">@EvaConstantaras</a> |   0.702|
|    94| <a href="https://twitter.com/robertrdenton">@robertrdenton</a>     |   0.702|
|    95| <a href="https://twitter.com/cbaxter1">@cbaxter1</a>               |   0.702|
|    96| <a href="https://twitter.com/zammagazine">@zammagazine</a>         |   0.702|
|    97| <a href="https://twitter.com/MargotWilliams">@MargotWilliams</a>   |   0.702|
|    98| <a href="https://twitter.com/_thetextfiles">@\_thetextfiles</a>    |   0.702|
|    99| <a href="https://twitter.com/pinardag">@pinardag</a>               |   0.702|
|   100| <a href="https://twitter.com/mediatwit">@mediatwit</a>             |   0.333|
|   101| <a href="https://twitter.com/MediaShiftOrg">@MediaShiftOrg</a>     |   0.333|
|   102| <a href="https://twitter.com/StefanieMurray">@StefanieMurray</a>   |   0.333|
|   103| <a href="https://twitter.com/FrancescaFionda">@FrancescaFionda</a> |   0.333|
|   104| <a href="https://twitter.com/j_la28">@j\_la28</a>                  |   0.333|
|   105| <a href="https://twitter.com/DiannaNanez">@DiannaNanez</a>         |   0.333|
