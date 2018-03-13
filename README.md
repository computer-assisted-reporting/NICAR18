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
|     1| <a href="https://twitter.com/IRE_NICAR">@IRE\_NICAR</a>              |  10.629|
|     2| <a href="https://twitter.com/MacDiva">@MacDiva</a>                   |   9.997|
|     3| <a href="https://twitter.com/Danict89">@Danict89</a>                 |   9.509|
|     4| <a href="https://twitter.com/iff_or">@iff\_or</a>                    |   7.739|
|     5| <a href="https://twitter.com/albertocairo">@albertocairo</a>         |   7.696|
|     6| <a href="https://twitter.com/susannahlocke">@susannahlocke</a>       |   7.685|
|     7| <a href="https://twitter.com/dataeditor">@dataeditor</a>             |   7.632|
|     8| <a href="https://twitter.com/christinezhang">@christinezhang</a>     |   7.343|
|     9| <a href="https://twitter.com/rachelwalexande">@rachelwalexande</a>   |   7.252|
|    10| <a href="https://twitter.com/itsgeorrge">@itsgeorrge</a>             |   7.170|
|    11| <a href="https://twitter.com/mizzousundevil">@mizzousundevil</a>     |   6.991|
|    12| <a href="https://twitter.com/asduner">@asduner</a>                   |   6.991|
|    13| <a href="https://twitter.com/barbaramaseda">@barbaramaseda</a>       |   6.704|
|    14| <a href="https://twitter.com/merbroussard">@merbroussard</a>         |   6.691|
|    15| <a href="https://twitter.com/martinstabe">@martinstabe</a>           |   6.691|
|    16| <a href="https://twitter.com/fvaraorta">@fvaraorta</a>               |   6.613|
|    17| <a href="https://twitter.com/myersjustinc">@myersjustinc</a>         |   6.573|
|    18| <a href="https://twitter.com/ultracasual">@ultracasual</a>           |   6.330|
|    19| <a href="https://twitter.com/Cezary">@Cezary</a>                     |   6.316|
|    20| <a href="https://twitter.com/LNdata">@LNdata</a>                     |   6.246|
|    21| <a href="https://twitter.com/AditiHBhandari">@AditiHBhandari</a>     |   6.189|
|    22| <a href="https://twitter.com/sandhya__k">@sandhya\_\_k</a>           |   6.087|
|    23| <a href="https://twitter.com/palewire">@palewire</a>                 |   6.058|
|    24| <a href="https://twitter.com/greglinch">@greglinch</a>               |   5.954|
|    25| <a href="https://twitter.com/charlesornstein">@charlesornstein</a>   |   5.768|
|    26| <a href="https://twitter.com/TWallack">@TWallack</a>                 |   5.689|
|    27| <a href="https://twitter.com/hadleywickham">@hadleywickham</a>       |   5.640|
|    28| <a href="https://twitter.com/sarhutch">@sarhutch</a>                 |   5.575|
|    29| <a href="https://twitter.com/Riogringa">@Riogringa</a>               |   5.575|
|    30| <a href="https://twitter.com/digiphile">@digiphile</a>               |   5.542|
|    31| <a href="https://twitter.com/sharon000">@sharon000</a>               |   5.457|
|    32| <a href="https://twitter.com/dancow">@dancow</a>                     |   5.440|
|    33| <a href="https://twitter.com/jkteoh">@jkteoh</a>                     |   5.440|
|    34| <a href="https://twitter.com/DougHaddix">@DougHaddix</a>             |   5.440|
|    35| <a href="https://twitter.com/carla_astudi">@carla\_astudi</a>        |   5.406|
|    36| <a href="https://twitter.com/mikejcorey">@mikejcorey</a>             |   5.319|
|    37| <a href="https://twitter.com/JSKstanford">@JSKstanford</a>           |   5.319|
|    38| <a href="https://twitter.com/Maid_Marianne">@Maid\_Marianne</a>      |   5.301|
|    39| <a href="https://twitter.com/datentaeterin">@datentaeterin</a>       |   5.283|
|    40| <a href="https://twitter.com/salcedonews">@salcedonews</a>           |   5.193|
|    41| <a href="https://twitter.com/NataliaMazotte">@NataliaMazotte</a>     |   5.156|
|    42| <a href="https://twitter.com/emamd">@emamd</a>                       |   5.119|
|    43| <a href="https://twitter.com/derekwillis">@derekwillis</a>           |   5.101|
|    44| <a href="https://twitter.com/PatrickMGarvin">@PatrickMGarvin</a>     |   5.101|
|    45| <a href="https://twitter.com/jeremycaplan">@jeremycaplan</a>         |   5.082|
|    46| <a href="https://twitter.com/SophieWarnes">@SophieWarnes</a>         |   5.044|
|    47| <a href="https://twitter.com/Jeremy_CF_Lin">@Jeremy\_CF\_Lin</a>     |   5.006|
|    48| <a href="https://twitter.com/JonSCollins">@JonSCollins</a>           |   5.006|
|    49| <a href="https://twitter.com/stiles">@stiles</a>                     |   4.928|
|    50| <a href="https://twitter.com/fabiolatorres">@fabiolatorres</a>       |   4.908|
|    51| <a href="https://twitter.com/areena_arora">@areena\_arora</a>        |   4.908|
|    52| <a href="https://twitter.com/SStirling">@SStirling</a>               |   4.888|
|    53| <a href="https://twitter.com/dhmontgomery">@dhmontgomery</a>         |   4.848|
|    54| <a href="https://twitter.com/paldhous">@paldhous</a>                 |   4.848|
|    55| <a href="https://twitter.com/TaylorJHartz">@TaylorJHartz</a>         |   4.828|
|    56| <a href="https://twitter.com/grovesprof">@grovesprof</a>             |   4.746|
|    57| <a href="https://twitter.com/chrishagan">@chrishagan</a>             |   4.746|
|    58| <a href="https://twitter.com/cerealcommas">@cerealcommas</a>         |   4.725|
|    59| <a href="https://twitter.com/jazzmyth">@jazzmyth</a>                 |   4.704|
|    60| <a href="https://twitter.com/_thetextfiles">@\_thetextfiles</a>      |   4.683|
|    61| <a href="https://twitter.com/nausheenhusain">@nausheenhusain</a>     |   4.683|
|    62| <a href="https://twitter.com/bymarkwalker">@bymarkwalker</a>         |   4.683|
|    63| <a href="https://twitter.com/forestgregg">@forestgregg</a>           |   4.641|
|    64| <a href="https://twitter.com/charlesminshew">@charlesminshew</a>     |   4.641|
|    65| <a href="https://twitter.com/jrue">@jrue</a>                         |   4.619|
|    66| <a href="https://twitter.com/mjbeckel">@mjbeckel</a>                 |   4.619|
|    67| <a href="https://twitter.com/richgor">@richgor</a>                   |   4.598|
|    68| <a href="https://twitter.com/kbmiami">@kbmiami</a>                   |   4.598|
|    69| <a href="https://twitter.com/MaryJoWebster">@MaryJoWebster</a>       |   4.576|
|    70| <a href="https://twitter.com/gijn">@gijn</a>                         |   4.576|
|    71| <a href="https://twitter.com/AnnaFlagg">@AnnaFlagg</a>               |   4.576|
|    72| <a href="https://twitter.com/jonkeegan">@jonkeegan</a>               |   4.554|
|    73| <a href="https://twitter.com/macloo">@macloo</a>                     |   4.510|
|    74| <a href="https://twitter.com/knightlab">@knightlab</a>               |   4.510|
|    75| <a href="https://twitter.com/ucbsoj">@ucbsoj</a>                     |   4.510|
|    76| <a href="https://twitter.com/lenagroeger">@lenagroeger</a>           |   4.487|
|    77| <a href="https://twitter.com/momiperalta">@momiperalta</a>           |   4.487|
|    78| <a href="https://twitter.com/theboysmithy">@theboysmithy</a>         |   4.487|
|    79| <a href="https://twitter.com/_erinmansfield">@\_erinmansfield</a>    |   4.465|
|    80| <a href="https://twitter.com/haddadme">@haddadme</a>                 |   4.465|
|    81| <a href="https://twitter.com/maxharlow">@maxharlow</a>               |   4.465|
|    82| <a href="https://twitter.com/brentajones">@brentajones</a>           |   4.442|
|    83| <a href="https://twitter.com/readelev">@readelev</a>                 |   4.419|
|    84| <a href="https://twitter.com/NewsbySchmidt">@NewsbySchmidt</a>       |   4.419|
|    85| <a href="https://twitter.com/internetrebecca">@internetrebecca</a>   |   4.396|
|    86| <a href="https://twitter.com/ofadam">@ofadam</a>                     |   4.396|
|    87| <a href="https://twitter.com/MargotWilliams">@MargotWilliams</a>     |   4.350|
|    88| <a href="https://twitter.com/miguelpaz">@miguelpaz</a>               |   4.350|
|    89| <a href="https://twitter.com/fcoel">@fcoel</a>                       |   4.326|
|    90| <a href="https://twitter.com/losowsky">@losowsky</a>                 |   4.302|
|    91| <a href="https://twitter.com/KarrieKehoe">@KarrieKehoe</a>           |   4.302|
|    92| <a href="https://twitter.com/djordjepadejski">@djordjepadejski</a>   |   4.302|
|    93| <a href="https://twitter.com/opennews">@opennews</a>                 |   4.278|
|    94| <a href="https://twitter.com/anlugonz">@anlugonz</a>                 |   4.278|
|    95| <a href="https://twitter.com/jeremybowers">@jeremybowers</a>         |   4.205|
|    96| <a href="https://twitter.com/tylrfishr">@tylrfishr</a>               |   4.180|
|    97| <a href="https://twitter.com/otraletra">@otraletra</a>               |   4.180|
|    98| <a href="https://twitter.com/city_bureau">@city\_bureau</a>          |   4.180|
|    99| <a href="https://twitter.com/DDJ_Tools">@DDJ\_Tools</a>              |   4.155|
|   100| <a href="https://twitter.com/CarlieProcell">@CarlieProcell</a>       |   4.130|
|   101| <a href="https://twitter.com/carlosrvirgen">@carlosrvirgen</a>       |   4.130|
|   102| <a href="https://twitter.com/SamanthaSunne">@SamanthaSunne</a>       |   4.130|
|   103| <a href="https://twitter.com/MissRyley">@MissRyley</a>               |   4.130|
|   104| <a href="https://twitter.com/ChadSDay">@ChadSDay</a>                 |   4.105|
|   105| <a href="https://twitter.com/abtran">@abtran</a>                     |   4.105|
|   106| <a href="https://twitter.com/jonathanstray">@jonathanstray</a>       |   4.105|
|   107| <a href="https://twitter.com/pickoffwhite">@pickoffwhite</a>         |   4.079|
|   108| <a href="https://twitter.com/ProPublica">@ProPublica</a>             |   4.079|
|   109| <a href="https://twitter.com/ndiakopoulos">@ndiakopoulos</a>         |   4.053|
|   110| <a href="https://twitter.com/jayohday">@jayohday</a>                 |   4.053|
|   111| <a href="https://twitter.com/kearneymw">@kearneymw</a>               |   4.027|
|   112| <a href="https://twitter.com/ByNinaMartin">@ByNinaMartin</a>         |   4.027|
|   113| <a href="https://twitter.com/fexi">@fexi</a>                         |   4.027|
|   114| <a href="https://twitter.com/LaSharah">@LaSharah</a>                 |   4.027|
|   115| <a href="https://twitter.com/LauraC_Moscoso">@LauraC\_Moscoso</a>    |   3.974|
|   116| <a href="https://twitter.com/derekkravitz">@derekkravitz</a>         |   3.974|
|   117| <a href="https://twitter.com/derekeder">@derekeder</a>               |   3.974|
|   118| <a href="https://twitter.com/omayasosa">@omayasosa</a>               |   3.947|
|   119| <a href="https://twitter.com/webjournalist">@webjournalist</a>       |   3.947|
|   120| <a href="https://twitter.com/angshah">@angshah</a>                   |   3.947|
|   121| <a href="https://twitter.com/rachel_shorey">@rachel\_shorey</a>      |   3.947|
|   122| <a href="https://twitter.com/kristinhussey1">@kristinhussey1</a>     |   3.920|
|   123| <a href="https://twitter.com/alysiasanto">@alysiasanto</a>           |   3.920|
|   124| <a href="https://twitter.com/chrisjeavans">@chrisjeavans</a>         |   3.920|
|   125| <a href="https://twitter.com/sarambsimon">@sarambsimon</a>           |   3.892|
|   126| <a href="https://twitter.com/michelleminkoff">@michelleminkoff</a>   |   3.892|
|   127| <a href="https://twitter.com/DeniseMalan">@DeniseMalan</a>           |   3.864|
|   128| <a href="https://twitter.com/lamthuyvo">@lamthuyvo</a>               |   3.864|
|   129| <a href="https://twitter.com/ByJohnRRoby">@ByJohnRRoby</a>           |   3.864|
|   130| <a href="https://twitter.com/knightfdn">@knightfdn</a>               |   3.864|
|   131| <a href="https://twitter.com/cephillips">@cephillips</a>             |   3.836|
|   132| <a href="https://twitter.com/giannagruen">@giannagruen</a>           |   3.836|
|   133| <a href="https://twitter.com/mtdukes">@mtdukes</a>                   |   3.836|
|   134| <a href="https://twitter.com/cpipr">@cpipr</a>                       |   3.779|
|   135| <a href="https://twitter.com/maggiemulvihill">@maggiemulvihill</a>   |   3.779|
|   136| <a href="https://twitter.com/SunFoundation">@SunFoundation</a>       |   3.779|
|   137| <a href="https://twitter.com/mazet">@mazet</a>                       |   3.750|
|   138| <a href="https://twitter.com/MikeStucka">@MikeStucka</a>             |   3.721|
|   139| <a href="https://twitter.com/StephenStockTV">@StephenStockTV</a>     |   3.691|
|   140| <a href="https://twitter.com/TishaESPN">@TishaESPN</a>               |   3.691|
|   141| <a href="https://twitter.com/nhannahjones">@nhannahjones</a>         |   3.691|
|   142| <a href="https://twitter.com/nixonron">@nixonron</a>                 |   3.691|
|   143| <a href="https://twitter.com/DK_NewsData">@DK\_NewsData</a>          |   3.661|
|   144| <a href="https://twitter.com/OpenSemSearch">@OpenSemSearch</a>       |   3.661|
|   145| <a href="https://twitter.com/JohnMuyskens">@JohnMuyskens</a>         |   3.661|
|   146| <a href="https://twitter.com/DeniseDSLu">@DeniseDSLu</a>             |   3.600|
|   147| <a href="https://twitter.com/JessicaHuseman">@JessicaHuseman</a>     |   3.600|
|   148| <a href="https://twitter.com/shmcminn">@shmcminn</a>                 |   3.600|
|   149| <a href="https://twitter.com/levinecarrie">@levinecarrie</a>         |   3.600|
|   150| <a href="https://twitter.com/marc_smith">@marc\_smith</a>            |   3.600|
|   151| <a href="https://twitter.com/EvaConstantaras">@EvaConstantaras</a>   |   3.569|
|   152| <a href="https://twitter.com/katchicago">@katchicago</a>             |   3.569|
|   153| <a href="https://twitter.com/gerald_arthur">@gerald\_arthur</a>      |   3.569|
|   154| <a href="https://twitter.com/benlkeith">@benlkeith</a>               |   3.569|
|   155| <a href="https://twitter.com/LoBenichou">@LoBenichou</a>             |   3.569|
|   156| <a href="https://twitter.com/cjworkbench">@cjworkbench</a>           |   3.569|
|   157| <a href="https://twitter.com/npenzenstadler">@npenzenstadler</a>     |   3.537|
|   158| <a href="https://twitter.com/ahofschneider">@ahofschneider</a>       |   3.537|
|   159| <a href="https://twitter.com/eads">@eads</a>                         |   3.537|
|   160| <a href="https://twitter.com/edbice">@edbice</a>                     |   3.537|
|   161| <a href="https://twitter.com/Disha_RC">@Disha\_RC</a>                |   3.537|
|   162| <a href="https://twitter.com/bencschmitt">@bencschmitt</a>           |   3.505|
|   163| <a href="https://twitter.com/dangerscarf">@dangerscarf</a>           |   3.505|
|   164| <a href="https://twitter.com/schwanksta">@schwanksta</a>             |   3.505|
|   165| <a href="https://twitter.com/HamdanAzhar">@HamdanAzhar</a>           |   3.505|
|   166| <a href="https://twitter.com/mattdrange">@mattdrange</a>             |   3.472|
|   167| <a href="https://twitter.com/msanchezMIA">@msanchezMIA</a>           |   3.472|
|   168| <a href="https://twitter.com/journtoolbox">@journtoolbox</a>         |   3.472|
|   169| <a href="https://twitter.com/kimbriellwapo">@kimbriellwapo</a>       |   3.440|
|   170| <a href="https://twitter.com/matt_kiefer">@matt\_kiefer</a>          |   3.440|
|   171| <a href="https://twitter.com/jordanrau">@jordanrau</a>               |   3.406|
|   172| <a href="https://twitter.com/typodactyl">@typodactyl</a>             |   3.406|
|   173| <a href="https://twitter.com/dataKateR">@dataKateR</a>               |   3.406|
|   174| <a href="https://twitter.com/aric_chokey">@aric\_chokey</a>          |   3.406|
|   175| <a href="https://twitter.com/rtburg">@rtburg</a>                     |   3.406|
|   176| <a href="https://twitter.com/MoizSyed">@MoizSyed</a>                 |   3.406|
|   177| <a href="https://twitter.com/elliot_bentley">@elliot\_bentley</a>    |   3.406|
|   178| <a href="https://twitter.com/ashlynstill">@ashlynstill</a>           |   3.372|
|   179| <a href="https://twitter.com/gebeloffnyt">@gebeloffnyt</a>           |   3.372|
|   180| <a href="https://twitter.com/JournoKateH">@JournoKateH</a>           |   3.372|
|   181| <a href="https://twitter.com/LeilaHaddou">@LeilaHaddou</a>           |   3.372|
|   182| <a href="https://twitter.com/rararahima">@rararahima</a>             |   3.372|
|   183| <a href="https://twitter.com/anieldaniel">@anieldaniel</a>           |   3.372|
|   184| <a href="https://twitter.com/kavyaSukumar">@kavyaSukumar</a>         |   3.372|
|   185| <a href="https://twitter.com/susie_c">@susie\_c</a>                  |   3.372|
|   186| <a href="https://twitter.com/mshelton">@mshelton</a>                 |   3.372|
|   187| <a href="https://twitter.com/Gregatao">@Gregatao</a>                 |   3.372|
|   188| <a href="https://twitter.com/DanielTrielli">@DanielTrielli</a>       |   3.338|
|   189| <a href="https://twitter.com/davidherzog">@davidherzog</a>           |   3.338|
|   190| <a href="https://twitter.com/zubakskees">@zubakskees</a>             |   3.338|
|   191| <a href="https://twitter.com/jpeebles">@jpeebles</a>                 |   3.303|
|   192| <a href="https://twitter.com/JoeGermuska">@JoeGermuska</a>           |   3.303|
|   193| <a href="https://twitter.com/allisonsross">@allisonsross</a>         |   3.303|
|   194| <a href="https://twitter.com/magiccia">@magiccia</a>                 |   3.267|
|   195| <a href="https://twitter.com/amyjo_brown">@amyjo\_brown</a>          |   3.267|
|   196| <a href="https://twitter.com/JakeaEkdahl">@JakeaEkdahl</a>           |   3.267|
|   197| <a href="https://twitter.com/AnnieWaldman">@AnnieWaldman</a>         |   3.231|
|   198| <a href="https://twitter.com/angelicadesigns">@angelicadesigns</a>   |   3.231|
|   199| <a href="https://twitter.com/sarahanneconway">@sarahanneconway</a>   |   3.231|
|   200| <a href="https://twitter.com/CynthFernandez">@CynthFernandez</a>     |   3.231|
|   201| <a href="https://twitter.com/wardrachel">@wardrachel</a>             |   3.231|
|   202| <a href="https://twitter.com/mizamudio">@mizamudio</a>               |   3.231|
|   203| <a href="https://twitter.com/EscolaDeDados">@EscolaDeDados</a>       |   3.231|
|   204| <a href="https://twitter.com/columbiajourn">@columbiajourn</a>       |   3.231|
|   205| <a href="https://twitter.com/a_mendelson">@a\_mendelson</a>          |   3.195|
|   206| <a href="https://twitter.com/ravenben">@ravenben</a>                 |   3.195|
|   207| <a href="https://twitter.com/SooOh">@SooOh</a>                       |   3.195|
|   208| <a href="https://twitter.com/j_la28">@j\_la28</a>                    |   3.195|
|   209| <a href="https://twitter.com/deldeib">@deldeib</a>                   |   3.195|
|   210| <a href="https://twitter.com/VigneshR">@VigneshR</a>                 |   3.195|
|   211| <a href="https://twitter.com/kennelliott">@kennelliott</a>           |   3.195|
|   212| <a href="https://twitter.com/MJBerens1">@MJBerens1</a>               |   3.157|
|   213| <a href="https://twitter.com/euniceylee">@euniceylee</a>             |   3.157|
|   214| <a href="https://twitter.com/kellycalagna">@kellycalagna</a>         |   3.157|
|   215| <a href="https://twitter.com/emilywithrow">@emilywithrow</a>         |   3.157|
|   216| <a href="https://twitter.com/HilkeSchellmann">@HilkeSchellmann</a>   |   3.157|
|   217| <a href="https://twitter.com/SeraMak">@SeraMak</a>                   |   3.157|
|   218| <a href="https://twitter.com/JoeYerardi">@JoeYerardi</a>             |   3.157|
|   219| <a href="https://twitter.com/br_data">@br\_data</a>                  |   3.119|
|   220| <a href="https://twitter.com/tiffehr">@tiffehr</a>                   |   3.119|
|   221| <a href="https://twitter.com/joannaskao">@joannaskao</a>             |   3.119|
|   222| <a href="https://twitter.com/JaymeKFraser">@JaymeKFraser</a>         |   3.119|
|   223| <a href="https://twitter.com/AlexMahadevan">@AlexMahadevan</a>       |   3.119|
|   224| <a href="https://twitter.com/lucyparsonslabs">@lucyparsonslabs</a>   |   3.119|
|   225| <a href="https://twitter.com/TTBallantyne">@TTBallantyne</a>         |   3.080|
|   226| <a href="https://twitter.com/felavsky">@felavsky</a>                 |   3.080|
|   227| <a href="https://twitter.com/NicoleKDan">@NicoleKDan</a>             |   3.080|
|   228| <a href="https://twitter.com/ICFJ">@ICFJ</a>                         |   3.080|
|   229| <a href="https://twitter.com/KenichiSerino">@KenichiSerino</a>       |   3.080|
|   230| <a href="https://twitter.com/JonRMcClure">@JonRMcClure</a>           |   3.080|
|   231| <a href="https://twitter.com/sarahalvarezMI">@sarahalvarezMI</a>     |   3.080|
|   232| <a href="https://twitter.com/antoniocuga">@antoniocuga</a>           |   3.080|
|   233| <a href="https://twitter.com/khantasha">@khantasha</a>               |   3.080|
|   234| <a href="https://twitter.com/beckyyerak">@beckyyerak</a>             |   3.080|
|   235| <a href="https://twitter.com/kschorsch">@kschorsch</a>               |   3.041|
|   236| <a href="https://twitter.com/JacopoOttaviani">@JacopoOttaviani</a>   |   3.041|
|   237| <a href="https://twitter.com/cthydng">@cthydng</a>                   |   3.041|
|   238| <a href="https://twitter.com/Eeshapendharkar">@Eeshapendharkar</a>   |   3.001|
|   239| <a href="https://twitter.com/mfederis">@mfederis</a>                 |   3.001|
|   240| <a href="https://twitter.com/amber_waves">@amber\_waves</a>          |   3.001|
|   241| <a href="https://twitter.com/hunter_owens">@hunter\_owens</a>        |   3.001|
|   242| <a href="https://twitter.com/BrettMmurphy">@BrettMmurphy</a>         |   3.001|
|   243| <a href="https://twitter.com/sfrostenson">@sfrostenson</a>           |   3.001|
|   244| <a href="https://twitter.com/nilesmedia">@nilesmedia</a>             |   3.001|
|   245| <a href="https://twitter.com/amgarrettphoto">@amgarrettphoto</a>     |   3.001|
|   246| <a href="https://twitter.com/nassos_">@nassos\_</a>                  |   3.001|
|   247| <a href="https://twitter.com/John__Sadler">@John\_\_Sadler</a>       |   2.959|
|   248| <a href="https://twitter.com/MadiLAlexander">@MadiLAlexander</a>     |   2.959|
|   249| <a href="https://twitter.com/bpopken">@bpopken</a>                   |   2.959|
|   250| <a href="https://twitter.com/amandabee">@amandabee</a>               |   2.959|
|   251| <a href="https://twitter.com/anfuller">@anfuller</a>                 |   2.959|
|   252| <a href="https://twitter.com/darlacameron">@darlacameron</a>         |   2.959|
|   253| <a href="https://twitter.com/TowCenter">@TowCenter</a>               |   2.959|
|   254| <a href="https://twitter.com/AKSarahB">@AKSarahB</a>                 |   2.959|
|   255| <a href="https://twitter.com/MeganLuther">@MeganLuther</a>           |   2.917|
|   256| <a href="https://twitter.com/LaurenRohr">@LaurenRohr</a>             |   2.917|
|   257| <a href="https://twitter.com/brianboyer">@brianboyer</a>             |   2.917|
|   258| <a href="https://twitter.com/KenoyerKelly">@KenoyerKelly</a>         |   2.917|
|   259| <a href="https://twitter.com/sh_devulapalli">@sh\_devulapalli</a>    |   2.917|
|   260| <a href="https://twitter.com/MeghanHoyer">@MeghanHoyer</a>           |   2.917|
|   261| <a href="https://twitter.com/TimBroderick">@TimBroderick</a>         |   2.917|
|   262| <a href="https://twitter.com/molliehanley">@molliehanley</a>         |   2.917|
|   263| <a href="https://twitter.com/RecordsGeek">@RecordsGeek</a>           |   2.875|
|   264| <a href="https://twitter.com/yoli_martinez">@yoli\_martinez</a>      |   2.875|
|   265| <a href="https://twitter.com/CoreyGJohnson">@CoreyGJohnson</a>       |   2.875|
|   266| <a href="https://twitter.com/amayaverde">@amayaverde</a>             |   2.875|
|   267| <a href="https://twitter.com/jbenton">@jbenton</a>                   |   2.875|
|   268| <a href="https://twitter.com/pinardag">@pinardag</a>                 |   2.875|
|   269| <a href="https://twitter.com/AJVicens">@AJVicens</a>                 |   2.875|
|   270| <a href="https://twitter.com/mgafni">@mgafni</a>                     |   2.831|
|   271| <a href="https://twitter.com/knowtheory">@knowtheory</a>             |   2.831|
|   272| <a href="https://twitter.com/EPetenko">@EPetenko</a>                 |   2.831|
|   273| <a href="https://twitter.com/morisy">@morisy</a>                     |   2.831|
|   274| <a href="https://twitter.com/ToTheVictor">@ToTheVictor</a>           |   2.831|
|   275| <a href="https://twitter.com/toholdaquill">@toholdaquill</a>         |   2.831|
|   276| <a href="https://twitter.com/nickswyter">@nickswyter</a>             |   2.831|
|   277| <a href="https://twitter.com/gretakaul">@gretakaul</a>               |   2.786|
|   278| <a href="https://twitter.com/campbellronaldw">@campbellronaldw</a>   |   2.786|
|   279| <a href="https://twitter.com/thomasgpadilla">@thomasgpadilla</a>     |   2.786|
|   280| <a href="https://twitter.com/hannah_recht">@hannah\_recht</a>        |   2.786|
|   281| <a href="https://twitter.com/BritRenee_">@BritRenee\_</a>            |   2.786|
|   282| <a href="https://twitter.com/StuartCLT">@StuartCLT</a>               |   2.786|
|   283| <a href="https://twitter.com/allyjarmanning">@allyjarmanning</a>     |   2.786|
|   284| <a href="https://twitter.com/gaufre">@gaufre</a>                     |   2.786|
|   285| <a href="https://twitter.com/UO_Catalyst">@UO\_Catalyst</a>          |   2.786|
|   286| <a href="https://twitter.com/NadineSebai">@NadineSebai</a>           |   2.786|
|   287| <a href="https://twitter.com/rgbrom">@rgbrom</a>                     |   2.740|
|   288| <a href="https://twitter.com/ChristyGutowsk1">@ChristyGutowsk1</a>   |   2.740|
|   289| <a href="https://twitter.com/miriamkp">@miriamkp</a>                 |   2.740|
|   290| <a href="https://twitter.com/cbaxter1">@cbaxter1</a>                 |   2.740|
|   291| <a href="https://twitter.com/gufalei">@gufalei</a>                   |   2.740|
|   292| <a href="https://twitter.com/MizellStewart">@MizellStewart</a>       |   2.692|
|   293| <a href="https://twitter.com/songbogong">@songbogong</a>             |   2.692|
|   294| <a href="https://twitter.com/MateoClarke">@MateoClarke</a>           |   2.692|
|   295| <a href="https://twitter.com/smfrogers">@smfrogers</a>               |   2.692|
|   296| <a href="https://twitter.com/bikeprof">@bikeprof</a>                 |   2.692|
|   297| <a href="https://twitter.com/asuozzo">@asuozzo</a>                   |   2.692|
|   298| <a href="https://twitter.com/MuckRock">@MuckRock</a>                 |   2.692|
|   299| <a href="https://twitter.com/scott2b">@scott2b</a>                   |   2.692|
|   300| <a href="https://twitter.com/chrisschnaars">@chrisschnaars</a>       |   2.644|
|   301| <a href="https://twitter.com/akesslerdc">@akesslerdc</a>             |   2.644|
|   302| <a href="https://twitter.com/DrewOCCRP">@DrewOCCRP</a>               |   2.644|
|   303| <a href="https://twitter.com/Bahareh360">@Bahareh360</a>             |   2.644|
|   304| <a href="https://twitter.com/marymhudetz">@marymhudetz</a>           |   2.644|
|   305| <a href="https://twitter.com/ChicagoReporter">@ChicagoReporter</a>   |   2.644|
|   306| <a href="https://twitter.com/NiemanLab">@NiemanLab</a>               |   2.644|
|   307| <a href="https://twitter.com/elthenerd">@elthenerd</a>               |   2.644|
|   308| <a href="https://twitter.com/joemurph">@joemurph</a>                 |   2.644|
|   309| <a href="https://twitter.com/pamelagdempsey">@pamelagdempsey</a>     |   2.644|
|   310| <a href="https://twitter.com/zehnzehen">@zehnzehen</a>               |   2.644|
|   311| <a href="https://twitter.com/UOsojc">@UOsojc</a>                     |   2.644|
|   312| <a href="https://twitter.com/lenifaye">@lenifaye</a>                 |   2.644|
|   313| <a href="https://twitter.com/91_pometti">@91\_pometti</a>            |   2.644|
|   314| <a href="https://twitter.com/TeriSforza">@TeriSforza</a>             |   2.594|
|   315| <a href="https://twitter.com/guilherme_amado">@guilherme\_amado</a>  |   2.594|
|   316| <a href="https://twitter.com/digitalamysw">@digitalamysw</a>         |   2.594|
|   317| <a href="https://twitter.com/poverberg">@poverberg</a>               |   2.594|
|   318| <a href="https://twitter.com/paulbradshaw">@paulbradshaw</a>         |   2.594|
|   319| <a href="https://twitter.com/geoffhing">@geoffhing</a>               |   2.594|
|   320| <a href="https://twitter.com/jersey_janet">@jersey\_janet</a>        |   2.594|
|   321| <a href="https://twitter.com/robschoeffel">@robschoeffel</a>         |   2.594|
|   322| <a href="https://twitter.com/rgibbs">@rgibbs</a>                     |   2.594|
|   323| <a href="https://twitter.com/UlrikBaltzer">@UlrikBaltzer</a>         |   2.594|
|   324| <a href="https://twitter.com/credcoalition">@credcoalition</a>       |   2.594|
|   325| <a href="https://twitter.com/ssdatar">@ssdatar</a>                   |   2.542|
|   326| <a href="https://twitter.com/ceostroff">@ceostroff</a>               |   2.542|
|   327| <a href="https://twitter.com/cherylwt">@cherylwt</a>                 |   2.542|
|   328| <a href="https://twitter.com/hollyhacker">@hollyhacker</a>           |   2.542|
|   329| <a href="https://twitter.com/Tessa_Weinberg">@Tessa\_Weinberg</a>    |   2.542|
|   330| <a href="https://twitter.com/kleinmatic">@kleinmatic</a>             |   2.542|
|   331| <a href="https://twitter.com/pilhofer">@pilhofer</a>                 |   2.542|
|   332| <a href="https://twitter.com/mpiccorossi">@mpiccorossi</a>           |   2.542|
|   333| <a href="https://twitter.com/SamataJo">@SamataJo</a>                 |   2.542|
|   334| <a href="https://twitter.com/DataMadeCo">@DataMadeCo</a>             |   2.542|
|   335| <a href="https://twitter.com/ericuman">@ericuman</a>                 |   2.542|
|   336| <a href="https://twitter.com/boakyecitifm">@boakyecitifm</a>         |   2.489|
|   337| <a href="https://twitter.com/IAmStevenPotter">@IAmStevenPotter</a>   |   2.489|
|   338| <a href="https://twitter.com/gabriellecalise">@gabriellecalise</a>   |   2.489|
|   339| <a href="https://twitter.com/allthingscensus">@allthingscensus</a>   |   2.489|
|   340| <a href="https://twitter.com/act_rational">@act\_rational</a>        |   2.489|
|   341| <a href="https://twitter.com/jlstro">@jlstro</a>                     |   2.489|
|   342| <a href="https://twitter.com/d_holli">@d\_holli</a>                  |   2.489|
|   343| <a href="https://twitter.com/ssktanaka">@ssktanaka</a>               |   2.489|
|   344| <a href="https://twitter.com/DetroitReporter">@DetroitReporter</a>   |   2.434|
|   345| <a href="https://twitter.com/RayLong">@RayLong</a>                   |   2.434|
|   346| <a href="https://twitter.com/ranjchak">@ranjchak</a>                 |   2.434|
|   347| <a href="https://twitter.com/adinarayan">@adinarayan</a>             |   2.434|
|   348| <a href="https://twitter.com/IJNet">@IJNet</a>                       |   2.434|
|   349| <a href="https://twitter.com/eklucas">@eklucas</a>                   |   2.434|
|   350| <a href="https://twitter.com/_chloelessard_">@\_chloelessard\_</a>   |   2.434|
|   351| <a href="https://twitter.com/bethfertig">@bethfertig</a>             |   2.434|
|   352| <a href="https://twitter.com/queenalma19">@queenalma19</a>           |   2.434|
|   353| <a href="https://twitter.com/lyonwj">@lyonwj</a>                     |   2.434|
|   354| <a href="https://twitter.com/BuildCoffee">@BuildCoffee</a>           |   2.434|
|   355| <a href="https://twitter.com/getcraftyaf">@getcraftyaf</a>           |   2.378|
|   356| <a href="https://twitter.com/txtianmiller">@txtianmiller</a>         |   2.378|
|   357| <a href="https://twitter.com/Ukingsdata">@Ukingsdata</a>             |   2.378|
|   358| <a href="https://twitter.com/robertrdenton">@robertrdenton</a>       |   2.378|
|   359| <a href="https://twitter.com/blatchfordtr">@blatchfordtr</a>         |   2.378|
|   360| <a href="https://twitter.com/ryanpitts">@ryanpitts</a>               |   2.378|
|   361| <a href="https://twitter.com/JeffHargarten">@JeffHargarten</a>       |   2.378|
|   362| <a href="https://twitter.com/JenAFifield">@JenAFifield</a>           |   2.378|
|   363| <a href="https://twitter.com/TimHendersonSL">@TimHendersonSL</a>     |   2.378|
|   364| <a href="https://twitter.com/dankeemahill">@dankeemahill</a>         |   2.378|
|   365| <a href="https://twitter.com/CEssig">@CEssig</a>                     |   2.378|
|   366| <a href="https://twitter.com/caseymmiller">@caseymmiller</a>         |   2.378|
|   367| <a href="https://twitter.com/RobertBenincasa">@RobertBenincasa</a>   |   2.378|
|   368| <a href="https://twitter.com/OpenSecretsDC">@OpenSecretsDC</a>       |   2.378|
|   369| <a href="https://twitter.com/ICFJKnight">@ICFJKnight</a>             |   2.378|
|   370| <a href="https://twitter.com/luisdaniel12">@luisdaniel12</a>         |   2.378|
|   371| <a href="https://twitter.com/danielschuman">@danielschuman</a>       |   2.378|
|   372| <a href="https://twitter.com/smr_foundation">@smr\_foundation</a>    |   2.378|
|   373| <a href="https://twitter.com/Jingnan_Huo">@Jingnan\_Huo</a>          |   2.319|
|   374| <a href="https://twitter.com/rwells1961">@rwells1961</a>             |   2.319|
|   375| <a href="https://twitter.com/louisekiernan">@louisekiernan</a>       |   2.319|
|   376| <a href="https://twitter.com/source">@source</a>                     |   2.319|
|   377| <a href="https://twitter.com/reginafcompton">@reginafcompton</a>     |   2.319|
|   378| <a href="https://twitter.com/ProPublicaIL">@ProPublicaIL</a>         |   2.319|
|   379| <a href="https://twitter.com/Vince_Dixon_">@Vince\_Dixon\_</a>       |   2.319|
|   380| <a href="https://twitter.com/tylermachado">@tylermachado</a>         |   2.319|
|   381| <a href="https://twitter.com/FedorZarkhin">@FedorZarkhin</a>         |   2.319|
|   382| <a href="https://twitter.com/kateconger">@kateconger</a>             |   2.319|
|   383| <a href="https://twitter.com/nicoledahmen">@nicoledahmen</a>         |   2.319|
|   384| <a href="https://twitter.com/ReutersPR">@ReutersPR</a>               |   2.319|
|   385| <a href="https://twitter.com/opencorporates">@opencorporates</a>     |   2.319|
|   386| <a href="https://twitter.com/RachelleFaroul">@RachelleFaroul</a>     |   2.258|
|   387| <a href="https://twitter.com/EvanWyloge">@EvanWyloge</a>             |   2.258|
|   388| <a href="https://twitter.com/jasongrotto">@jasongrotto</a>           |   2.258|
|   389| <a href="https://twitter.com/KCnSunshineJam">@KCnSunshineJam</a>     |   2.258|
|   390| <a href="https://twitter.com/jonahshai">@jonahshai</a>               |   2.258|
|   391| <a href="https://twitter.com/zstumgoren">@zstumgoren</a>             |   2.258|
|   392| <a href="https://twitter.com/Evie_xing">@Evie\_xing</a>              |   2.258|
|   393| <a href="https://twitter.com/robroc">@robroc</a>                     |   2.258|
|   394| <a href="https://twitter.com/JuliaJRH">@JuliaJRH</a>                 |   2.258|
|   395| <a href="https://twitter.com/heychrisbarr">@heychrisbarr</a>         |   2.258|
|   396| <a href="https://twitter.com/CaitMcGlade">@CaitMcGlade</a>           |   2.258|
|   397| <a href="https://twitter.com/No_Little_Plans">@No\_Little\_Plans</a> |   2.194|
|   398| <a href="https://twitter.com/jburnmurdoch">@jburnmurdoch</a>         |   2.194|
|   399| <a href="https://twitter.com/JournalismSandy">@JournalismSandy</a>   |   2.194|
|   400| <a href="https://twitter.com/sarahcnyt">@sarahcnyt</a>               |   2.194|
|   401| <a href="https://twitter.com/alastairgee">@alastairgee</a>           |   2.194|
|   402| <a href="https://twitter.com/luciovilla">@luciovilla</a>             |   2.194|
|   403| <a href="https://twitter.com/zhoyoyo">@zhoyoyo</a>                   |   2.194|
|   404| <a href="https://twitter.com/disolis">@disolis</a>                   |   2.194|
|   405| <a href="https://twitter.com/nodexl">@nodexl</a>                     |   2.194|
|   406| <a href="https://twitter.com/SamRoe">@SamRoe</a>                     |   2.194|
|   407| <a href="https://twitter.com/Clarii_D">@Clarii\_D</a>                |   2.194|
|   408| <a href="https://twitter.com/gregmunno">@gregmunno</a>               |   2.194|
|   409| <a href="https://twitter.com/cameronhickey">@cameronhickey</a>       |   2.194|
|   410| <a href="https://twitter.com/shansquared">@shansquared</a>           |   2.194|
|   411| <a href="https://twitter.com/saleemkhan">@saleemkhan</a>             |   2.194|
|   412| <a href="https://twitter.com/nwatzman">@nwatzman</a>                 |   2.194|
|   413| <a href="https://twitter.com/bugsact">@bugsact</a>                   |   2.127|
|   414| <a href="https://twitter.com/gijnAfrica">@gijnAfrica</a>             |   2.127|
|   415| <a href="https://twitter.com/shiying_cheng">@shiying\_cheng</a>      |   2.127|
|   416| <a href="https://twitter.com/UFJSchool">@UFJSchool</a>               |   2.127|
|   417| <a href="https://twitter.com/HartlandZoe">@HartlandZoe</a>           |   2.127|
|   418| <a href="https://twitter.com/john_diedrich">@john\_diedrich</a>      |   2.127|
|   419| <a href="https://twitter.com/lisalsong">@lisalsong</a>               |   2.127|
|   420| <a href="https://twitter.com/rcfp">@rcfp</a>                         |   2.127|
|   421| <a href="https://twitter.com/rctatman">@rctatman</a>                 |   2.127|
|   422| <a href="https://twitter.com/ChristieJules">@ChristieJules</a>       |   2.127|
|   423| <a href="https://twitter.com/jcsouth">@jcsouth</a>                   |   2.127|
|   424| <a href="https://twitter.com/miss_melanieg">@miss\_melanieg</a>      |   2.127|
|   425| <a href="https://twitter.com/ChiDM">@ChiDM</a>                       |   2.127|
|   426| <a href="https://twitter.com/bcumedia">@bcumedia</a>                 |   2.127|
|   427| <a href="https://twitter.com/AxiosVisuals">@AxiosVisuals</a>         |   2.127|
|   428| <a href="https://twitter.com/DATABASE_HULK">@DATABASE\_HULK</a>      |   2.057|
|   429| <a href="https://twitter.com/Fvjones">@Fvjones</a>                   |   2.057|
|   430| <a href="https://twitter.com/esagara">@esagara</a>                   |   2.057|
|   431| <a href="https://twitter.com/JacquieEli">@JacquieEli</a>             |   2.057|
|   432| <a href="https://twitter.com/KaplanDave">@KaplanDave</a>             |   2.057|
|   433| <a href="https://twitter.com/some_yeo">@some\_yeo</a>                |   2.057|
|   434| <a href="https://twitter.com/write_this_way">@write\_this\_way</a>   |   2.057|
|   435| <a href="https://twitter.com/kissane">@kissane</a>                   |   2.057|
|   436| <a href="https://twitter.com/gluissandoval">@gluissandoval</a>       |   2.057|
|   437| <a href="https://twitter.com/PaigeBlank">@PaigeBlank</a>             |   2.057|
|   438| <a href="https://twitter.com/iaivanova">@iaivanova</a>               |   2.057|
|   439| <a href="https://twitter.com/pierreconti">@pierreconti</a>           |   2.057|
|   440| <a href="https://twitter.com/JeffKLO">@JeffKLO</a>                   |   2.057|
|   441| <a href="https://twitter.com/walt_jw">@walt\_jw</a>                  |   2.057|
|   442| <a href="https://twitter.com/NYTInteractive">@NYTInteractive</a>     |   2.057|
|   443| <a href="https://twitter.com/ChiAppleseed">@ChiAppleseed</a>         |   2.057|
|   444| <a href="https://twitter.com/just_rashida">@just\_rashida</a>        |   1.983|
|   445| <a href="https://twitter.com/Lindenberger">@Lindenberger</a>         |   1.983|
|   446| <a href="https://twitter.com/JadJaffar">@JadJaffar</a>               |   1.983|
|   447| <a href="https://twitter.com/kclarkcollege">@kclarkcollege</a>       |   1.983|
|   448| <a href="https://twitter.com/gridinoc">@gridinoc</a>                 |   1.983|
|   449| <a href="https://twitter.com/resentfultweet">@resentfultweet</a>     |   1.983|
|   450| <a href="https://twitter.com/GerryLanosga">@GerryLanosga</a>         |   1.983|
|   451| <a href="https://twitter.com/justinJprice">@justinJprice</a>         |   1.983|
|   452| <a href="https://twitter.com/eidietrich">@eidietrich</a>             |   1.983|
|   453| <a href="https://twitter.com/JaredRutecki">@JaredRutecki</a>         |   1.983|
|   454| <a href="https://twitter.com/midatalove">@midatalove</a>             |   1.983|
|   455| <a href="https://twitter.com/nat_orenstein">@nat\_orenstein</a>      |   1.983|
|   456| <a href="https://twitter.com/latguild">@latguild</a>                 |   1.983|
|   457| <a href="https://twitter.com/ashhwu">@ashhwu</a>                     |   1.983|
|   458| <a href="https://twitter.com/mbgerring">@mbgerring</a>               |   1.983|
|   459| <a href="https://twitter.com/KHNews">@KHNews</a>                     |   1.983|
|   460| <a href="https://twitter.com/nicolelzhu">@nicolelzhu</a>             |   1.983|
|   461| <a href="https://twitter.com/mack_oxenden">@mack\_oxenden</a>        |   1.983|
|   462| <a href="https://twitter.com/WSJGraphics">@WSJGraphics</a>           |   1.983|
|   463| <a href="https://twitter.com/biffud">@biffud</a>                     |   1.983|
|   464| <a href="https://twitter.com/JOVRNALISM">@JOVRNALISM</a>             |   1.983|
|   465| <a href="https://twitter.com/ReporterTopher">@ReporterTopher</a>     |   1.905|
|   466| <a href="https://twitter.com/citizenkrans">@citizenkrans</a>         |   1.905|
|   467| <a href="https://twitter.com/DiannaNanez">@DiannaNanez</a>           |   1.905|
|   468| <a href="https://twitter.com/dougwmoore">@dougwmoore</a>             |   1.905|
|   469| <a href="https://twitter.com/stephanierlamm">@stephanierlamm</a>     |   1.905|
|   470| <a href="https://twitter.com/BradQSkillman">@BradQSkillman</a>       |   1.905|
|   471| <a href="https://twitter.com/eman_thedataman">@eman\_thedataman</a>  |   1.905|
|   472| <a href="https://twitter.com/hannahsbirch">@hannahsbirch</a>         |   1.905|
|   473| <a href="https://twitter.com/tylerallyndavis">@tylerallyndavis</a>   |   1.905|
|   474| <a href="https://twitter.com/bmyeung">@bmyeung</a>                   |   1.905|
|   475| <a href="https://twitter.com/ChrisLKellerLAT">@ChrisLKellerLAT</a>   |   1.905|
|   476| <a href="https://twitter.com/neenahyena">@neenahyena</a>             |   1.905|
|   477| <a href="https://twitter.com/stekhn">@stekhn</a>                     |   1.905|
|   478| <a href="https://twitter.com/lwalsh">@lwalsh</a>                     |   1.905|
|   479| <a href="https://twitter.com/cocteau">@cocteau</a>                   |   1.905|
|   480| <a href="https://twitter.com/SPIEGEL_Data">@SPIEGEL\_Data</a>        |   1.905|
|   481| <a href="https://twitter.com/gilra">@gilra</a>                       |   1.905|
|   482| <a href="https://twitter.com/BayAreaData">@BayAreaData</a>           |   1.905|
|   483| <a href="https://twitter.com/Botometer">@Botometer</a>               |   1.905|
|   484| <a href="https://twitter.com/truthyatindiana">@truthyatindiana</a>   |   1.822|
|   485| <a href="https://twitter.com/CraigPalosky">@CraigPalosky</a>         |   1.822|
|   486| <a href="https://twitter.com/jeanhuguesroy">@jeanhuguesroy</a>       |   1.822|
|   487| <a href="https://twitter.com/jpheasly">@jpheasly</a>                 |   1.822|
|   488| <a href="https://twitter.com/PBienenfeld">@PBienenfeld</a>           |   1.822|
|   489| <a href="https://twitter.com/Orla_McCaffrey">@Orla\_McCaffrey</a>    |   1.822|
|   490| <a href="https://twitter.com/Interhacktives">@Interhacktives</a>     |   1.822|
|   491| <a href="https://twitter.com/BR_Presse">@BR\_Presse</a>              |   1.822|
|   492| <a href="https://twitter.com/NAHJ">@NAHJ</a>                         |   1.822|
|   493| <a href="https://twitter.com/priyakkumar">@priyakkumar</a>           |   1.822|
|   494| <a href="https://twitter.com/heymatthenry">@heymatthenry</a>         |   1.822|
|   495| <a href="https://twitter.com/sarahsalvadore">@sarahsalvadore</a>     |   1.822|
|   496| <a href="https://twitter.com/toreyvanoot">@toreyvanoot</a>           |   1.822|
|   497| <a href="https://twitter.com/neo4j">@neo4j</a>                       |   1.822|
|   498| <a href="https://twitter.com/ReporterGina">@ReporterGina</a>         |   1.822|
|   499| <a href="https://twitter.com/adventurejason">@adventurejason</a>     |   1.822|
|   500| <a href="https://twitter.com/DanielPWWood">@DanielPWWood</a>         |   1.822|
|   501| <a href="https://twitter.com/garveymcvg">@garveymcvg</a>             |   1.822|
|   502| <a href="https://twitter.com/Lmazade">@Lmazade</a>                   |   1.822|
|   503| <a href="https://twitter.com/jhett93">@jhett93</a>                   |   1.822|
|   504| <a href="https://twitter.com/damienwillis">@damienwillis</a>         |   1.732|
|   505| <a href="https://twitter.com/nsandlin">@nsandlin</a>                 |   1.732|
|   506| <a href="https://twitter.com/aweiss">@aweiss</a>                     |   1.732|
|   507| <a href="https://twitter.com/degarciaknight">@degarciaknight</a>     |   1.732|
|   508| <a href="https://twitter.com/_NatalieEscobar">@\_NatalieEscobar</a>  |   1.732|
|   509| <a href="https://twitter.com/egabler">@egabler</a>                   |   1.732|
|   510| <a href="https://twitter.com/RobertMaguire_">@RobertMaguire\_</a>    |   1.732|
|   511| <a href="https://twitter.com/Sara_Wise">@Sara\_Wise</a>              |   1.732|
|   512| <a href="https://twitter.com/mielafetaw">@mielafetaw</a>             |   1.732|
|   513| <a href="https://twitter.com/aschweig">@aschweig</a>                 |   1.732|
|   514| <a href="https://twitter.com/Cathy_MeiyingHe">@Cathy\_MeiyingHe</a>  |   1.732|
|   515| <a href="https://twitter.com/JoonParkMusic">@JoonParkMusic</a>       |   1.732|
|   516| <a href="https://twitter.com/MattCData">@MattCData</a>               |   1.732|
|   517| <a href="https://twitter.com/micahflee">@micahflee</a>               |   1.732|
|   518| <a href="https://twitter.com/tweetbaack">@tweetbaack</a>             |   1.732|
|   519| <a href="https://twitter.com/caryaspinwall">@caryaspinwall</a>       |   1.732|
|   520| <a href="https://twitter.com/hwise29">@hwise29</a>                   |   1.732|
|   521| <a href="https://twitter.com/thensim0nsaid">@thensim0nsaid</a>       |   1.732|
|   522| <a href="https://twitter.com/LATdatadesk">@LATdatadesk</a>           |   1.732|
|   523| <a href="https://twitter.com/MonaChalabi">@MonaChalabi</a>           |   1.732|
|   524| <a href="https://twitter.com/onlyandrewn">@onlyandrewn</a>           |   1.732|
|   525| <a href="https://twitter.com/MattTheJourno">@MattTheJourno</a>       |   1.732|
|   526| <a href="https://twitter.com/irworkshop">@irworkshop</a>             |   1.732|
|   527| <a href="https://twitter.com/ajmnoble">@ajmnoble</a>                 |   1.732|
|   528| <a href="https://twitter.com/Carlapedret">@Carlapedret</a>           |   1.732|
|   529| <a href="https://twitter.com/mcrosasb">@mcrosasb</a>                 |   1.732|
|   530| <a href="https://twitter.com/jczamora">@jczamora</a>                 |   1.732|
|   531| <a href="https://twitter.com/abbyblachman">@abbyblachman</a>         |   1.732|
|   532| <a href="https://twitter.com/iaincollins">@iaincollins</a>           |   1.636|
|   533| <a href="https://twitter.com/jackgillum">@jackgillum</a>             |   1.636|
|   534| <a href="https://twitter.com/chrissiemurray">@chrissiemurray</a>     |   1.636|
|   535| <a href="https://twitter.com/AngelaTCR">@AngelaTCR</a>               |   1.636|
|   536| <a href="https://twitter.com/AJInvestigates">@AJInvestigates</a>     |   1.636|
|   537| <a href="https://twitter.com/GurmanBhatia">@GurmanBhatia</a>         |   1.636|
|   538| <a href="https://twitter.com/crit">@crit</a>                         |   1.636|
|   539| <a href="https://twitter.com/kcrowebasspro">@kcrowebasspro</a>       |   1.636|
|   540| <a href="https://twitter.com/anmccartney">@anmccartney</a>           |   1.636|
|   541| <a href="https://twitter.com/maggie_a_lee">@maggie\_a\_lee</a>       |   1.636|
|   542| <a href="https://twitter.com/ElenaFerrarin">@ElenaFerrarin</a>       |   1.636|
|   543| <a href="https://twitter.com/reporterbrooke">@reporterbrooke</a>     |   1.636|
|   544| <a href="https://twitter.com/rdmurphy">@rdmurphy</a>                 |   1.636|
|   545| <a href="https://twitter.com/The_Dean">@The\_Dean</a>                |   1.636|
|   546| <a href="https://twitter.com/mhkeller">@mhkeller</a>                 |   1.636|
|   547| <a href="https://twitter.com/biconnections">@biconnections</a>       |   1.636|
|   548| <a href="https://twitter.com/tgregoryreports">@tgregoryreports</a>   |   1.636|
|   549| <a href="https://twitter.com/Mapbox">@Mapbox</a>                     |   1.636|
|   550| <a href="https://twitter.com/sdooling">@sdooling</a>                 |   1.636|
|   551| <a href="https://twitter.com/LeeVGaines">@LeeVGaines</a>             |   1.636|
|   552| <a href="https://twitter.com/cdrentz">@cdrentz</a>                   |   1.636|
|   553| <a href="https://twitter.com/AlenaMaschke">@AlenaMaschke</a>         |   1.636|
|   554| <a href="https://twitter.com/JoshKalov">@JoshKalov</a>               |   1.636|
|   555| <a href="https://twitter.com/AnjeanetteDamon">@AnjeanetteDamon</a>   |   1.636|
|   556| <a href="https://twitter.com/niemanfdn">@niemanfdn</a>               |   1.636|
|   557| <a href="https://twitter.com/JacobNierenberg">@JacobNierenberg</a>   |   1.636|
|   558| <a href="https://twitter.com/databyler">@databyler</a>               |   1.636|
|   559| <a href="https://twitter.com/kylebentle">@kylebentle</a>             |   1.636|
|   560| <a href="https://twitter.com/MUOBrien">@MUOBrien</a>                 |   1.636|
|   561| <a href="https://twitter.com/MUCollegeofComm">@MUCollegeofComm</a>   |   1.636|
|   562| <a href="https://twitter.com/slifty">@slifty</a>                     |   1.636|
|   563| <a href="https://twitter.com/SouthSideWeekly">@SouthSideWeekly</a>   |   1.636|
|   564| <a href="https://twitter.com/SeanFDriscoll">@SeanFDriscoll</a>       |   1.531|
|   565| <a href="https://twitter.com/briankrebs">@briankrebs</a>             |   1.531|
|   566| <a href="https://twitter.com/josephmenn">@josephmenn</a>             |   1.531|
|   567| <a href="https://twitter.com/kelsey_ryan">@kelsey\_ryan</a>          |   1.531|
|   568| <a href="https://twitter.com/DerSPIEGEL">@DerSPIEGEL</a>             |   1.531|
|   569| <a href="https://twitter.com/juliacarriew">@juliacarriew</a>         |   1.531|
|   570| <a href="https://twitter.com/zuckerco">@zuckerco</a>                 |   1.531|
|   571| <a href="https://twitter.com/sobrejornalismo">@sobrejornalismo</a>   |   1.531|
|   572| <a href="https://twitter.com/kwashy12">@kwashy12</a>                 |   1.531|
|   573| <a href="https://twitter.com/J_Hancock">@J\_Hancock</a>              |   1.531|
|   574| <a href="https://twitter.com/globalnation">@globalnation</a>         |   1.531|
|   575| <a href="https://twitter.com/AmyCesal">@AmyCesal</a>                 |   1.531|
|   576| <a href="https://twitter.com/nerdishtendency">@nerdishtendency</a>   |   1.531|
|   577| <a href="https://twitter.com/McNeill_Tweets">@McNeill\_Tweets</a>    |   1.531|
|   578| <a href="https://twitter.com/liladerm">@liladerm</a>                 |   1.531|
|   579| <a href="https://twitter.com/myersnews">@myersnews</a>               |   1.531|
|   580| <a href="https://twitter.com/Dinsmore">@Dinsmore</a>                 |   1.531|
|   581| <a href="https://twitter.com/DJNF">@DJNF</a>                         |   1.531|
|   582| <a href="https://twitter.com/Brizzyc">@Brizzyc</a>                   |   1.414|
|   583| <a href="https://twitter.com/RachelSB">@RachelSB</a>                 |   1.414|
|   584| <a href="https://twitter.com/mediatwit">@mediatwit</a>               |   1.414|
|   585| <a href="https://twitter.com/Citizen_Cate">@Citizen\_Cate</a>        |   1.414|
|   586| <a href="https://twitter.com/NewsResearch">@NewsResearch</a>         |   1.414|
|   587| <a href="https://twitter.com/tkb">@tkb</a>                           |   1.414|
|   588| <a href="https://twitter.com/DagmedyaVeri">@DagmedyaVeri</a>         |   1.414|
|   589| <a href="https://twitter.com/talkingbiznews">@talkingbiznews</a>     |   1.414|
|   590| <a href="https://twitter.com/ajlabs">@ajlabs</a>                     |   1.414|
|   591| <a href="https://twitter.com/morgan_krakow">@morgan\_krakow</a>      |   1.414|
|   592| <a href="https://twitter.com/joemahr">@joemahr</a>                   |   1.414|
|   593| <a href="https://twitter.com/Yanazure">@Yanazure</a>                 |   1.414|
|   594| <a href="https://twitter.com/nostarch">@nostarch</a>                 |   1.414|
|   595| <a href="https://twitter.com/ndungca">@ndungca</a>                   |   1.414|
|   596| <a href="https://twitter.com/jeremybmerrill">@jeremybmerrill</a>     |   1.414|
|   597| <a href="https://twitter.com/juliasilge">@juliasilge</a>             |   1.414|
|   598| <a href="https://twitter.com/InfoAmazonia">@InfoAmazonia</a>         |   1.414|
|   599| <a href="https://twitter.com/Dataminr">@Dataminr</a>                 |   1.414|
|   600| <a href="https://twitter.com/dustyrhodes919">@dustyrhodes919</a>     |   1.282|
|   601| <a href="https://twitter.com/gteresa">@gteresa</a>                   |   1.282|
|   602| <a href="https://twitter.com/loganex">@loganex</a>                   |   1.282|
|   603| <a href="https://twitter.com/caelainnbarr">@caelainnbarr</a>         |   1.282|
|   604| <a href="https://twitter.com/ChanceyFleet">@ChanceyFleet</a>         |   1.282|
|   605| <a href="https://twitter.com/Dan_CARINO">@Dan\_CARINO</a>            |   1.282|
|   606| <a href="https://twitter.com/KathrynTRex">@KathrynTRex</a>           |   1.282|
|   607| <a href="https://twitter.com/jrebert97">@jrebert97</a>               |   1.282|
|   608| <a href="https://twitter.com/cwebb_bi">@cwebb\_bi</a>                |   1.282|
|   609| <a href="https://twitter.com/ZapOracles">@ZapOracles</a>             |   1.282|
|   610| <a href="https://twitter.com/jsmithrichards">@jsmithrichards</a>     |   1.282|
|   611| <a href="https://twitter.com/news_klaxon">@news\_klaxon</a>          |   1.282|
|   612| <a href="https://twitter.com/KtTobar">@KtTobar</a>                   |   1.282|
|   613| <a href="https://twitter.com/c_milneil">@c\_milneil</a>              |   1.282|
|   614| <a href="https://twitter.com/runasand">@runasand</a>                 |   1.282|
|   615| <a href="https://twitter.com/mvtopic">@mvtopic</a>                   |   1.282|
|   616| <a href="https://twitter.com/practicalsql">@practicalsql</a>         |   1.282|
|   617| <a href="https://twitter.com/21stShow">@21stShow</a>                 |   1.282|
|   618| <a href="https://twitter.com/GarrettSantora">@GarrettSantora</a>     |   1.282|
|   619| <a href="https://twitter.com/becca_aa">@becca\_aa</a>                |   1.282|
|   620| <a href="https://twitter.com/jason_paladino">@jason\_paladino</a>    |   1.129|
|   621| <a href="https://twitter.com/UFCJCLibrarian">@UFCJCLibrarian</a>     |   1.129|
|   622| <a href="https://twitter.com/mattwynn">@mattwynn</a>                 |   1.129|
|   623| <a href="https://twitter.com/AgNews_Otto">@AgNews\_Otto</a>          |   1.129|
|   624| <a href="https://twitter.com/kreighbaum">@kreighbaum</a>             |   1.129|
|   625| <a href="https://twitter.com/elise_hansen7">@elise\_hansen7</a>      |   1.129|
|   626| <a href="https://twitter.com/ViolenzaDentro">@ViolenzaDentro</a>     |   1.129|
|   627| <a href="https://twitter.com/jbmckim">@jbmckim</a>                   |   1.129|
|   628| <a href="https://twitter.com/_lucysherman">@\_lucysherman</a>        |   1.129|
|   629| <a href="https://twitter.com/MadelynBeck8">@MadelynBeck8</a>         |   1.129|
|   630| <a href="https://twitter.com/journocoders">@journocoders</a>         |   1.129|
|   631| <a href="https://twitter.com/davidbschultz">@davidbschultz</a>       |   1.129|
|   632| <a href="https://twitter.com/sisiwei">@sisiwei</a>                   |   1.129|
|   633| <a href="https://twitter.com/DanTelvock">@DanTelvock</a>             |   1.129|
|   634| <a href="https://twitter.com/jfloyd134">@jfloyd134</a>               |   1.129|
|   635| <a href="https://twitter.com/UnivisionData">@UnivisionData</a>       |   1.129|
|   636| <a href="https://twitter.com/marshallreport">@marshallreport</a>     |   1.129|
|   637| <a href="https://twitter.com/LossofPrivacy">@LossofPrivacy</a>       |   1.129|
|   638| <a href="https://twitter.com/kvnmiller">@kvnmiller</a>               |   1.129|
|   639| <a href="https://twitter.com/ipsosus">@ipsosus</a>                   |   1.129|
|   640| <a href="https://twitter.com/thejessicabrady">@thejessicabrady</a>   |   1.129|
|   641| <a href="https://twitter.com/GdnMobileLab">@GdnMobileLab</a>         |   1.129|
|   642| <a href="https://twitter.com/storybench">@storybench</a>             |   1.129|
|   643| <a href="https://twitter.com/realavivahr">@realavivahr</a>           |   1.129|
|   644| <a href="https://twitter.com/portlandmercury">@portlandmercury</a>   |   1.129|
|   645| <a href="https://twitter.com/kcecireyes">@kcecireyes</a>             |   1.129|
|   646| <a href="https://twitter.com/abraji">@abraji</a>                     |   1.129|
|   647| <a href="https://twitter.com/BBGVisualData">@BBGVisualData</a>       |   1.129|
|   648| <a href="https://twitter.com/zammagazine">@zammagazine</a>           |   1.129|
|   649| <a href="https://twitter.com/StefanieMurray">@StefanieMurray</a>     |   1.129|
|   650| <a href="https://twitter.com/gstorck">@gstorck</a>                   |   0.944|
|   651| <a href="https://twitter.com/DanielleBMcLean">@DanielleBMcLean</a>   |   0.944|
|   652| <a href="https://twitter.com/gijnArabic">@gijnArabic</a>             |   0.944|
|   653| <a href="https://twitter.com/davelevinthal">@davelevinthal</a>       |   0.944|
|   654| <a href="https://twitter.com/davidcblood">@davidcblood</a>           |   0.944|
|   655| <a href="https://twitter.com/wwrfd">@wwrfd</a>                       |   0.702|
|   656| <a href="https://twitter.com/MediaShiftOrg">@MediaShiftOrg</a>       |   0.702|
|   657| <a href="https://twitter.com/HannahFresques">@HannahFresques</a>     |   0.702|
|   658| <a href="https://twitter.com/runnersbyte">@runnersbyte</a>           |   0.702|
|   659| <a href="https://twitter.com/tarajcarman">@tarajcarman</a>           |   0.702|
|   660| <a href="https://twitter.com/joemfox">@joemfox</a>                   |   0.702|
|   661| <a href="https://twitter.com/Futureof_News">@Futureof\_News</a>      |   0.702|
|   662| <a href="https://twitter.com/mcarmichael">@mcarmichael</a>           |   0.702|
|   663| <a href="https://twitter.com/asincopado">@asincopado</a>             |   0.702|
|   664| <a href="https://twitter.com/FrancescaFionda">@FrancescaFionda</a>   |   0.702|
|   665| <a href="https://twitter.com/TMSWatchdog">@TMSWatchdog</a>           |   0.333|
|   666| <a href="https://twitter.com/CSPA">@CSPA</a>                         |   0.333|
|   667| <a href="https://twitter.com/DanJFord">@DanJFord</a>                 |   0.333|
|   668| <a href="https://twitter.com/MMInvestigates">@MMInvestigates</a>     |   0.333|
|   669| <a href="https://twitter.com/NCDJ_ASU">@NCDJ\_ASU</a>                |   0.333|
|   670| <a href="https://twitter.com/noeL_maS">@noeL\_maS</a>                |   0.333|
|   671| <a href="https://twitter.com/nyiathenomad">@nyiathenomad</a>         |   0.333|
