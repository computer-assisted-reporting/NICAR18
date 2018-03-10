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

|  rank| screen\_name                                                         |  log\_n|
|-----:|:---------------------------------------------------------------------|-------:|
|     1| <a href="https://twitter.com/IRE_NICAR">@IRE\_NICAR</a>              |   9.566|
|     2| <a href="https://twitter.com/MacDiva">@MacDiva</a>                   |   8.951|
|     3| <a href="https://twitter.com/Danict89">@Danict89</a>                 |   8.709|
|     4| <a href="https://twitter.com/albertocairo">@albertocairo</a>         |   7.555|
|     5| <a href="https://twitter.com/dataeditor">@dataeditor</a>             |   7.075|
|     6| <a href="https://twitter.com/susannahlocke">@susannahlocke</a>       |   6.967|
|     7| <a href="https://twitter.com/asduner">@asduner</a>                   |   6.942|
|     8| <a href="https://twitter.com/rachelwalexande">@rachelwalexande</a>   |   6.494|
|     9| <a href="https://twitter.com/barbaramaseda">@barbaramaseda</a>       |   6.453|
|    10| <a href="https://twitter.com/itsgeorrge">@itsgeorrge</a>             |   6.412|
|    11| <a href="https://twitter.com/martinstabe">@martinstabe</a>           |   6.246|
|    12| <a href="https://twitter.com/christinezhang">@christinezhang</a>     |   6.174|
|    13| <a href="https://twitter.com/mizzousundevil">@mizzousundevil</a>     |   6.146|
|    14| <a href="https://twitter.com/myersjustinc">@myersjustinc</a>         |   6.058|
|    15| <a href="https://twitter.com/AditiHBhandari">@AditiHBhandari</a>     |   5.984|
|    16| <a href="https://twitter.com/sandhya__k">@sandhya\_\_k</a>           |   5.877|
|    17| <a href="https://twitter.com/LNdata">@LNdata</a>                     |   5.816|
|    18| <a href="https://twitter.com/greglinch">@greglinch</a>               |   5.640|
|    19| <a href="https://twitter.com/Cezary">@Cezary</a>                     |   5.624|
|    20| <a href="https://twitter.com/iff_or">@iff\_or</a>                    |   5.608|
|    21| <a href="https://twitter.com/Riogringa">@Riogringa</a>               |   5.542|
|    22| <a href="https://twitter.com/hadleywickham">@hadleywickham</a>       |   5.474|
|    23| <a href="https://twitter.com/charlesornstein">@charlesornstein</a>   |   5.423|
|    24| <a href="https://twitter.com/ultracasual">@ultracasual</a>           |   5.371|
|    25| <a href="https://twitter.com/fvaraorta">@fvaraorta</a>               |   5.283|
|    26| <a href="https://twitter.com/digiphile">@digiphile</a>               |   5.229|
|    27| <a href="https://twitter.com/sarhutch">@sarhutch</a>                 |   5.193|
|    28| <a href="https://twitter.com/sharon000">@sharon000</a>               |   5.175|
|    29| <a href="https://twitter.com/datentaeterin">@datentaeterin</a>       |   5.138|
|    30| <a href="https://twitter.com/DougHaddix">@DougHaddix</a>             |   5.119|
|    31| <a href="https://twitter.com/TWallack">@TWallack</a>                 |   5.082|
|    32| <a href="https://twitter.com/JSKstanford">@JSKstanford</a>           |   5.082|
|    33| <a href="https://twitter.com/jkteoh">@jkteoh</a>                     |   5.025|
|    34| <a href="https://twitter.com/palewire">@palewire</a>                 |   4.986|
|    35| <a href="https://twitter.com/PatrickMGarvin">@PatrickMGarvin</a>     |   4.947|
|    36| <a href="https://twitter.com/dancow">@dancow</a>                     |   4.908|
|    37| <a href="https://twitter.com/salcedonews">@salcedonews</a>           |   4.808|
|    38| <a href="https://twitter.com/NataliaMazotte">@NataliaMazotte</a>     |   4.808|
|    39| <a href="https://twitter.com/derekwillis">@derekwillis</a>           |   4.746|
|    40| <a href="https://twitter.com/carla_astudi">@carla\_astudi</a>        |   4.704|
|    41| <a href="https://twitter.com/jazzmyth">@jazzmyth</a>                 |   4.683|
|    42| <a href="https://twitter.com/merbroussard">@merbroussard</a>         |   4.662|
|    43| <a href="https://twitter.com/dhmontgomery">@dhmontgomery</a>         |   4.641|
|    44| <a href="https://twitter.com/SStirling">@SStirling</a>               |   4.576|
|    45| <a href="https://twitter.com/emamd">@emamd</a>                       |   4.576|
|    46| <a href="https://twitter.com/jeremycaplan">@jeremycaplan</a>         |   4.576|
|    47| <a href="https://twitter.com/kbmiami">@kbmiami</a>                   |   4.576|
|    48| <a href="https://twitter.com/nausheenhusain">@nausheenhusain</a>     |   4.554|
|    49| <a href="https://twitter.com/jonkeegan">@jonkeegan</a>               |   4.554|
|    50| <a href="https://twitter.com/Maid_Marianne">@Maid\_Marianne</a>      |   4.532|
|    51| <a href="https://twitter.com/paldhous">@paldhous</a>                 |   4.510|
|    52| <a href="https://twitter.com/chrishagan">@chrishagan</a>             |   4.510|
|    53| <a href="https://twitter.com/ucbsoj">@ucbsoj</a>                     |   4.510|
|    54| <a href="https://twitter.com/mjbeckel">@mjbeckel</a>                 |   4.465|
|    55| <a href="https://twitter.com/AnnaFlagg">@AnnaFlagg</a>               |   4.442|
|    56| <a href="https://twitter.com/_erinmansfield">@\_erinmansfield</a>    |   4.419|
|    57| <a href="https://twitter.com/cerealcommas">@cerealcommas</a>         |   4.396|
|    58| <a href="https://twitter.com/jrue">@jrue</a>                         |   4.396|
|    59| <a href="https://twitter.com/readelev">@readelev</a>                 |   4.373|
|    60| <a href="https://twitter.com/charlesminshew">@charlesminshew</a>     |   4.373|
|    61| <a href="https://twitter.com/MaryJoWebster">@MaryJoWebster</a>       |   4.350|
|    62| <a href="https://twitter.com/NewsbySchmidt">@NewsbySchmidt</a>       |   4.350|
|    63| <a href="https://twitter.com/knightlab">@knightlab</a>               |   4.350|
|    64| <a href="https://twitter.com/grovesprof">@grovesprof</a>             |   4.326|
|    65| <a href="https://twitter.com/theboysmithy">@theboysmithy</a>         |   4.326|
|    66| <a href="https://twitter.com/_thetextfiles">@\_thetextfiles</a>      |   4.278|
|    67| <a href="https://twitter.com/losowsky">@losowsky</a>                 |   4.278|
|    68| <a href="https://twitter.com/JonSCollins">@JonSCollins</a>           |   4.278|
|    69| <a href="https://twitter.com/Jeremy_CF_Lin">@Jeremy\_CF\_Lin</a>     |   4.254|
|    70| <a href="https://twitter.com/haddadme">@haddadme</a>                 |   4.230|
|    71| <a href="https://twitter.com/richgor">@richgor</a>                   |   4.230|
|    72| <a href="https://twitter.com/KarrieKehoe">@KarrieKehoe</a>           |   4.180|
|    73| <a href="https://twitter.com/anlugonz">@anlugonz</a>                 |   4.180|
|    74| <a href="https://twitter.com/city_bureau">@city\_bureau</a>          |   4.180|
|    75| <a href="https://twitter.com/otraletra">@otraletra</a>               |   4.155|
|    76| <a href="https://twitter.com/bymarkwalker">@bymarkwalker</a>         |   4.155|
|    77| <a href="https://twitter.com/maxharlow">@maxharlow</a>               |   4.130|
|    78| <a href="https://twitter.com/jonathanstray">@jonathanstray</a>       |   4.105|
|    79| <a href="https://twitter.com/fabiolatorres">@fabiolatorres</a>       |   4.053|
|    80| <a href="https://twitter.com/internetrebecca">@internetrebecca</a>   |   4.027|
|    81| <a href="https://twitter.com/LaSharah">@LaSharah</a>                 |   4.027|
|    82| <a href="https://twitter.com/ProPublica">@ProPublica</a>             |   4.000|
|    83| <a href="https://twitter.com/TaylorJHartz">@TaylorJHartz</a>         |   4.000|
|    84| <a href="https://twitter.com/derekeder">@derekeder</a>               |   3.974|
|    85| <a href="https://twitter.com/jeremybowers">@jeremybowers</a>         |   3.947|
|    86| <a href="https://twitter.com/areena_arora">@areena\_arora</a>        |   3.947|
|    87| <a href="https://twitter.com/macloo">@macloo</a>                     |   3.920|
|    88| <a href="https://twitter.com/ChadSDay">@ChadSDay</a>                 |   3.920|
|    89| <a href="https://twitter.com/pickoffwhite">@pickoffwhite</a>         |   3.920|
|    90| <a href="https://twitter.com/sarambsimon">@sarambsimon</a>           |   3.892|
|    91| <a href="https://twitter.com/derekkravitz">@derekkravitz</a>         |   3.864|
|    92| <a href="https://twitter.com/rachel_shorey">@rachel\_shorey</a>      |   3.864|
|    93| <a href="https://twitter.com/knightfdn">@knightfdn</a>               |   3.864|
|    94| <a href="https://twitter.com/giannagruen">@giannagruen</a>           |   3.836|
|    95| <a href="https://twitter.com/fexi">@fexi</a>                         |   3.836|
|    96| <a href="https://twitter.com/djordjepadejski">@djordjepadejski</a>   |   3.836|
|    97| <a href="https://twitter.com/mtdukes">@mtdukes</a>                   |   3.836|
|    98| <a href="https://twitter.com/opennews">@opennews</a>                 |   3.836|
|    99| <a href="https://twitter.com/ndiakopoulos">@ndiakopoulos</a>         |   3.808|
|   100| <a href="https://twitter.com/SophieWarnes">@SophieWarnes</a>         |   3.808|
|   101| <a href="https://twitter.com/ofadam">@ofadam</a>                     |   3.779|
|   102| <a href="https://twitter.com/SunFoundation">@SunFoundation</a>       |   3.779|
|   103| <a href="https://twitter.com/brentajones">@brentajones</a>           |   3.750|
|   104| <a href="https://twitter.com/chrisjeavans">@chrisjeavans</a>         |   3.750|
|   105| <a href="https://twitter.com/fcoel">@fcoel</a>                       |   3.721|
|   106| <a href="https://twitter.com/SamanthaSunne">@SamanthaSunne</a>       |   3.721|
|   107| <a href="https://twitter.com/carlosrvirgen">@carlosrvirgen</a>       |   3.721|
|   108| <a href="https://twitter.com/angshah">@angshah</a>                   |   3.691|
|   109| <a href="https://twitter.com/cephillips">@cephillips</a>             |   3.691|
|   110| <a href="https://twitter.com/alysiasanto">@alysiasanto</a>           |   3.691|
|   111| <a href="https://twitter.com/webjournalist">@webjournalist</a>       |   3.661|
|   112| <a href="https://twitter.com/TishaESPN">@TishaESPN</a>               |   3.661|
|   113| <a href="https://twitter.com/cpipr">@cpipr</a>                       |   3.661|
|   114| <a href="https://twitter.com/ByJohnRRoby">@ByJohnRRoby</a>           |   3.631|
|   115| <a href="https://twitter.com/omayasosa">@omayasosa</a>               |   3.600|
|   116| <a href="https://twitter.com/lamthuyvo">@lamthuyvo</a>               |   3.600|
|   117| <a href="https://twitter.com/marc_smith">@marc\_smith</a>            |   3.600|
|   118| <a href="https://twitter.com/nhannahjones">@nhannahjones</a>         |   3.569|
|   119| <a href="https://twitter.com/michelleminkoff">@michelleminkoff</a>   |   3.569|
|   120| <a href="https://twitter.com/cjworkbench">@cjworkbench</a>           |   3.569|
|   121| <a href="https://twitter.com/ahofschneider">@ahofschneider</a>       |   3.537|
|   122| <a href="https://twitter.com/shmcminn">@shmcminn</a>                 |   3.537|
|   123| <a href="https://twitter.com/edbice">@edbice</a>                     |   3.537|
|   124| <a href="https://twitter.com/Disha_RC">@Disha\_RC</a>                |   3.537|
|   125| <a href="https://twitter.com/kristinhussey1">@kristinhussey1</a>     |   3.505|
|   126| <a href="https://twitter.com/abtran">@abtran</a>                     |   3.505|
|   127| <a href="https://twitter.com/forestgregg">@forestgregg</a>           |   3.505|
|   128| <a href="https://twitter.com/JessicaHuseman">@JessicaHuseman</a>     |   3.505|
|   129| <a href="https://twitter.com/bencschmitt">@bencschmitt</a>           |   3.505|
|   130| <a href="https://twitter.com/dangerscarf">@dangerscarf</a>           |   3.505|
|   131| <a href="https://twitter.com/HamdanAzhar">@HamdanAzhar</a>           |   3.505|
|   132| <a href="https://twitter.com/mattdrange">@mattdrange</a>             |   3.472|
|   133| <a href="https://twitter.com/LoBenichou">@LoBenichou</a>             |   3.472|
|   134| <a href="https://twitter.com/schwanksta">@schwanksta</a>             |   3.472|
|   135| <a href="https://twitter.com/katchicago">@katchicago</a>             |   3.440|
|   136| <a href="https://twitter.com/jordanrau">@jordanrau</a>               |   3.406|
|   137| <a href="https://twitter.com/typodactyl">@typodactyl</a>             |   3.406|
|   138| <a href="https://twitter.com/eads">@eads</a>                         |   3.406|
|   139| <a href="https://twitter.com/benlkeith">@benlkeith</a>               |   3.406|
|   140| <a href="https://twitter.com/rtburg">@rtburg</a>                     |   3.372|
|   141| <a href="https://twitter.com/mazet">@mazet</a>                       |   3.372|
|   142| <a href="https://twitter.com/susie_c">@susie\_c</a>                  |   3.372|
|   143| <a href="https://twitter.com/mshelton">@mshelton</a>                 |   3.372|
|   144| <a href="https://twitter.com/Gregatao">@Gregatao</a>                 |   3.372|
|   145| <a href="https://twitter.com/EvaConstantaras">@EvaConstantaras</a>   |   3.338|
|   146| <a href="https://twitter.com/dataKateR">@dataKateR</a>               |   3.338|
|   147| <a href="https://twitter.com/levinecarrie">@levinecarrie</a>         |   3.338|
|   148| <a href="https://twitter.com/kimbriellwapo">@kimbriellwapo</a>       |   3.303|
|   149| <a href="https://twitter.com/gebeloffnyt">@gebeloffnyt</a>           |   3.303|
|   150| <a href="https://twitter.com/gerald_arthur">@gerald\_arthur</a>      |   3.303|
|   151| <a href="https://twitter.com/DDJ_Tools">@DDJ\_Tools</a>              |   3.303|
|   152| <a href="https://twitter.com/kavyaSukumar">@kavyaSukumar</a>         |   3.303|
|   153| <a href="https://twitter.com/maggiemulvihill">@maggiemulvihill</a>   |   3.303|
|   154| <a href="https://twitter.com/npenzenstadler">@npenzenstadler</a>     |   3.267|
|   155| <a href="https://twitter.com/msanchezMIA">@msanchezMIA</a>           |   3.267|
|   156| <a href="https://twitter.com/kearneymw">@kearneymw</a>               |   3.267|
|   157| <a href="https://twitter.com/JakeaEkdahl">@JakeaEkdahl</a>           |   3.267|
|   158| <a href="https://twitter.com/LauraC_Moscoso">@LauraC\_Moscoso</a>    |   3.231|
|   159| <a href="https://twitter.com/CynthFernandez">@CynthFernandez</a>     |   3.231|
|   160| <a href="https://twitter.com/ashlynstill">@ashlynstill</a>           |   3.231|
|   161| <a href="https://twitter.com/MissRyley">@MissRyley</a>               |   3.231|
|   162| <a href="https://twitter.com/columbiajourn">@columbiajourn</a>       |   3.231|
|   163| <a href="https://twitter.com/miguelpaz">@miguelpaz</a>               |   3.231|
|   164| <a href="https://twitter.com/nixonron">@nixonron</a>                 |   3.231|
|   165| <a href="https://twitter.com/journtoolbox">@journtoolbox</a>         |   3.231|
|   166| <a href="https://twitter.com/ravenben">@ravenben</a>                 |   3.195|
|   167| <a href="https://twitter.com/stiles">@stiles</a>                     |   3.195|
|   168| <a href="https://twitter.com/anieldaniel">@anieldaniel</a>           |   3.195|
|   169| <a href="https://twitter.com/MoizSyed">@MoizSyed</a>                 |   3.195|
|   170| <a href="https://twitter.com/kennelliott">@kennelliott</a>           |   3.195|
|   171| <a href="https://twitter.com/momiperalta">@momiperalta</a>           |   3.157|
|   172| <a href="https://twitter.com/euniceylee">@euniceylee</a>             |   3.157|
|   173| <a href="https://twitter.com/SeraMak">@SeraMak</a>                   |   3.157|
|   174| <a href="https://twitter.com/allisonsross">@allisonsross</a>         |   3.157|
|   175| <a href="https://twitter.com/jayohday">@jayohday</a>                 |   3.157|
|   176| <a href="https://twitter.com/MJBerens1">@MJBerens1</a>               |   3.119|
|   177| <a href="https://twitter.com/EscolaDeDados">@EscolaDeDados</a>       |   3.119|
|   178| <a href="https://twitter.com/matt_kiefer">@matt\_kiefer</a>          |   3.119|
|   179| <a href="https://twitter.com/amyjo_brown">@amyjo\_brown</a>          |   3.119|
|   180| <a href="https://twitter.com/HilkeSchellmann">@HilkeSchellmann</a>   |   3.119|
|   181| <a href="https://twitter.com/emilywithrow">@emilywithrow</a>         |   3.119|
|   182| <a href="https://twitter.com/JoeYerardi">@JoeYerardi</a>             |   3.119|
|   183| <a href="https://twitter.com/rararahima">@rararahima</a>             |   3.119|
|   184| <a href="https://twitter.com/lucyparsonslabs">@lucyparsonslabs</a>   |   3.119|
|   185| <a href="https://twitter.com/TTBallantyne">@TTBallantyne</a>         |   3.080|
|   186| <a href="https://twitter.com/JournoKateH">@JournoKateH</a>           |   3.080|
|   187| <a href="https://twitter.com/tiffehr">@tiffehr</a>                   |   3.080|
|   188| <a href="https://twitter.com/sarahalvarezMI">@sarahalvarezMI</a>     |   3.041|
|   189| <a href="https://twitter.com/JacopoOttaviani">@JacopoOttaviani</a>   |   3.041|
|   190| <a href="https://twitter.com/j_la28">@j\_la28</a>                    |   3.041|
|   191| <a href="https://twitter.com/ICFJ">@ICFJ</a>                         |   3.041|
|   192| <a href="https://twitter.com/cthydng">@cthydng</a>                   |   3.041|
|   193| <a href="https://twitter.com/DK_NewsData">@DK\_NewsData</a>          |   3.001|
|   194| <a href="https://twitter.com/sarahanneconway">@sarahanneconway</a>   |   3.001|
|   195| <a href="https://twitter.com/NicoleKDan">@NicoleKDan</a>             |   3.001|
|   196| <a href="https://twitter.com/hunter_owens">@hunter\_owens</a>        |   3.001|
|   197| <a href="https://twitter.com/nilesmedia">@nilesmedia</a>             |   3.001|
|   198| <a href="https://twitter.com/gijn">@gijn</a>                         |   3.001|
|   199| <a href="https://twitter.com/deldeib">@deldeib</a>                   |   3.001|
|   200| <a href="https://twitter.com/JohnMuyskens">@JohnMuyskens</a>         |   3.001|
|   201| <a href="https://twitter.com/nassos_">@nassos\_</a>                  |   3.001|
|   202| <a href="https://twitter.com/zubakskees">@zubakskees</a>             |   2.959|
|   203| <a href="https://twitter.com/a_mendelson">@a\_mendelson</a>          |   2.959|
|   204| <a href="https://twitter.com/elliot_bentley">@elliot\_bentley</a>    |   2.959|
|   205| <a href="https://twitter.com/amandabee">@amandabee</a>               |   2.959|
|   206| <a href="https://twitter.com/tylrfishr">@tylrfishr</a>               |   2.959|
|   207| <a href="https://twitter.com/mizamudio">@mizamudio</a>               |   2.959|
|   208| <a href="https://twitter.com/anfuller">@anfuller</a>                 |   2.959|
|   209| <a href="https://twitter.com/darlacameron">@darlacameron</a>         |   2.959|
|   210| <a href="https://twitter.com/AlexMahadevan">@AlexMahadevan</a>       |   2.959|
|   211| <a href="https://twitter.com/TowCenter">@TowCenter</a>               |   2.959|
|   212| <a href="https://twitter.com/AKSarahB">@AKSarahB</a>                 |   2.959|
|   213| <a href="https://twitter.com/BrettMmurphy">@BrettMmurphy</a>         |   2.959|
|   214| <a href="https://twitter.com/JoeGermuska">@JoeGermuska</a>           |   2.917|
|   215| <a href="https://twitter.com/KenoyerKelly">@KenoyerKelly</a>         |   2.917|
|   216| <a href="https://twitter.com/sh_devulapalli">@sh\_devulapalli</a>    |   2.917|
|   217| <a href="https://twitter.com/MeghanHoyer">@MeghanHoyer</a>           |   2.917|
|   218| <a href="https://twitter.com/MadiLAlexander">@MadiLAlexander</a>     |   2.917|
|   219| <a href="https://twitter.com/beckyyerak">@beckyyerak</a>             |   2.917|
|   220| <a href="https://twitter.com/TimBroderick">@TimBroderick</a>         |   2.917|
|   221| <a href="https://twitter.com/molliehanley">@molliehanley</a>         |   2.917|
|   222| <a href="https://twitter.com/DanielTrielli">@DanielTrielli</a>       |   2.875|
|   223| <a href="https://twitter.com/khantasha">@khantasha</a>               |   2.875|
|   224| <a href="https://twitter.com/bpopken">@bpopken</a>                   |   2.875|
|   225| <a href="https://twitter.com/kellycalagna">@kellycalagna</a>         |   2.875|
|   226| <a href="https://twitter.com/brianboyer">@brianboyer</a>             |   2.875|
|   227| <a href="https://twitter.com/amber_waves">@amber\_waves</a>          |   2.831|
|   228| <a href="https://twitter.com/mgafni">@mgafni</a>                     |   2.831|
|   229| <a href="https://twitter.com/sfrostenson">@sfrostenson</a>           |   2.831|
|   230| <a href="https://twitter.com/JaymeKFraser">@JaymeKFraser</a>         |   2.831|
|   231| <a href="https://twitter.com/toholdaquill">@toholdaquill</a>         |   2.831|
|   232| <a href="https://twitter.com/KenichiSerino">@KenichiSerino</a>       |   2.831|
|   233| <a href="https://twitter.com/amgarrettphoto">@amgarrettphoto</a>     |   2.831|
|   234| <a href="https://twitter.com/br_data">@br\_data</a>                  |   2.831|
|   235| <a href="https://twitter.com/nickswyter">@nickswyter</a>             |   2.831|
|   236| <a href="https://twitter.com/jbenton">@jbenton</a>                   |   2.831|
|   237| <a href="https://twitter.com/Eeshapendharkar">@Eeshapendharkar</a>   |   2.786|
|   238| <a href="https://twitter.com/thomasgpadilla">@thomasgpadilla</a>     |   2.786|
|   239| <a href="https://twitter.com/gaufre">@gaufre</a>                     |   2.786|
|   240| <a href="https://twitter.com/MargotWilliams">@MargotWilliams</a>     |   2.786|
|   241| <a href="https://twitter.com/UO_Catalyst">@UO\_Catalyst</a>          |   2.786|
|   242| <a href="https://twitter.com/NadineSebai">@NadineSebai</a>           |   2.786|
|   243| <a href="https://twitter.com/miriamkp">@miriamkp</a>                 |   2.740|
|   244| <a href="https://twitter.com/gufalei">@gufalei</a>                   |   2.740|
|   245| <a href="https://twitter.com/ByNinaMartin">@ByNinaMartin</a>         |   2.740|
|   246| <a href="https://twitter.com/aric_chokey">@aric\_chokey</a>          |   2.740|
|   247| <a href="https://twitter.com/lenagroeger">@lenagroeger</a>           |   2.692|
|   248| <a href="https://twitter.com/jpeebles">@jpeebles</a>                 |   2.692|
|   249| <a href="https://twitter.com/MikeStucka">@MikeStucka</a>             |   2.692|
|   250| <a href="https://twitter.com/OpenSemSearch">@OpenSemSearch</a>       |   2.692|
|   251| <a href="https://twitter.com/ToTheVictor">@ToTheVictor</a>           |   2.692|
|   252| <a href="https://twitter.com/hannah_recht">@hannah\_recht</a>        |   2.692|
|   253| <a href="https://twitter.com/DrewOCCRP">@DrewOCCRP</a>               |   2.644|
|   254| <a href="https://twitter.com/davidherzog">@davidherzog</a>           |   2.644|
|   255| <a href="https://twitter.com/asuozzo">@asuozzo</a>                   |   2.644|
|   256| <a href="https://twitter.com/elthenerd">@elthenerd</a>               |   2.644|
|   257| <a href="https://twitter.com/joannaskao">@joannaskao</a>             |   2.644|
|   258| <a href="https://twitter.com/joemurph">@joemurph</a>                 |   2.644|
|   259| <a href="https://twitter.com/pamelagdempsey">@pamelagdempsey</a>     |   2.644|
|   260| <a href="https://twitter.com/knowtheory">@knowtheory</a>             |   2.644|
|   261| <a href="https://twitter.com/LeilaHaddou">@LeilaHaddou</a>           |   2.644|
|   262| <a href="https://twitter.com/EPetenko">@EPetenko</a>                 |   2.644|
|   263| <a href="https://twitter.com/zehnzehen">@zehnzehen</a>               |   2.644|
|   264| <a href="https://twitter.com/morisy">@morisy</a>                     |   2.644|
|   265| <a href="https://twitter.com/yoli_martinez">@yoli\_martinez</a>      |   2.644|
|   266| <a href="https://twitter.com/LaurenRohr">@LaurenRohr</a>             |   2.644|
|   267| <a href="https://twitter.com/UOsojc">@UOsojc</a>                     |   2.644|
|   268| <a href="https://twitter.com/lenifaye">@lenifaye</a>                 |   2.644|
|   269| <a href="https://twitter.com/91_pometti">@91\_pometti</a>            |   2.644|
|   270| <a href="https://twitter.com/digitalamysw">@digitalamysw</a>         |   2.594|
|   271| <a href="https://twitter.com/AJVicens">@AJVicens</a>                 |   2.594|
|   272| <a href="https://twitter.com/magiccia">@magiccia</a>                 |   2.594|
|   273| <a href="https://twitter.com/NiemanLab">@NiemanLab</a>               |   2.594|
|   274| <a href="https://twitter.com/SooOh">@SooOh</a>                       |   2.594|
|   275| <a href="https://twitter.com/robschoeffel">@robschoeffel</a>         |   2.594|
|   276| <a href="https://twitter.com/pinardag">@pinardag</a>                 |   2.594|
|   277| <a href="https://twitter.com/rgibbs">@rgibbs</a>                     |   2.594|
|   278| <a href="https://twitter.com/UlrikBaltzer">@UlrikBaltzer</a>         |   2.594|
|   279| <a href="https://twitter.com/credcoalition">@credcoalition</a>       |   2.594|
|   280| <a href="https://twitter.com/chrisschnaars">@chrisschnaars</a>       |   2.542|
|   281| <a href="https://twitter.com/ChristyGutowsk1">@ChristyGutowsk1</a>   |   2.542|
|   282| <a href="https://twitter.com/campbellronaldw">@campbellronaldw</a>   |   2.542|
|   283| <a href="https://twitter.com/RecordsGeek">@RecordsGeek</a>           |   2.542|
|   284| <a href="https://twitter.com/pilhofer">@pilhofer</a>                 |   2.542|
|   285| <a href="https://twitter.com/allyjarmanning">@allyjarmanning</a>     |   2.542|
|   286| <a href="https://twitter.com/VigneshR">@VigneshR</a>                 |   2.542|
|   287| <a href="https://twitter.com/mpiccorossi">@mpiccorossi</a>           |   2.542|
|   288| <a href="https://twitter.com/DeniseDSLu">@DeniseDSLu</a>             |   2.542|
|   289| <a href="https://twitter.com/SamataJo">@SamataJo</a>                 |   2.542|
|   290| <a href="https://twitter.com/DataMadeCo">@DataMadeCo</a>             |   2.542|
|   291| <a href="https://twitter.com/ericuman">@ericuman</a>                 |   2.542|
|   292| <a href="https://twitter.com/cbaxter1">@cbaxter1</a>                 |   2.542|
|   293| <a href="https://twitter.com/ssdatar">@ssdatar</a>                   |   2.489|
|   294| <a href="https://twitter.com/ceostroff">@ceostroff</a>               |   2.489|
|   295| <a href="https://twitter.com/hollyhacker">@hollyhacker</a>           |   2.489|
|   296| <a href="https://twitter.com/amayaverde">@amayaverde</a>             |   2.489|
|   297| <a href="https://twitter.com/JonRMcClure">@JonRMcClure</a>           |   2.489|
|   298| <a href="https://twitter.com/gretakaul">@gretakaul</a>               |   2.489|
|   299| <a href="https://twitter.com/act_rational">@act\_rational</a>        |   2.489|
|   300| <a href="https://twitter.com/StuartCLT">@StuartCLT</a>               |   2.489|
|   301| <a href="https://twitter.com/jlstro">@jlstro</a>                     |   2.489|
|   302| <a href="https://twitter.com/d_holli">@d\_holli</a>                  |   2.489|
|   303| <a href="https://twitter.com/ssktanaka">@ssktanaka</a>               |   2.489|
|   304| <a href="https://twitter.com/ranjchak">@ranjchak</a>                 |   2.434|
|   305| <a href="https://twitter.com/akesslerdc">@akesslerdc</a>             |   2.434|
|   306| <a href="https://twitter.com/cherylwt">@cherylwt</a>                 |   2.434|
|   307| <a href="https://twitter.com/adinarayan">@adinarayan</a>             |   2.434|
|   308| <a href="https://twitter.com/songbogong">@songbogong</a>             |   2.434|
|   309| <a href="https://twitter.com/IJNet">@IJNet</a>                       |   2.434|
|   310| <a href="https://twitter.com/queenalma19">@queenalma19</a>           |   2.434|
|   311| <a href="https://twitter.com/allthingscensus">@allthingscensus</a>   |   2.434|
|   312| <a href="https://twitter.com/CoreyGJohnson">@CoreyGJohnson</a>       |   2.434|
|   313| <a href="https://twitter.com/lyonwj">@lyonwj</a>                     |   2.434|
|   314| <a href="https://twitter.com/BuildCoffee">@BuildCoffee</a>           |   2.434|
|   315| <a href="https://twitter.com/MuckRock">@MuckRock</a>                 |   2.434|
|   316| <a href="https://twitter.com/txtianmiller">@txtianmiller</a>         |   2.378|
|   317| <a href="https://twitter.com/guilherme_amado">@guilherme\_amado</a>  |   2.378|
|   318| <a href="https://twitter.com/Ukingsdata">@Ukingsdata</a>             |   2.378|
|   319| <a href="https://twitter.com/OpenSecretsDC">@OpenSecretsDC</a>       |   2.378|
|   320| <a href="https://twitter.com/AnnieWaldman">@AnnieWaldman</a>         |   2.378|
|   321| <a href="https://twitter.com/bikeprof">@bikeprof</a>                 |   2.378|
|   322| <a href="https://twitter.com/luisdaniel12">@luisdaniel12</a>         |   2.378|
|   323| <a href="https://twitter.com/marymhudetz">@marymhudetz</a>           |   2.378|
|   324| <a href="https://twitter.com/danielschuman">@danielschuman</a>       |   2.378|
|   325| <a href="https://twitter.com/scott2b">@scott2b</a>                   |   2.378|
|   326| <a href="https://twitter.com/smr_foundation">@smr\_foundation</a>    |   2.378|
|   327| <a href="https://twitter.com/Jingnan_Huo">@Jingnan\_Huo</a>          |   2.319|
|   328| <a href="https://twitter.com/wardrachel">@wardrachel</a>             |   2.319|
|   329| <a href="https://twitter.com/kateconger">@kateconger</a>             |   2.319|
|   330| <a href="https://twitter.com/_chloelessard_">@\_chloelessard\_</a>   |   2.319|
|   331| <a href="https://twitter.com/nicoledahmen">@nicoledahmen</a>         |   2.319|
|   332| <a href="https://twitter.com/ReutersPR">@ReutersPR</a>               |   2.319|
|   333| <a href="https://twitter.com/opencorporates">@opencorporates</a>     |   2.319|
|   334| <a href="https://twitter.com/RayLong">@RayLong</a>                   |   2.258|
|   335| <a href="https://twitter.com/RachelleFaroul">@RachelleFaroul</a>     |   2.258|
|   336| <a href="https://twitter.com/louisekiernan">@louisekiernan</a>       |   2.258|
|   337| <a href="https://twitter.com/jasongrotto">@jasongrotto</a>           |   2.258|
|   338| <a href="https://twitter.com/KCnSunshineJam">@KCnSunshineJam</a>     |   2.258|
|   339| <a href="https://twitter.com/CarlieProcell">@CarlieProcell</a>       |   2.258|
|   340| <a href="https://twitter.com/zstumgoren">@zstumgoren</a>             |   2.258|
|   341| <a href="https://twitter.com/caseymmiller">@caseymmiller</a>         |   2.258|
|   342| <a href="https://twitter.com/Evie_xing">@Evie\_xing</a>              |   2.258|
|   343| <a href="https://twitter.com/robroc">@robroc</a>                     |   2.258|
|   344| <a href="https://twitter.com/JuliaJRH">@JuliaJRH</a>                 |   2.258|
|   345| <a href="https://twitter.com/heychrisbarr">@heychrisbarr</a>         |   2.258|
|   346| <a href="https://twitter.com/CaitMcGlade">@CaitMcGlade</a>           |   2.258|
|   347| <a href="https://twitter.com/paulbradshaw">@paulbradshaw</a>         |   2.258|
|   348| <a href="https://twitter.com/angelicadesigns">@angelicadesigns</a>   |   2.194|
|   349| <a href="https://twitter.com/JournalismSandy">@JournalismSandy</a>   |   2.194|
|   350| <a href="https://twitter.com/source">@source</a>                     |   2.194|
|   351| <a href="https://twitter.com/dankeemahill">@dankeemahill</a>         |   2.194|
|   352| <a href="https://twitter.com/geoffhing">@geoffhing</a>               |   2.194|
|   353| <a href="https://twitter.com/ICFJKnight">@ICFJKnight</a>             |   2.194|
|   354| <a href="https://twitter.com/antoniocuga">@antoniocuga</a>           |   2.194|
|   355| <a href="https://twitter.com/CEssig">@CEssig</a>                     |   2.194|
|   356| <a href="https://twitter.com/tylermachado">@tylermachado</a>         |   2.194|
|   357| <a href="https://twitter.com/Clarii_D">@Clarii\_D</a>                |   2.194|
|   358| <a href="https://twitter.com/gregmunno">@gregmunno</a>               |   2.194|
|   359| <a href="https://twitter.com/reginafcompton">@reginafcompton</a>     |   2.194|
|   360| <a href="https://twitter.com/cameronhickey">@cameronhickey</a>       |   2.194|
|   361| <a href="https://twitter.com/shansquared">@shansquared</a>           |   2.194|
|   362| <a href="https://twitter.com/saleemkhan">@saleemkhan</a>             |   2.194|
|   363| <a href="https://twitter.com/nwatzman">@nwatzman</a>                 |   2.194|
|   364| <a href="https://twitter.com/getcraftyaf">@getcraftyaf</a>           |   2.127|
|   365| <a href="https://twitter.com/EvanWyloge">@EvanWyloge</a>             |   2.127|
|   366| <a href="https://twitter.com/MateoClarke">@MateoClarke</a>           |   2.127|
|   367| <a href="https://twitter.com/bugsact">@bugsact</a>                   |   2.127|
|   368| <a href="https://twitter.com/gabriellecalise">@gabriellecalise</a>   |   2.127|
|   369| <a href="https://twitter.com/ChristieJules">@ChristieJules</a>       |   2.127|
|   370| <a href="https://twitter.com/ProPublicaIL">@ProPublicaIL</a>         |   2.127|
|   371| <a href="https://twitter.com/jcsouth">@jcsouth</a>                   |   2.127|
|   372| <a href="https://twitter.com/ChicagoReporter">@ChicagoReporter</a>   |   2.127|
|   373| <a href="https://twitter.com/JenAFifield">@JenAFifield</a>           |   2.127|
|   374| <a href="https://twitter.com/miss_melanieg">@miss\_melanieg</a>      |   2.127|
|   375| <a href="https://twitter.com/SamRoe">@SamRoe</a>                     |   2.127|
|   376| <a href="https://twitter.com/zhoyoyo">@zhoyoyo</a>                   |   2.127|
|   377| <a href="https://twitter.com/ChiDM">@ChiDM</a>                       |   2.127|
|   378| <a href="https://twitter.com/kleinmatic">@kleinmatic</a>             |   2.127|
|   379| <a href="https://twitter.com/bcumedia">@bcumedia</a>                 |   2.127|
|   380| <a href="https://twitter.com/AxiosVisuals">@AxiosVisuals</a>         |   2.127|
|   381| <a href="https://twitter.com/DATABASE_HULK">@DATABASE\_HULK</a>      |   2.057|
|   382| <a href="https://twitter.com/IAmStevenPotter">@IAmStevenPotter</a>   |   2.057|
|   383| <a href="https://twitter.com/rwells1961">@rwells1961</a>             |   2.057|
|   384| <a href="https://twitter.com/Fvjones">@Fvjones</a>                   |   2.057|
|   385| <a href="https://twitter.com/robertrdenton">@robertrdenton</a>       |   2.057|
|   386| <a href="https://twitter.com/kissane">@kissane</a>                   |   2.057|
|   387| <a href="https://twitter.com/FedorZarkhin">@FedorZarkhin</a>         |   2.057|
|   388| <a href="https://twitter.com/jonahshai">@jonahshai</a>               |   2.057|
|   389| <a href="https://twitter.com/UFJSchool">@UFJSchool</a>               |   2.057|
|   390| <a href="https://twitter.com/gluissandoval">@gluissandoval</a>       |   2.057|
|   391| <a href="https://twitter.com/PaigeBlank">@PaigeBlank</a>             |   2.057|
|   392| <a href="https://twitter.com/BritRenee_">@BritRenee\_</a>            |   2.057|
|   393| <a href="https://twitter.com/iaivanova">@iaivanova</a>               |   2.057|
|   394| <a href="https://twitter.com/pierreconti">@pierreconti</a>           |   2.057|
|   395| <a href="https://twitter.com/JeffKLO">@JeffKLO</a>                   |   2.057|
|   396| <a href="https://twitter.com/walt_jw">@walt\_jw</a>                  |   2.057|
|   397| <a href="https://twitter.com/NYTInteractive">@NYTInteractive</a>     |   2.057|
|   398| <a href="https://twitter.com/ChiAppleseed">@ChiAppleseed</a>         |   2.057|
|   399| <a href="https://twitter.com/Lindenberger">@Lindenberger</a>         |   1.983|
|   400| <a href="https://twitter.com/JadJaffar">@JadJaffar</a>               |   1.983|
|   401| <a href="https://twitter.com/RobertBenincasa">@RobertBenincasa</a>   |   1.983|
|   402| <a href="https://twitter.com/justinJprice">@justinJprice</a>         |   1.983|
|   403| <a href="https://twitter.com/Vince_Dixon_">@Vince\_Dixon\_</a>       |   1.983|
|   404| <a href="https://twitter.com/JaredRutecki">@JaredRutecki</a>         |   1.983|
|   405| <a href="https://twitter.com/midatalove">@midatalove</a>             |   1.983|
|   406| <a href="https://twitter.com/nat_orenstein">@nat\_orenstein</a>      |   1.983|
|   407| <a href="https://twitter.com/ashhwu">@ashhwu</a>                     |   1.983|
|   408| <a href="https://twitter.com/rctatman">@rctatman</a>                 |   1.983|
|   409| <a href="https://twitter.com/smfrogers">@smfrogers</a>               |   1.983|
|   410| <a href="https://twitter.com/mbgerring">@mbgerring</a>               |   1.983|
|   411| <a href="https://twitter.com/KHNews">@KHNews</a>                     |   1.983|
|   412| <a href="https://twitter.com/nicolelzhu">@nicolelzhu</a>             |   1.983|
|   413| <a href="https://twitter.com/rcfp">@rcfp</a>                         |   1.983|
|   414| <a href="https://twitter.com/john_diedrich">@john\_diedrich</a>      |   1.983|
|   415| <a href="https://twitter.com/mack_oxenden">@mack\_oxenden</a>        |   1.983|
|   416| <a href="https://twitter.com/WSJGraphics">@WSJGraphics</a>           |   1.983|
|   417| <a href="https://twitter.com/biffud">@biffud</a>                     |   1.983|
|   418| <a href="https://twitter.com/JOVRNALISM">@JOVRNALISM</a>             |   1.983|
|   419| <a href="https://twitter.com/citizenkrans">@citizenkrans</a>         |   1.905|
|   420| <a href="https://twitter.com/bethfertig">@bethfertig</a>             |   1.905|
|   421| <a href="https://twitter.com/write_this_way">@write\_this\_way</a>   |   1.905|
|   422| <a href="https://twitter.com/bmyeung">@bmyeung</a>                   |   1.905|
|   423| <a href="https://twitter.com/eidietrich">@eidietrich</a>             |   1.905|
|   424| <a href="https://twitter.com/ChrisLKellerLAT">@ChrisLKellerLAT</a>   |   1.905|
|   425| <a href="https://twitter.com/neenahyena">@neenahyena</a>             |   1.905|
|   426| <a href="https://twitter.com/stekhn">@stekhn</a>                     |   1.905|
|   427| <a href="https://twitter.com/lwalsh">@lwalsh</a>                     |   1.905|
|   428| <a href="https://twitter.com/cocteau">@cocteau</a>                   |   1.905|
|   429| <a href="https://twitter.com/SPIEGEL_Data">@SPIEGEL\_Data</a>        |   1.905|
|   430| <a href="https://twitter.com/gilra">@gilra</a>                       |   1.905|
|   431| <a href="https://twitter.com/BayAreaData">@BayAreaData</a>           |   1.905|
|   432| <a href="https://twitter.com/Botometer">@Botometer</a>               |   1.905|
|   433| <a href="https://twitter.com/truthyatindiana">@truthyatindiana</a>   |   1.822|
|   434| <a href="https://twitter.com/CraigPalosky">@CraigPalosky</a>         |   1.822|
|   435| <a href="https://twitter.com/jeanhuguesroy">@jeanhuguesroy</a>       |   1.822|
|   436| <a href="https://twitter.com/PBienenfeld">@PBienenfeld</a>           |   1.822|
|   437| <a href="https://twitter.com/Orla_McCaffrey">@Orla\_McCaffrey</a>    |   1.822|
|   438| <a href="https://twitter.com/HartlandZoe">@HartlandZoe</a>           |   1.822|
|   439| <a href="https://twitter.com/sarahsalvadore">@sarahsalvadore</a>     |   1.822|
|   440| <a href="https://twitter.com/toreyvanoot">@toreyvanoot</a>           |   1.822|
|   441| <a href="https://twitter.com/gridinoc">@gridinoc</a>                 |   1.822|
|   442| <a href="https://twitter.com/GerryLanosga">@GerryLanosga</a>         |   1.822|
|   443| <a href="https://twitter.com/dougwmoore">@dougwmoore</a>             |   1.822|
|   444| <a href="https://twitter.com/neo4j">@neo4j</a>                       |   1.822|
|   445| <a href="https://twitter.com/ReporterGina">@ReporterGina</a>         |   1.822|
|   446| <a href="https://twitter.com/DetroitReporter">@DetroitReporter</a>   |   1.822|
|   447| <a href="https://twitter.com/adventurejason">@adventurejason</a>     |   1.822|
|   448| <a href="https://twitter.com/DanielPWWood">@DanielPWWood</a>         |   1.822|
|   449| <a href="https://twitter.com/JacquieEli">@JacquieEli</a>             |   1.822|
|   450| <a href="https://twitter.com/garveymcvg">@garveymcvg</a>             |   1.822|
|   451| <a href="https://twitter.com/Lmazade">@Lmazade</a>                   |   1.822|
|   452| <a href="https://twitter.com/kschorsch">@kschorsch</a>               |   1.822|
|   453| <a href="https://twitter.com/tylerallyndavis">@tylerallyndavis</a>   |   1.822|
|   454| <a href="https://twitter.com/jhett93">@jhett93</a>                   |   1.822|
|   455| <a href="https://twitter.com/jpheasly">@jpheasly</a>                 |   1.732|
|   456| <a href="https://twitter.com/jburnmurdoch">@jburnmurdoch</a>         |   1.732|
|   457| <a href="https://twitter.com/RobertMaguire_">@RobertMaguire\_</a>    |   1.732|
|   458| <a href="https://twitter.com/Sara_Wise">@Sara\_Wise</a>              |   1.732|
|   459| <a href="https://twitter.com/disolis">@disolis</a>                   |   1.732|
|   460| <a href="https://twitter.com/stephanierlamm">@stephanierlamm</a>     |   1.732|
|   461| <a href="https://twitter.com/ReporterTopher">@ReporterTopher</a>     |   1.732|
|   462| <a href="https://twitter.com/aschweig">@aschweig</a>                 |   1.732|
|   463| <a href="https://twitter.com/priyakkumar">@priyakkumar</a>           |   1.732|
|   464| <a href="https://twitter.com/Cathy_MeiyingHe">@Cathy\_MeiyingHe</a>  |   1.732|
|   465| <a href="https://twitter.com/JoonParkMusic">@JoonParkMusic</a>       |   1.732|
|   466| <a href="https://twitter.com/MattCData">@MattCData</a>               |   1.732|
|   467| <a href="https://twitter.com/micahflee">@micahflee</a>               |   1.732|
|   468| <a href="https://twitter.com/tweetbaack">@tweetbaack</a>             |   1.732|
|   469| <a href="https://twitter.com/thensim0nsaid">@thensim0nsaid</a>       |   1.732|
|   470| <a href="https://twitter.com/BradQSkillman">@BradQSkillman</a>       |   1.732|
|   471| <a href="https://twitter.com/MonaChalabi">@MonaChalabi</a>           |   1.732|
|   472| <a href="https://twitter.com/onlyandrewn">@onlyandrewn</a>           |   1.732|
|   473| <a href="https://twitter.com/MattTheJourno">@MattTheJourno</a>       |   1.732|
|   474| <a href="https://twitter.com/lisalsong">@lisalsong</a>               |   1.732|
|   475| <a href="https://twitter.com/irworkshop">@irworkshop</a>             |   1.732|
|   476| <a href="https://twitter.com/ajmnoble">@ajmnoble</a>                 |   1.732|
|   477| <a href="https://twitter.com/Carlapedret">@Carlapedret</a>           |   1.732|
|   478| <a href="https://twitter.com/mcrosasb">@mcrosasb</a>                 |   1.732|
|   479| <a href="https://twitter.com/jczamora">@jczamora</a>                 |   1.732|
|   480| <a href="https://twitter.com/abbyblachman">@abbyblachman</a>         |   1.732|
|   481| <a href="https://twitter.com/jackgillum">@jackgillum</a>             |   1.636|
|   482| <a href="https://twitter.com/chrissiemurray">@chrissiemurray</a>     |   1.636|
|   483| <a href="https://twitter.com/mfederis">@mfederis</a>                 |   1.636|
|   484| <a href="https://twitter.com/The_Dean">@The\_Dean</a>                |   1.636|
|   485| <a href="https://twitter.com/mhkeller">@mhkeller</a>                 |   1.636|
|   486| <a href="https://twitter.com/mielafetaw">@mielafetaw</a>             |   1.636|
|   487| <a href="https://twitter.com/tgregoryreports">@tgregoryreports</a>   |   1.636|
|   488| <a href="https://twitter.com/MeganLuther">@MeganLuther</a>           |   1.636|
|   489| <a href="https://twitter.com/latguild">@latguild</a>                 |   1.636|
|   490| <a href="https://twitter.com/sdooling">@sdooling</a>                 |   1.636|
|   491| <a href="https://twitter.com/LeeVGaines">@LeeVGaines</a>             |   1.636|
|   492| <a href="https://twitter.com/cdrentz">@cdrentz</a>                   |   1.636|
|   493| <a href="https://twitter.com/hannahsbirch">@hannahsbirch</a>         |   1.636|
|   494| <a href="https://twitter.com/LATdatadesk">@LATdatadesk</a>           |   1.636|
|   495| <a href="https://twitter.com/AlenaMaschke">@AlenaMaschke</a>         |   1.636|
|   496| <a href="https://twitter.com/JoshKalov">@JoshKalov</a>               |   1.636|
|   497| <a href="https://twitter.com/AnjeanetteDamon">@AnjeanetteDamon</a>   |   1.636|
|   498| <a href="https://twitter.com/JacobNierenberg">@JacobNierenberg</a>   |   1.636|
|   499| <a href="https://twitter.com/databyler">@databyler</a>               |   1.636|
|   500| <a href="https://twitter.com/kylebentle">@kylebentle</a>             |   1.636|
|   501| <a href="https://twitter.com/MUOBrien">@MUOBrien</a>                 |   1.636|
|   502| <a href="https://twitter.com/MUCollegeofComm">@MUCollegeofComm</a>   |   1.636|
|   503| <a href="https://twitter.com/slifty">@slifty</a>                     |   1.636|
|   504| <a href="https://twitter.com/SouthSideWeekly">@SouthSideWeekly</a>   |   1.636|
|   505| <a href="https://twitter.com/globalnation">@globalnation</a>         |   1.531|
|   506| <a href="https://twitter.com/AmyCesal">@AmyCesal</a>                 |   1.531|
|   507| <a href="https://twitter.com/nerdishtendency">@nerdishtendency</a>   |   1.531|
|   508| <a href="https://twitter.com/shiying_cheng">@shiying\_cheng</a>      |   1.531|
|   509| <a href="https://twitter.com/Mapbox">@Mapbox</a>                     |   1.531|
|   510| <a href="https://twitter.com/egabler">@egabler</a>                   |   1.531|
|   511| <a href="https://twitter.com/No_Little_Plans">@No\_Little\_Plans</a> |   1.531|
|   512| <a href="https://twitter.com/reporterbrooke">@reporterbrooke</a>     |   1.531|
|   513| <a href="https://twitter.com/McNeill_Tweets">@McNeill\_Tweets</a>    |   1.531|
|   514| <a href="https://twitter.com/liladerm">@liladerm</a>                 |   1.531|
|   515| <a href="https://twitter.com/niemanfdn">@niemanfdn</a>               |   1.531|
|   516| <a href="https://twitter.com/myersnews">@myersnews</a>               |   1.531|
|   517| <a href="https://twitter.com/Dinsmore">@Dinsmore</a>                 |   1.531|
|   518| <a href="https://twitter.com/DJNF">@DJNF</a>                         |   1.531|
|   519| <a href="https://twitter.com/Brizzyc">@Brizzyc</a>                   |   1.414|
|   520| <a href="https://twitter.com/iaincollins">@iaincollins</a>           |   1.414|
|   521| <a href="https://twitter.com/RachelSB">@RachelSB</a>                 |   1.414|
|   522| <a href="https://twitter.com/talkingbiznews">@talkingbiznews</a>     |   1.414|
|   523| <a href="https://twitter.com/ajlabs">@ajlabs</a>                     |   1.414|
|   524| <a href="https://twitter.com/morgan_krakow">@morgan\_krakow</a>      |   1.414|
|   525| <a href="https://twitter.com/joemahr">@joemahr</a>                   |   1.414|
|   526| <a href="https://twitter.com/Yanazure">@Yanazure</a>                 |   1.414|
|   527| <a href="https://twitter.com/maggie_a_lee">@maggie\_a\_lee</a>       |   1.414|
|   528| <a href="https://twitter.com/kwashy12">@kwashy12</a>                 |   1.414|
|   529| <a href="https://twitter.com/nostarch">@nostarch</a>                 |   1.414|
|   530| <a href="https://twitter.com/crit">@crit</a>                         |   1.414|
|   531| <a href="https://twitter.com/DeniseMalan">@DeniseMalan</a>           |   1.414|
|   532| <a href="https://twitter.com/GurmanBhatia">@GurmanBhatia</a>         |   1.414|
|   533| <a href="https://twitter.com/ndungca">@ndungca</a>                   |   1.414|
|   534| <a href="https://twitter.com/kcrowebasspro">@kcrowebasspro</a>       |   1.414|
|   535| <a href="https://twitter.com/jeremybmerrill">@jeremybmerrill</a>     |   1.414|
|   536| <a href="https://twitter.com/juliasilge">@juliasilge</a>             |   1.414|
|   537| <a href="https://twitter.com/gijnAfrica">@gijnAfrica</a>             |   1.414|
|   538| <a href="https://twitter.com/InfoAmazonia">@InfoAmazonia</a>         |   1.414|
|   539| <a href="https://twitter.com/Dataminr">@Dataminr</a>                 |   1.414|
|   540| <a href="https://twitter.com/ElenaFerrarin">@ElenaFerrarin</a>       |   1.414|
|   541| <a href="https://twitter.com/gteresa">@gteresa</a>                   |   1.282|
|   542| <a href="https://twitter.com/DiannaNanez">@DiannaNanez</a>           |   1.282|
|   543| <a href="https://twitter.com/KathrynTRex">@KathrynTRex</a>           |   1.282|
|   544| <a href="https://twitter.com/jrebert97">@jrebert97</a>               |   1.282|
|   545| <a href="https://twitter.com/Bahareh360">@Bahareh360</a>             |   1.282|
|   546| <a href="https://twitter.com/sobrejornalismo">@sobrejornalismo</a>   |   1.282|
|   547| <a href="https://twitter.com/caryaspinwall">@caryaspinwall</a>       |   1.282|
|   548| <a href="https://twitter.com/cwebb_bi">@cwebb\_bi</a>                |   1.282|
|   549| <a href="https://twitter.com/jsmithrichards">@jsmithrichards</a>     |   1.282|
|   550| <a href="https://twitter.com/news_klaxon">@news\_klaxon</a>          |   1.282|
|   551| <a href="https://twitter.com/KtTobar">@KtTobar</a>                   |   1.282|
|   552| <a href="https://twitter.com/c_milneil">@c\_milneil</a>              |   1.282|
|   553| <a href="https://twitter.com/resentfultweet">@resentfultweet</a>     |   1.282|
|   554| <a href="https://twitter.com/runasand">@runasand</a>                 |   1.282|
|   555| <a href="https://twitter.com/mvtopic">@mvtopic</a>                   |   1.282|
|   556| <a href="https://twitter.com/zuckerco">@zuckerco</a>                 |   1.282|
|   557| <a href="https://twitter.com/practicalsql">@practicalsql</a>         |   1.282|
|   558| <a href="https://twitter.com/21stShow">@21stShow</a>                 |   1.282|
|   559| <a href="https://twitter.com/GarrettSantora">@GarrettSantora</a>     |   1.282|
|   560| <a href="https://twitter.com/some_yeo">@some\_yeo</a>                |   1.282|
|   561| <a href="https://twitter.com/becca_aa">@becca\_aa</a>                |   1.282|
|   562| <a href="https://twitter.com/UFCJCLibrarian">@UFCJCLibrarian</a>     |   1.129|
|   563| <a href="https://twitter.com/mattwynn">@mattwynn</a>                 |   1.129|
|   564| <a href="https://twitter.com/AgNews_Otto">@AgNews\_Otto</a>          |   1.129|
|   565| <a href="https://twitter.com/TimHendersonSL">@TimHendersonSL</a>     |   1.129|
|   566| <a href="https://twitter.com/davidbschultz">@davidbschultz</a>       |   1.129|
|   567| <a href="https://twitter.com/sisiwei">@sisiwei</a>                   |   1.129|
|   568| <a href="https://twitter.com/DanTelvock">@DanTelvock</a>             |   1.129|
|   569| <a href="https://twitter.com/ChanceyFleet">@ChanceyFleet</a>         |   1.129|
|   570| <a href="https://twitter.com/jfloyd134">@jfloyd134</a>               |   1.129|
|   571| <a href="https://twitter.com/just_rashida">@just\_rashida</a>        |   1.129|
|   572| <a href="https://twitter.com/UnivisionData">@UnivisionData</a>       |   1.129|
|   573| <a href="https://twitter.com/marshallreport">@marshallreport</a>     |   1.129|
|   574| <a href="https://twitter.com/LossofPrivacy">@LossofPrivacy</a>       |   1.129|
|   575| <a href="https://twitter.com/kvnmiller">@kvnmiller</a>               |   1.129|
|   576| <a href="https://twitter.com/kclarkcollege">@kclarkcollege</a>       |   1.129|
|   577| <a href="https://twitter.com/ipsosus">@ipsosus</a>                   |   1.129|
|   578| <a href="https://twitter.com/thejessicabrady">@thejessicabrady</a>   |   1.129|
|   579| <a href="https://twitter.com/GdnMobileLab">@GdnMobileLab</a>         |   1.129|
|   580| <a href="https://twitter.com/DagmedyaVeri">@DagmedyaVeri</a>         |   1.129|
|   581| <a href="https://twitter.com/realavivahr">@realavivahr</a>           |   1.129|
|   582| <a href="https://twitter.com/portlandmercury">@portlandmercury</a>   |   1.129|
|   583| <a href="https://twitter.com/kcecireyes">@kcecireyes</a>             |   1.129|
|   584| <a href="https://twitter.com/abraji">@abraji</a>                     |   1.129|
|   585| <a href="https://twitter.com/rdmurphy">@rdmurphy</a>                 |   1.129|
|   586| <a href="https://twitter.com/BBGVisualData">@BBGVisualData</a>       |   1.129|
|   587| <a href="https://twitter.com/zammagazine">@zammagazine</a>           |   1.129|
|   588| <a href="https://twitter.com/StefanieMurray">@StefanieMurray</a>     |   1.129|
|   589| <a href="https://twitter.com/felavsky">@felavsky</a>                 |   0.944|
|   590| <a href="https://twitter.com/jbmckim">@jbmckim</a>                   |   0.944|
|   591| <a href="https://twitter.com/davidcblood">@davidcblood</a>           |   0.944|
|   592| <a href="https://twitter.com/ZapOracles">@ZapOracles</a>             |   0.944|
|   593| <a href="https://twitter.com/eman_thedataman">@eman\_thedataman</a>  |   0.944|
|   594| <a href="https://twitter.com/wwrfd">@wwrfd</a>                       |   0.702|
|   595| <a href="https://twitter.com/tarajcarman">@tarajcarman</a>           |   0.702|
|   596| <a href="https://twitter.com/joemfox">@joemfox</a>                   |   0.702|
|   597| <a href="https://twitter.com/Futureof_News">@Futureof\_News</a>      |   0.702|
|   598| <a href="https://twitter.com/mcarmichael">@mcarmichael</a>           |   0.702|
|   599| <a href="https://twitter.com/aweiss">@aweiss</a>                     |   0.702|
|   600| <a href="https://twitter.com/tkb">@tkb</a>                           |   0.702|
|   601| <a href="https://twitter.com/asincopado">@asincopado</a>             |   0.702|
|   602| <a href="https://twitter.com/FrancescaFionda">@FrancescaFionda</a>   |   0.702|
|   603| <a href="https://twitter.com/davelevinthal">@davelevinthal</a>       |   0.333|
|   604| <a href="https://twitter.com/gijnArabic">@gijnArabic</a>             |   0.333|
|   605| <a href="https://twitter.com/DanJFord">@DanJFord</a>                 |   0.333|
|   606| <a href="https://twitter.com/MMInvestigates">@MMInvestigates</a>     |   0.333|
|   607| <a href="https://twitter.com/NCDJ_ASU">@NCDJ\_ASU</a>                |   0.333|
|   608| <a href="https://twitter.com/noeL_maS">@noeL\_maS</a>                |   0.333|
|   609| <a href="https://twitter.com/mediatwit">@mediatwit</a>               |   0.333|
|   610| <a href="https://twitter.com/MediaShiftOrg">@MediaShiftOrg</a>       |   0.333|
|   611| <a href="https://twitter.com/nyiathenomad">@nyiathenomad</a>         |   0.333|
