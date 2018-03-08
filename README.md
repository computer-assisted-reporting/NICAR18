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

|  rank| screen\_name                                                        |  log\_n|
|-----:|:--------------------------------------------------------------------|-------:|
|     1| <a href="https://twitter.com/IRE_NICAR">@IRE\_NICAR</a>             |   7.298|
|     2| <a href="https://twitter.com/MacDiva">@MacDiva</a>                  |   4.947|
|     3| <a href="https://twitter.com/Danict89">@Danict89</a>                |   4.641|
|     4| <a href="https://twitter.com/albertocairo">@albertocairo</a>        |   4.532|
|     5| <a href="https://twitter.com/sarhutch">@sarhutch</a>                |   4.326|
|     6| <a href="https://twitter.com/barbaramaseda">@barbaramaseda</a>      |   4.053|
|     7| <a href="https://twitter.com/myersjustinc">@myersjustinc</a>        |   4.053|
|     8| <a href="https://twitter.com/itsgeorrge">@itsgeorrge</a>            |   4.000|
|     9| <a href="https://twitter.com/sharon000">@sharon000</a>              |   3.892|
|    10| <a href="https://twitter.com/PatrickMGarvin">@PatrickMGarvin</a>    |   3.779|
|    11| <a href="https://twitter.com/asduner">@asduner</a>                  |   3.779|
|    12| <a href="https://twitter.com/DougHaddix">@DougHaddix</a>            |   3.750|
|    13| <a href="https://twitter.com/JSKstanford">@JSKstanford</a>          |   3.750|
|    14| <a href="https://twitter.com/palewire">@palewire</a>                |   3.721|
|    15| <a href="https://twitter.com/christinezhang">@christinezhang</a>    |   3.661|
|    16| <a href="https://twitter.com/bymarkwalker">@bymarkwalker</a>        |   3.600|
|    17| <a href="https://twitter.com/jonkeegan">@jonkeegan</a>              |   3.569|
|    18| <a href="https://twitter.com/jeremybowers">@jeremybowers</a>        |   3.537|
|    19| <a href="https://twitter.com/losowsky">@losowsky</a>                |   3.472|
|    20| <a href="https://twitter.com/charlesminshew">@charlesminshew</a>    |   3.472|
|    21| <a href="https://twitter.com/susannahlocke">@susannahlocke</a>      |   3.440|
|    22| <a href="https://twitter.com/greglinch">@greglinch</a>              |   3.440|
|    23| <a href="https://twitter.com/jazzmyth">@jazzmyth</a>                |   3.440|
|    24| <a href="https://twitter.com/merbroussard">@merbroussard</a>        |   3.406|
|    25| <a href="https://twitter.com/LNdata">@LNdata</a>                    |   3.406|
|    26| <a href="https://twitter.com/ucbsoj">@ucbsoj</a>                    |   3.406|
|    27| <a href="https://twitter.com/ultracasual">@ultracasual</a>          |   3.338|
|    28| <a href="https://twitter.com/dataeditor">@dataeditor</a>            |   3.338|
|    29| <a href="https://twitter.com/Maid_Marianne">@Maid\_Marianne</a>     |   3.303|
|    30| <a href="https://twitter.com/sarambsimon">@sarambsimon</a>          |   3.267|
|    31| <a href="https://twitter.com/paldhous">@paldhous</a>                |   3.267|
|    32| <a href="https://twitter.com/djordjepadejski">@djordjepadejski</a>  |   3.231|
|    33| <a href="https://twitter.com/jrue">@jrue</a>                        |   3.157|
|    34| <a href="https://twitter.com/knightlab">@knightlab</a>              |   3.119|
|    35| <a href="https://twitter.com/martinstabe">@martinstabe</a>          |   3.080|
|    36| <a href="https://twitter.com/Riogringa">@Riogringa</a>              |   3.080|
|    37| <a href="https://twitter.com/cephillips">@cephillips</a>            |   3.041|
|    38| <a href="https://twitter.com/hadleywickham">@hadleywickham</a>      |   3.041|
|    39| <a href="https://twitter.com/rachel_shorey">@rachel\_shorey</a>     |   3.041|
|    40| <a href="https://twitter.com/ndiakopoulos">@ndiakopoulos</a>        |   3.001|
|    41| <a href="https://twitter.com/gebeloffnyt">@gebeloffnyt</a>          |   3.001|
|    42| <a href="https://twitter.com/carla_astudi">@carla\_astudi</a>       |   3.001|
|    43| <a href="https://twitter.com/fabiolatorres">@fabiolatorres</a>      |   2.959|
|    44| <a href="https://twitter.com/chrisjeavans">@chrisjeavans</a>        |   2.959|
|    45| <a href="https://twitter.com/lucyparsonslabs">@lucyparsonslabs</a>  |   2.959|
|    46| <a href="https://twitter.com/ravenben">@ravenben</a>                |   2.917|
|    47| <a href="https://twitter.com/chrishagan">@chrishagan</a>            |   2.917|
|    48| <a href="https://twitter.com/JoeYerardi">@JoeYerardi</a>            |   2.917|
|    49| <a href="https://twitter.com/city_bureau">@city\_bureau</a>         |   2.917|
|    50| <a href="https://twitter.com/nausheenhusain">@nausheenhusain</a>    |   2.875|
|    51| <a href="https://twitter.com/MaryJoWebster">@MaryJoWebster</a>      |   2.875|
|    52| <a href="https://twitter.com/fcoel">@fcoel</a>                      |   2.831|
|    53| <a href="https://twitter.com/mgafni">@mgafni</a>                    |   2.831|
|    54| <a href="https://twitter.com/BrettMmurphy">@BrettMmurphy</a>        |   2.831|
|    55| <a href="https://twitter.com/kristinhussey1">@kristinhussey1</a>    |   2.786|
|    56| <a href="https://twitter.com/thomasgpadilla">@thomasgpadilla</a>    |   2.786|
|    57| <a href="https://twitter.com/TimBroderick">@TimBroderick</a>        |   2.786|
|    58| <a href="https://twitter.com/sandhya__k">@sandhya\_\_k</a>          |   2.786|
|    59| <a href="https://twitter.com/miriamkp">@miriamkp</a>                |   2.740|
|    60| <a href="https://twitter.com/charlesornstein">@charlesornstein</a>  |   2.692|
|    61| <a href="https://twitter.com/SophieWarnes">@SophieWarnes</a>        |   2.644|
|    62| <a href="https://twitter.com/DrewOCCRP">@DrewOCCRP</a>              |   2.644|
|    63| <a href="https://twitter.com/emamd">@emamd</a>                      |   2.644|
|    64| <a href="https://twitter.com/schwanksta">@schwanksta</a>            |   2.644|
|    65| <a href="https://twitter.com/derekeder">@derekeder</a>              |   2.644|
|    66| <a href="https://twitter.com/digitalamysw">@digitalamysw</a>        |   2.594|
|    67| <a href="https://twitter.com/SStirling">@SStirling</a>              |   2.594|
|    68| <a href="https://twitter.com/JakeaEkdahl">@JakeaEkdahl</a>          |   2.594|
|    69| <a href="https://twitter.com/matt_kiefer">@matt\_kiefer</a>         |   2.594|
|    70| <a href="https://twitter.com/KarrieKehoe">@KarrieKehoe</a>          |   2.542|
|    71| <a href="https://twitter.com/ICFJ">@ICFJ</a>                        |   2.542|
|    72| <a href="https://twitter.com/Disha_RC">@Disha\_RC</a>               |   2.542|
|    73| <a href="https://twitter.com/kearneymw">@kearneymw</a>              |   2.542|
|    74| <a href="https://twitter.com/UO_Catalyst">@UO\_Catalyst</a>         |   2.542|
|    75| <a href="https://twitter.com/columbiajourn">@columbiajourn</a>      |   2.542|
|    76| <a href="https://twitter.com/rararahima">@rararahima</a>            |   2.489|
|    77| <a href="https://twitter.com/forestgregg">@forestgregg</a>          |   2.489|
|    78| <a href="https://twitter.com/euniceylee">@euniceylee</a>            |   2.434|
|    79| <a href="https://twitter.com/IJNet">@IJNet</a>                      |   2.434|
|    80| <a href="https://twitter.com/AditiHBhandari">@AditiHBhandari</a>    |   2.434|
|    81| <a href="https://twitter.com/NataliaMazotte">@NataliaMazotte</a>    |   2.434|
|    82| <a href="https://twitter.com/molliehanley">@molliehanley</a>        |   2.434|
|    83| <a href="https://twitter.com/stiles">@stiles</a>                    |   2.434|
|    84| <a href="https://twitter.com/guilherme_amado">@guilherme\_amado</a> |   2.378|
|    85| <a href="https://twitter.com/dataKateR">@dataKateR</a>              |   2.378|
|    86| <a href="https://twitter.com/fexi">@fexi</a>                        |   2.378|
|    87| <a href="https://twitter.com/cjworkbench">@cjworkbench</a>          |   2.378|
|    88| <a href="https://twitter.com/gerald_arthur">@gerald\_arthur</a>     |   2.378|
|    89| <a href="https://twitter.com/DataMadeCo">@DataMadeCo</a>            |   2.378|
|    90| <a href="https://twitter.com/opennews">@opennews</a>                |   2.378|
|    91| <a href="https://twitter.com/rachelwalexande">@rachelwalexande</a>  |   2.319|
|    92| <a href="https://twitter.com/JonSCollins">@JonSCollins</a>          |   2.319|
|    93| <a href="https://twitter.com/kennelliott">@kennelliott</a>          |   2.319|
|    94| <a href="https://twitter.com/fvaraorta">@fvaraorta</a>              |   2.319|
|    95| <a href="https://twitter.com/UOsojc">@UOsojc</a>                    |   2.319|
|    96| <a href="https://twitter.com/BuildCoffee">@BuildCoffee</a>          |   2.319|
|    97| <a href="https://twitter.com/ToTheVictor">@ToTheVictor</a>          |   2.319|
|    98| <a href="https://twitter.com/CynthFernandez">@CynthFernandez</a>    |   2.319|
|    99| <a href="https://twitter.com/jbenton">@jbenton</a>                  |   2.319|
|   100| <a href="https://twitter.com/macloo">@macloo</a>                    |   2.258|
|   101| <a href="https://twitter.com/ChadSDay">@ChadSDay</a>                |   2.258|
|   102| <a href="https://twitter.com/haddadme">@haddadme</a>                |   2.258|
|   103| <a href="https://twitter.com/datentaeterin">@datentaeterin</a>      |   2.258|
|   104| <a href="https://twitter.com/brentajones">@brentajones</a>          |   2.258|
|   105| <a href="https://twitter.com/KCnSunshineJam">@KCnSunshineJam</a>    |   2.258|
|   106| <a href="https://twitter.com/yoli_martinez">@yoli\_martinez</a>     |   2.258|
|   107| <a href="https://twitter.com/opencorporates">@opencorporates</a>    |   2.258|
|   108| <a href="https://twitter.com/sh_devulapalli">@sh\_devulapalli</a>   |   2.258|
|   109| <a href="https://twitter.com/lenifaye">@lenifaye</a>                |   2.258|
|   110| <a href="https://twitter.com/TowCenter">@TowCenter</a>              |   2.258|
|   111| <a href="https://twitter.com/ByJohnRRoby">@ByJohnRRoby</a>          |   2.258|
|   112| <a href="https://twitter.com/abtran">@abtran</a>                    |   2.258|
|   113| <a href="https://twitter.com/JournalismSandy">@JournalismSandy</a>  |   2.194|
|   114| <a href="https://twitter.com/emilywithrow">@emilywithrow</a>        |   2.194|
|   115| <a href="https://twitter.com/deldeib">@deldeib</a>                  |   2.194|
|   116| <a href="https://twitter.com/a_mendelson">@a\_mendelson</a>         |   2.194|
|   117| <a href="https://twitter.com/hannah_recht">@hannah\_recht</a>       |   2.194|
|   118| <a href="https://twitter.com/91_pometti">@91\_pometti</a>           |   2.194|
|   119| <a href="https://twitter.com/mtdukes">@mtdukes</a>                  |   2.194|
|   120| <a href="https://twitter.com/bugsact">@bugsact</a>                  |   2.127|
|   121| <a href="https://twitter.com/JoeGermuska">@JoeGermuska</a>          |   2.127|
|   122| <a href="https://twitter.com/beckyyerak">@beckyyerak</a>            |   2.127|
|   123| <a href="https://twitter.com/JournoKateH">@JournoKateH</a>          |   2.127|
|   124| <a href="https://twitter.com/npenzenstadler">@npenzenstadler</a>    |   2.127|
|   125| <a href="https://twitter.com/Cezary">@Cezary</a>                    |   2.127|
|   126| <a href="https://twitter.com/AxiosVisuals">@AxiosVisuals</a>        |   2.127|
|   127| <a href="https://twitter.com/TWallack">@TWallack</a>                |   2.057|
|   128| <a href="https://twitter.com/mpiccorossi">@mpiccorossi</a>          |   2.057|
|   129| <a href="https://twitter.com/CaitMcGlade">@CaitMcGlade</a>          |   2.057|
|   130| <a href="https://twitter.com/NYTInteractive">@NYTInteractive</a>    |   2.057|
|   131| <a href="https://twitter.com/saleemkhan">@saleemkhan</a>            |   2.057|
|   132| <a href="https://twitter.com/typodactyl">@typodactyl</a>            |   1.983|
|   133| <a href="https://twitter.com/jasongrotto">@jasongrotto</a>          |   1.983|
|   134| <a href="https://twitter.com/amber_waves">@amber\_waves</a>         |   1.983|
|   135| <a href="https://twitter.com/JadJaffar">@JadJaffar</a>              |   1.983|
|   136| <a href="https://twitter.com/biffud">@biffud</a>                    |   1.983|
|   137| <a href="https://twitter.com/ProPublica">@ProPublica</a>            |   1.983|
|   138| <a href="https://twitter.com/gregmunno">@gregmunno</a>              |   1.983|
|   139| <a href="https://twitter.com/JOVRNALISM">@JOVRNALISM</a>            |   1.983|
|   140| <a href="https://twitter.com/ChiDM">@ChiDM</a>                      |   1.983|
|   141| <a href="https://twitter.com/ChiAppleseed">@ChiAppleseed</a>        |   1.983|
|   142| <a href="https://twitter.com/internetrebecca">@internetrebecca</a>  |   1.905|
|   143| <a href="https://twitter.com/robertrdenton">@robertrdenton</a>      |   1.905|
|   144| <a href="https://twitter.com/Lindenberger">@Lindenberger</a>        |   1.905|
|   145| <a href="https://twitter.com/citizenkrans">@citizenkrans</a>        |   1.905|
|   146| <a href="https://twitter.com/SamanthaSunne">@SamanthaSunne</a>      |   1.905|
|   147| <a href="https://twitter.com/giannagruen">@giannagruen</a>          |   1.905|
|   148| <a href="https://twitter.com/otraletra">@otraletra</a>              |   1.905|
|   149| <a href="https://twitter.com/JohnMuyskens">@JohnMuyskens</a>        |   1.905|
|   150| <a href="https://twitter.com/jonathanstray">@jonathanstray</a>      |   1.905|
|   151| <a href="https://twitter.com/brianboyer">@brianboyer</a>            |   1.905|
|   152| <a href="https://twitter.com/morisy">@morisy</a>                    |   1.905|
|   153| <a href="https://twitter.com/MateoClarke">@MateoClarke</a>          |   1.822|
|   154| <a href="https://twitter.com/PBienenfeld">@PBienenfeld</a>          |   1.822|
|   155| <a href="https://twitter.com/Orla_McCaffrey">@Orla\_McCaffrey</a>   |   1.822|
|   156| <a href="https://twitter.com/elliot_bentley">@elliot\_bentley</a>   |   1.822|
|   157| <a href="https://twitter.com/TishaESPN">@TishaESPN</a>              |   1.822|
|   158| <a href="https://twitter.com/smr_foundation">@smr\_foundation</a>   |   1.822|
|   159| <a href="https://twitter.com/john_diedrich">@john\_diedrich</a>     |   1.822|
|   160| <a href="https://twitter.com/grovesprof">@grovesprof</a>            |   1.822|
|   161| <a href="https://twitter.com/nwatzman">@nwatzman</a>                |   1.822|
|   162| <a href="https://twitter.com/walt_jw">@walt\_jw</a>                 |   1.822|
|   163| <a href="https://twitter.com/kleinmatic">@kleinmatic</a>            |   1.822|
|   164| <a href="https://twitter.com/NewsbySchmidt">@NewsbySchmidt</a>      |   1.822|
|   165| <a href="https://twitter.com/cbaxter1">@cbaxter1</a>                |   1.822|
|   166| <a href="https://twitter.com/jpheasly">@jpheasly</a>                |   1.732|
|   167| <a href="https://twitter.com/ofadam">@ofadam</a>                    |   1.732|
|   168| <a href="https://twitter.com/hunter_owens">@hunter\_owens</a>       |   1.732|
|   169| <a href="https://twitter.com/_erinmansfield">@\_erinmansfield</a>   |   1.732|
|   170| <a href="https://twitter.com/TaylorJHartz">@TaylorJHartz</a>        |   1.732|
|   171| <a href="https://twitter.com/paulbradshaw">@paulbradshaw</a>        |   1.732|
|   172| <a href="https://twitter.com/shmcminn">@shmcminn</a>                |   1.732|
|   173| <a href="https://twitter.com/BritRenee_">@BritRenee\_</a>           |   1.732|
|   174| <a href="https://twitter.com/jonahshai">@jonahshai</a>              |   1.732|
|   175| <a href="https://twitter.com/JacopoOttaviani">@JacopoOttaviani</a>  |   1.732|
|   176| <a href="https://twitter.com/momiperalta">@momiperalta</a>          |   1.732|
|   177| <a href="https://twitter.com/_thetextfiles">@\_thetextfiles</a>     |   1.732|
|   178| <a href="https://twitter.com/abbyblachman">@abbyblachman</a>        |   1.732|
|   179| <a href="https://twitter.com/ByNinaMartin">@ByNinaMartin</a>        |   1.732|
|   180| <a href="https://twitter.com/davidherzog">@davidherzog</a>          |   1.732|
|   181| <a href="https://twitter.com/DanielTrielli">@DanielTrielli</a>      |   1.636|
|   182| <a href="https://twitter.com/ajmnoble">@ajmnoble</a>                |   1.636|
|   183| <a href="https://twitter.com/Carlapedret">@Carlapedret</a>          |   1.636|
|   184| <a href="https://twitter.com/mcrosasb">@mcrosasb</a>                |   1.636|
|   185| <a href="https://twitter.com/slifty">@slifty</a>                    |   1.636|
|   186| <a href="https://twitter.com/SouthSideWeekly">@SouthSideWeekly</a>  |   1.636|
|   187| <a href="https://twitter.com/write_this_way">@write\_this\_way</a>  |   1.636|
|   188| <a href="https://twitter.com/j_la28">@j\_la28</a>                   |   1.636|
|   189| <a href="https://twitter.com/kschorsch">@kschorsch</a>              |   1.636|
|   190| <a href="https://twitter.com/justinJprice">@justinJprice</a>        |   1.636|
|   191| <a href="https://twitter.com/allisonsross">@allisonsross</a>        |   1.636|
|   192| <a href="https://twitter.com/SooOh">@SooOh</a>                      |   1.636|
|   193| <a href="https://twitter.com/Ukingsdata">@Ukingsdata</a>            |   1.531|
|   194| <a href="https://twitter.com/cherylwt">@cherylwt</a>                |   1.531|
|   195| <a href="https://twitter.com/WSJGraphics">@WSJGraphics</a>          |   1.531|
|   196| <a href="https://twitter.com/iff_or">@iff\_or</a>                   |   1.531|
|   197| <a href="https://twitter.com/SunFoundation">@SunFoundation</a>      |   1.531|
|   198| <a href="https://twitter.com/JaymeKFraser">@JaymeKFraser</a>        |   1.531|
|   199| <a href="https://twitter.com/mizamudio">@mizamudio</a>              |   1.531|
|   200| <a href="https://twitter.com/pinardag">@pinardag</a>                |   1.531|
|   201| <a href="https://twitter.com/ChicagoReporter">@ChicagoReporter</a>  |   1.531|
|   202| <a href="https://twitter.com/tiffehr">@tiffehr</a>                  |   1.531|
|   203| <a href="https://twitter.com/DJNF">@DJNF</a>                        |   1.531|
|   204| <a href="https://twitter.com/wardrachel">@wardrachel</a>            |   1.414|
|   205| <a href="https://twitter.com/KenoyerKelly">@KenoyerKelly</a>        |   1.414|
|   206| <a href="https://twitter.com/ashhwu">@ashhwu</a>                    |   1.414|
|   207| <a href="https://twitter.com/gridinoc">@gridinoc</a>                |   1.414|
|   208| <a href="https://twitter.com/Dataminr">@Dataminr</a>                |   1.414|
|   209| <a href="https://twitter.com/bpopken">@bpopken</a>                  |   1.414|
|   210| <a href="https://twitter.com/NiemanLab">@NiemanLab</a>              |   1.414|
|   211| <a href="https://twitter.com/akesslerdc">@akesslerdc</a>            |   1.414|
|   212| <a href="https://twitter.com/MadiLAlexander">@MadiLAlexander</a>    |   1.414|
|   213| <a href="https://twitter.com/mattdrange">@mattdrange</a>            |   1.414|
|   214| <a href="https://twitter.com/MikeStucka">@MikeStucka</a>            |   1.414|
|   215| <a href="https://twitter.com/EvaConstantaras">@EvaConstantaras</a>  |   1.282|
|   216| <a href="https://twitter.com/nostarch">@nostarch</a>                |   1.282|
|   217| <a href="https://twitter.com/practicalsql">@practicalsql</a>        |   1.282|
|   218| <a href="https://twitter.com/AlenaMaschke">@AlenaMaschke</a>        |   1.282|
|   219| <a href="https://twitter.com/MeghanHoyer">@MeghanHoyer</a>          |   1.282|
|   220| <a href="https://twitter.com/ICFJKnight">@ICFJKnight</a>            |   1.282|
|   221| <a href="https://twitter.com/pickoffwhite">@pickoffwhite</a>        |   1.282|
|   222| <a href="https://twitter.com/21stShow">@21stShow</a>                |   1.282|
|   223| <a href="https://twitter.com/LeeVGaines">@LeeVGaines</a>            |   1.282|
|   224| <a href="https://twitter.com/ssdatar">@ssdatar</a>                  |   1.282|
|   225| <a href="https://twitter.com/GarrettSantora">@GarrettSantora</a>    |   1.282|
|   226| <a href="https://twitter.com/DK_NewsData">@DK\_NewsData</a>         |   1.282|
|   227| <a href="https://twitter.com/neo4j">@neo4j</a>                      |   1.282|
|   228| <a href="https://twitter.com/MargotWilliams">@MargotWilliams</a>    |   1.282|
|   229| <a href="https://twitter.com/becca_aa">@becca\_aa</a>               |   1.282|
|   230| <a href="https://twitter.com/AgNews_Otto">@AgNews\_Otto</a>         |   1.129|
|   231| <a href="https://twitter.com/ChrisLKellerLAT">@ChrisLKellerLAT</a>  |   1.129|
|   232| <a href="https://twitter.com/portlandmercury">@portlandmercury</a>  |   1.129|
|   233| <a href="https://twitter.com/digiphile">@digiphile</a>              |   1.129|
|   234| <a href="https://twitter.com/act_rational">@act\_rational</a>       |   1.129|
|   235| <a href="https://twitter.com/kcecireyes">@kcecireyes</a>            |   1.129|
|   236| <a href="https://twitter.com/abraji">@abraji</a>                    |   1.129|
|   237| <a href="https://twitter.com/RobertBenincasa">@RobertBenincasa</a>  |   1.129|
|   238| <a href="https://twitter.com/irworkshop">@irworkshop</a>            |   1.129|
|   239| <a href="https://twitter.com/EvanWyloge">@EvanWyloge</a>            |   1.129|
|   240| <a href="https://twitter.com/StefanieMurray">@StefanieMurray</a>    |   1.129|
|   241| <a href="https://twitter.com/zubakskees">@zubakskees</a>            |   0.944|
|   242| <a href="https://twitter.com/derekwillis">@derekwillis</a>          |   0.944|
|   243| <a href="https://twitter.com/shansquared">@shansquared</a>          |   0.944|
|   244| <a href="https://twitter.com/BBGVisualData">@BBGVisualData</a>      |   0.944|
|   245| <a href="https://twitter.com/jczamora">@jczamora</a>                |   0.944|
|   246| <a href="https://twitter.com/kissane">@kissane</a>                  |   0.944|
|   247| <a href="https://twitter.com/gteresa">@gteresa</a>                  |   0.702|
|   248| <a href="https://twitter.com/GerryLanosga">@GerryLanosga</a>        |   0.702|
|   249| <a href="https://twitter.com/zuckerco">@zuckerco</a>                |   0.702|
|   250| <a href="https://twitter.com/nhannahjones">@nhannahjones</a>        |   0.702|
|   251| <a href="https://twitter.com/jordanrau">@jordanrau</a>              |   0.702|
|   252| <a href="https://twitter.com/songbogong">@songbogong</a>            |   0.702|
|   253| <a href="https://twitter.com/crit">@crit</a>                        |   0.702|
|   254| <a href="https://twitter.com/zammagazine">@zammagazine</a>          |   0.702|
|   255| <a href="https://twitter.com/MMInvestigates">@MMInvestigates</a>    |   0.333|
|   256| <a href="https://twitter.com/JacobNierenberg">@JacobNierenberg</a>  |   0.333|
|   257| <a href="https://twitter.com/allyjarmanning">@allyjarmanning</a>    |   0.333|
|   258| <a href="https://twitter.com/ReutersPR">@ReutersPR</a>              |   0.333|
|   259| <a href="https://twitter.com/ElenaFerrarin">@ElenaFerrarin</a>      |   0.333|
|   260| <a href="https://twitter.com/mediatwit">@mediatwit</a>              |   0.333|
|   261| <a href="https://twitter.com/MediaShiftOrg">@MediaShiftOrg</a>      |   0.333|
|   262| <a href="https://twitter.com/FrancescaFionda">@FrancescaFionda</a>  |   0.333|
|   263| <a href="https://twitter.com/DiannaNanez">@DiannaNanez</a>          |   0.333|
|   264| <a href="https://twitter.com/asincopado">@asincopado</a>            |   0.333|
