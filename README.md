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
|     1| <a href="https://twitter.com/IRE_NICAR">@IRE\_NICAR</a>             |   7.718|
|     2| <a href="https://twitter.com/albertocairo">@albertocairo</a>        |   6.830|
|     3| <a href="https://twitter.com/MacDiva">@MacDiva</a>                  |   6.102|
|     4| <a href="https://twitter.com/Danict89">@Danict89</a>                |   6.058|
|     5| <a href="https://twitter.com/itsgeorrge">@itsgeorrge</a>            |   5.908|
|     6| <a href="https://twitter.com/susannahlocke">@susannahlocke</a>      |   5.156|
|     7| <a href="https://twitter.com/asduner">@asduner</a>                  |   5.063|
|     8| <a href="https://twitter.com/barbaramaseda">@barbaramaseda</a>      |   5.025|
|     9| <a href="https://twitter.com/martinstabe">@martinstabe</a>          |   4.808|
|    10| <a href="https://twitter.com/sarhutch">@sarhutch</a>                |   4.767|
|    11| <a href="https://twitter.com/sharon000">@sharon000</a>              |   4.619|
|    12| <a href="https://twitter.com/DougHaddix">@DougHaddix</a>            |   4.442|
|    13| <a href="https://twitter.com/JSKstanford">@JSKstanford</a>          |   4.350|
|    14| <a href="https://twitter.com/dataeditor">@dataeditor</a>            |   4.350|
|    15| <a href="https://twitter.com/myersjustinc">@myersjustinc</a>        |   4.326|
|    16| <a href="https://twitter.com/palewire">@palewire</a>                |   4.326|
|    17| <a href="https://twitter.com/jonkeegan">@jonkeegan</a>              |   4.254|
|    18| <a href="https://twitter.com/PatrickMGarvin">@PatrickMGarvin</a>    |   4.205|
|    19| <a href="https://twitter.com/LNdata">@LNdata</a>                    |   4.180|
|    20| <a href="https://twitter.com/greglinch">@greglinch</a>              |   4.130|
|    21| <a href="https://twitter.com/hadleywickham">@hadleywickham</a>      |   4.053|
|    22| <a href="https://twitter.com/carla_astudi">@carla\_astudi</a>       |   4.027|
|    23| <a href="https://twitter.com/paldhous">@paldhous</a>                |   3.974|
|    24| <a href="https://twitter.com/jrue">@jrue</a>                        |   3.974|
|    25| <a href="https://twitter.com/Maid_Marianne">@Maid\_Marianne</a>     |   3.920|
|    26| <a href="https://twitter.com/ucbsoj">@ucbsoj</a>                    |   3.864|
|    27| <a href="https://twitter.com/bymarkwalker">@bymarkwalker</a>        |   3.836|
|    28| <a href="https://twitter.com/sandhya__k">@sandhya\_\_k</a>          |   3.808|
|    29| <a href="https://twitter.com/losowsky">@losowsky</a>                |   3.808|
|    30| <a href="https://twitter.com/christinezhang">@christinezhang</a>    |   3.779|
|    31| <a href="https://twitter.com/NataliaMazotte">@NataliaMazotte</a>    |   3.721|
|    32| <a href="https://twitter.com/Riogringa">@Riogringa</a>              |   3.721|
|    33| <a href="https://twitter.com/datentaeterin">@datentaeterin</a>      |   3.661|
|    34| <a href="https://twitter.com/jazzmyth">@jazzmyth</a>                |   3.661|
|    35| <a href="https://twitter.com/SStirling">@SStirling</a>              |   3.631|
|    36| <a href="https://twitter.com/ChadSDay">@ChadSDay</a>                |   3.631|
|    37| <a href="https://twitter.com/charlesminshew">@charlesminshew</a>    |   3.631|
|    38| <a href="https://twitter.com/chrisjeavans">@chrisjeavans</a>        |   3.569|
|    39| <a href="https://twitter.com/jeremybowers">@jeremybowers</a>        |   3.569|
|    40| <a href="https://twitter.com/rachel_shorey">@rachel\_shorey</a>     |   3.569|
|    41| <a href="https://twitter.com/merbroussard">@merbroussard</a>        |   3.537|
|    42| <a href="https://twitter.com/emamd">@emamd</a>                      |   3.537|
|    43| <a href="https://twitter.com/charlesornstein">@charlesornstein</a>  |   3.537|
|    44| <a href="https://twitter.com/iff_or">@iff\_or</a>                   |   3.505|
|    45| <a href="https://twitter.com/dancow">@dancow</a>                    |   3.472|
|    46| <a href="https://twitter.com/sarambsimon">@sarambsimon</a>          |   3.472|
|    47| <a href="https://twitter.com/ultracasual">@ultracasual</a>          |   3.440|
|    48| <a href="https://twitter.com/Cezary">@Cezary</a>                    |   3.372|
|    49| <a href="https://twitter.com/theboysmithy">@theboysmithy</a>        |   3.372|
|    50| <a href="https://twitter.com/derekeder">@derekeder</a>              |   3.338|
|    51| <a href="https://twitter.com/MaryJoWebster">@MaryJoWebster</a>      |   3.267|
|    52| <a href="https://twitter.com/ndiakopoulos">@ndiakopoulos</a>        |   3.267|
|    53| <a href="https://twitter.com/ByJohnRRoby">@ByJohnRRoby</a>          |   3.267|
|    54| <a href="https://twitter.com/knightlab">@knightlab</a>              |   3.267|
|    55| <a href="https://twitter.com/djordjepadejski">@djordjepadejski</a>  |   3.231|
|    56| <a href="https://twitter.com/cephillips">@cephillips</a>            |   3.195|
|    57| <a href="https://twitter.com/dhmontgomery">@dhmontgomery</a>        |   3.195|
|    58| <a href="https://twitter.com/mtdukes">@mtdukes</a>                  |   3.195|
|    59| <a href="https://twitter.com/fabiolatorres">@fabiolatorres</a>      |   3.195|
|    60| <a href="https://twitter.com/jonathanstray">@jonathanstray</a>      |   3.195|
|    61| <a href="https://twitter.com/giannagruen">@giannagruen</a>          |   3.195|
|    62| <a href="https://twitter.com/chrishagan">@chrishagan</a>            |   3.195|
|    63| <a href="https://twitter.com/kristinhussey1">@kristinhussey1</a>    |   3.157|
|    64| <a href="https://twitter.com/cjworkbench">@cjworkbench</a>          |   3.157|
|    65| <a href="https://twitter.com/TishaESPN">@TishaESPN</a>              |   3.119|
|    66| <a href="https://twitter.com/ravenben">@ravenben</a>                |   3.119|
|    67| <a href="https://twitter.com/gebeloffnyt">@gebeloffnyt</a>          |   3.119|
|    68| <a href="https://twitter.com/nausheenhusain">@nausheenhusain</a>    |   3.119|
|    69| <a href="https://twitter.com/internetrebecca">@internetrebecca</a>  |   3.080|
|    70| <a href="https://twitter.com/knightfdn">@knightfdn</a>              |   3.080|
|    71| <a href="https://twitter.com/schwanksta">@schwanksta</a>            |   3.080|
|    72| <a href="https://twitter.com/LaSharah">@LaSharah</a>                |   3.080|
|    73| <a href="https://twitter.com/kennelliott">@kennelliott</a>          |   3.080|
|    74| <a href="https://twitter.com/ashlynstill">@ashlynstill</a>          |   3.041|
|    75| <a href="https://twitter.com/haddadme">@haddadme</a>                |   3.041|
|    76| <a href="https://twitter.com/columbiajourn">@columbiajourn</a>      |   3.041|
|    77| <a href="https://twitter.com/anlugonz">@anlugonz</a>                |   3.001|
|    78| <a href="https://twitter.com/forestgregg">@forestgregg</a>          |   3.001|
|    79| <a href="https://twitter.com/JonSCollins">@JonSCollins</a>          |   2.959|
|    80| <a href="https://twitter.com/ProPublica">@ProPublica</a>            |   2.959|
|    81| <a href="https://twitter.com/JakeaEkdahl">@JakeaEkdahl</a>          |   2.959|
|    82| <a href="https://twitter.com/city_bureau">@city\_bureau</a>         |   2.959|
|    83| <a href="https://twitter.com/lucyparsonslabs">@lucyparsonslabs</a>  |   2.959|
|    84| <a href="https://twitter.com/SophieWarnes">@SophieWarnes</a>        |   2.917|
|    85| <a href="https://twitter.com/dataKateR">@dataKateR</a>              |   2.917|
|    86| <a href="https://twitter.com/rachelwalexande">@rachelwalexande</a>  |   2.917|
|    87| <a href="https://twitter.com/derekwillis">@derekwillis</a>          |   2.917|
|    88| <a href="https://twitter.com/TimBroderick">@TimBroderick</a>        |   2.917|
|    89| <a href="https://twitter.com/JacopoOttaviani">@JacopoOttaviani</a>  |   2.917|
|    90| <a href="https://twitter.com/BrettMmurphy">@BrettMmurphy</a>        |   2.917|
|    91| <a href="https://twitter.com/JoeYerardi">@JoeYerardi</a>            |   2.917|
|    92| <a href="https://twitter.com/fcoel">@fcoel</a>                      |   2.875|
|    93| <a href="https://twitter.com/KarrieKehoe">@KarrieKehoe</a>          |   2.875|
|    94| <a href="https://twitter.com/_thetextfiles">@\_thetextfiles</a>     |   2.875|
|    95| <a href="https://twitter.com/pickoffwhite">@pickoffwhite</a>        |   2.875|
|    96| <a href="https://twitter.com/molliehanley">@molliehanley</a>        |   2.875|
|    97| <a href="https://twitter.com/eads">@eads</a>                        |   2.875|
|    98| <a href="https://twitter.com/fexi">@fexi</a>                        |   2.875|
|    99| <a href="https://twitter.com/mgafni">@mgafni</a>                    |   2.831|
|   100| <a href="https://twitter.com/EscolaDeDados">@EscolaDeDados</a>      |   2.831|
|   101| <a href="https://twitter.com/grovesprof">@grovesprof</a>            |   2.831|
|   102| <a href="https://twitter.com/AditiHBhandari">@AditiHBhandari</a>    |   2.831|
|   103| <a href="https://twitter.com/ICFJ">@ICFJ</a>                        |   2.831|
|   104| <a href="https://twitter.com/_erinmansfield">@\_erinmansfield</a>   |   2.786|
|   105| <a href="https://twitter.com/thomasgpadilla">@thomasgpadilla</a>    |   2.786|
|   106| <a href="https://twitter.com/NadineSebai">@NadineSebai</a>          |   2.786|
|   107| <a href="https://twitter.com/kearneymw">@kearneymw</a>              |   2.786|
|   108| <a href="https://twitter.com/JournoKateH">@JournoKateH</a>          |   2.786|
|   109| <a href="https://twitter.com/Disha_RC">@Disha\_RC</a>               |   2.786|
|   110| <a href="https://twitter.com/typodactyl">@typodactyl</a>            |   2.740|
|   111| <a href="https://twitter.com/miriamkp">@miriamkp</a>                |   2.740|
|   112| <a href="https://twitter.com/sh_devulapalli">@sh\_devulapalli</a>   |   2.740|
|   113| <a href="https://twitter.com/nickswyter">@nickswyter</a>            |   2.740|
|   114| <a href="https://twitter.com/MJBerens1">@MJBerens1</a>              |   2.692|
|   115| <a href="https://twitter.com/stiles">@stiles</a>                    |   2.692|
|   116| <a href="https://twitter.com/anieldaniel">@anieldaniel</a>          |   2.692|
|   117| <a href="https://twitter.com/shmcminn">@shmcminn</a>                |   2.692|
|   118| <a href="https://twitter.com/opennews">@opennews</a>                |   2.692|
|   119| <a href="https://twitter.com/TowCenter">@TowCenter</a>              |   2.692|
|   120| <a href="https://twitter.com/euniceylee">@euniceylee</a>            |   2.644|
|   121| <a href="https://twitter.com/ofadam">@ofadam</a>                    |   2.644|
|   122| <a href="https://twitter.com/DrewOCCRP">@DrewOCCRP</a>              |   2.644|
|   123| <a href="https://twitter.com/nassos_">@nassos\_</a>                 |   2.644|
|   124| <a href="https://twitter.com/j_la28">@j\_la28</a>                   |   2.644|
|   125| <a href="https://twitter.com/91_pometti">@91\_pometti</a>           |   2.644|
|   126| <a href="https://twitter.com/maggiemulvihill">@maggiemulvihill</a>  |   2.644|
|   127| <a href="https://twitter.com/digitalamysw">@digitalamysw</a>        |   2.594|
|   128| <a href="https://twitter.com/otraletra">@otraletra</a>              |   2.594|
|   129| <a href="https://twitter.com/MadiLAlexander">@MadiLAlexander</a>    |   2.594|
|   130| <a href="https://twitter.com/fvaraorta">@fvaraorta</a>              |   2.594|
|   131| <a href="https://twitter.com/deldeib">@deldeib</a>                  |   2.594|
|   132| <a href="https://twitter.com/UO_Catalyst">@UO\_Catalyst</a>         |   2.594|
|   133| <a href="https://twitter.com/matt_kiefer">@matt\_kiefer</a>         |   2.594|
|   134| <a href="https://twitter.com/macloo">@macloo</a>                    |   2.542|
|   135| <a href="https://twitter.com/emilywithrow">@emilywithrow</a>        |   2.542|
|   136| <a href="https://twitter.com/TWallack">@TWallack</a>                |   2.489|
|   137| <a href="https://twitter.com/maxharlow">@maxharlow</a>              |   2.489|
|   138| <a href="https://twitter.com/carlosrvirgen">@carlosrvirgen</a>      |   2.489|
|   139| <a href="https://twitter.com/michelleminkoff">@michelleminkoff</a>  |   2.489|
|   140| <a href="https://twitter.com/rararahima">@rararahima</a>            |   2.489|
|   141| <a href="https://twitter.com/a_mendelson">@a\_mendelson</a>         |   2.434|
|   142| <a href="https://twitter.com/IJNet">@IJNet</a>                      |   2.434|
|   143| <a href="https://twitter.com/JohnMuyskens">@JohnMuyskens</a>        |   2.434|
|   144| <a href="https://twitter.com/jeremycaplan">@jeremycaplan</a>        |   2.434|
|   145| <a href="https://twitter.com/NewsbySchmidt">@NewsbySchmidt</a>      |   2.434|
|   146| <a href="https://twitter.com/gerald_arthur">@gerald\_arthur</a>     |   2.434|
|   147| <a href="https://twitter.com/LoBenichou">@LoBenichou</a>            |   2.434|
|   148| <a href="https://twitter.com/KenoyerKelly">@KenoyerKelly</a>        |   2.434|
|   149| <a href="https://twitter.com/hannah_recht">@hannah\_recht</a>       |   2.434|
|   150| <a href="https://twitter.com/zubakskees">@zubakskees</a>            |   2.434|
|   151| <a href="https://twitter.com/jayohday">@jayohday</a>                |   2.434|
|   152| <a href="https://twitter.com/UOsojc">@UOsojc</a>                    |   2.434|
|   153| <a href="https://twitter.com/marc_smith">@marc\_smith</a>           |   2.434|
|   154| <a href="https://twitter.com/lenifaye">@lenifaye</a>                |   2.434|
|   155| <a href="https://twitter.com/guilherme_amado">@guilherme\_amado</a> |   2.378|
|   156| <a href="https://twitter.com/CynthFernandez">@CynthFernandez</a>    |   2.378|
|   157| <a href="https://twitter.com/beckyyerak">@beckyyerak</a>            |   2.378|
|   158| <a href="https://twitter.com/JoeGermuska">@JoeGermuska</a>          |   2.378|
|   159| <a href="https://twitter.com/brianboyer">@brianboyer</a>            |   2.378|
|   160| <a href="https://twitter.com/SamanthaSunne">@SamanthaSunne</a>      |   2.378|
|   161| <a href="https://twitter.com/smr_foundation">@smr\_foundation</a>   |   2.378|
|   162| <a href="https://twitter.com/DataMadeCo">@DataMadeCo</a>            |   2.378|
|   163| <a href="https://twitter.com/jbenton">@jbenton</a>                  |   2.378|
|   164| <a href="https://twitter.com/NicoleKDan">@NicoleKDan</a>            |   2.319|
|   165| <a href="https://twitter.com/wardrachel">@wardrachel</a>            |   2.319|
|   166| <a href="https://twitter.com/brentajones">@brentajones</a>          |   2.319|
|   167| <a href="https://twitter.com/npenzenstadler">@npenzenstadler</a>    |   2.319|
|   168| <a href="https://twitter.com/elliot_bentley">@elliot\_bentley</a>   |   2.319|
|   169| <a href="https://twitter.com/yoli_martinez">@yoli\_martinez</a>     |   2.319|
|   170| <a href="https://twitter.com/opencorporates">@opencorporates</a>    |   2.319|
|   171| <a href="https://twitter.com/BuildCoffee">@BuildCoffee</a>          |   2.319|
|   172| <a href="https://twitter.com/ToTheVictor">@ToTheVictor</a>          |   2.319|
|   173| <a href="https://twitter.com/abtran">@abtran</a>                    |   2.319|
|   174| <a href="https://twitter.com/KCnSunshineJam">@KCnSunshineJam</a>    |   2.258|
|   175| <a href="https://twitter.com/darlacameron">@darlacameron</a>        |   2.258|
|   176| <a href="https://twitter.com/khantasha">@khantasha</a>              |   2.258|
|   177| <a href="https://twitter.com/CaitMcGlade">@CaitMcGlade</a>          |   2.258|
|   178| <a href="https://twitter.com/LaurenRohr">@LaurenRohr</a>            |   2.258|
|   179| <a href="https://twitter.com/paulbradshaw">@paulbradshaw</a>        |   2.258|
|   180| <a href="https://twitter.com/momiperalta">@momiperalta</a>          |   2.194|
|   181| <a href="https://twitter.com/RachelleFaroul">@RachelleFaroul</a>    |   2.194|
|   182| <a href="https://twitter.com/songbogong">@songbogong</a>            |   2.194|
|   183| <a href="https://twitter.com/JournalismSandy">@JournalismSandy</a>  |   2.194|
|   184| <a href="https://twitter.com/digiphile">@digiphile</a>              |   2.194|
|   185| <a href="https://twitter.com/saleemkhan">@saleemkhan</a>            |   2.194|
|   186| <a href="https://twitter.com/morisy">@morisy</a>                    |   2.194|
|   187| <a href="https://twitter.com/gufalei">@gufalei</a>                  |   2.194|
|   188| <a href="https://twitter.com/nwatzman">@nwatzman</a>                |   2.194|
|   189| <a href="https://twitter.com/MikeStucka">@MikeStucka</a>            |   2.127|
|   190| <a href="https://twitter.com/bugsact">@bugsact</a>                  |   2.127|
|   191| <a href="https://twitter.com/TaylorJHartz">@TaylorJHartz</a>        |   2.127|
|   192| <a href="https://twitter.com/allisonsross">@allisonsross</a>        |   2.127|
|   193| <a href="https://twitter.com/pinardag">@pinardag</a>                |   2.127|
|   194| <a href="https://twitter.com/kleinmatic">@kleinmatic</a>            |   2.127|
|   195| <a href="https://twitter.com/Gregatao">@Gregatao</a>                |   2.127|
|   196| <a href="https://twitter.com/bcumedia">@bcumedia</a>                |   2.127|
|   197| <a href="https://twitter.com/AxiosVisuals">@AxiosVisuals</a>        |   2.127|
|   198| <a href="https://twitter.com/chrisschnaars">@chrisschnaars</a>      |   2.057|
|   199| <a href="https://twitter.com/akesslerdc">@akesslerdc</a>            |   2.057|
|   200| <a href="https://twitter.com/Ukingsdata">@Ukingsdata</a>            |   2.057|
|   201| <a href="https://twitter.com/msanchezMIA">@msanchezMIA</a>          |   2.057|
|   202| <a href="https://twitter.com/EvaConstantaras">@EvaConstantaras</a>  |   2.057|
|   203| <a href="https://twitter.com/kbmiami">@kbmiami</a>                  |   2.057|
|   204| <a href="https://twitter.com/walt_jw">@walt\_jw</a>                 |   2.057|
|   205| <a href="https://twitter.com/mpiccorossi">@mpiccorossi</a>          |   2.057|
|   206| <a href="https://twitter.com/NYTInteractive">@NYTInteractive</a>    |   2.057|
|   207| <a href="https://twitter.com/jordanrau">@jordanrau</a>              |   1.983|
|   208| <a href="https://twitter.com/jasongrotto">@jasongrotto</a>          |   1.983|
|   209| <a href="https://twitter.com/amber_waves">@amber\_waves</a>         |   1.983|
|   210| <a href="https://twitter.com/Lindenberger">@Lindenberger</a>        |   1.983|
|   211| <a href="https://twitter.com/hollyhacker">@hollyhacker</a>          |   1.983|
|   212| <a href="https://twitter.com/JadJaffar">@JadJaffar</a>              |   1.983|
|   213| <a href="https://twitter.com/mizamudio">@mizamudio</a>              |   1.983|
|   214| <a href="https://twitter.com/LeilaHaddou">@LeilaHaddou</a>          |   1.983|
|   215| <a href="https://twitter.com/HilkeSchellmann">@HilkeSchellmann</a>  |   1.983|
|   216| <a href="https://twitter.com/ericuman">@ericuman</a>                |   1.983|
|   217| <a href="https://twitter.com/mack_oxenden">@mack\_oxenden</a>       |   1.983|
|   218| <a href="https://twitter.com/WSJGraphics">@WSJGraphics</a>          |   1.983|
|   219| <a href="https://twitter.com/nicoledahmen">@nicoledahmen</a>        |   1.983|
|   220| <a href="https://twitter.com/cbaxter1">@cbaxter1</a>                |   1.983|
|   221| <a href="https://twitter.com/br_data">@br\_data</a>                 |   1.983|
|   222| <a href="https://twitter.com/biffud">@biffud</a>                    |   1.983|
|   223| <a href="https://twitter.com/gregmunno">@gregmunno</a>              |   1.983|
|   224| <a href="https://twitter.com/JOVRNALISM">@JOVRNALISM</a>            |   1.983|
|   225| <a href="https://twitter.com/ChiDM">@ChiDM</a>                      |   1.983|
|   226| <a href="https://twitter.com/ChiAppleseed">@ChiAppleseed</a>        |   1.983|
|   227| <a href="https://twitter.com/Fvjones">@Fvjones</a>                  |   1.905|
|   228| <a href="https://twitter.com/robertrdenton">@robertrdenton</a>      |   1.905|
|   229| <a href="https://twitter.com/hunter_owens">@hunter\_owens</a>       |   1.905|
|   230| <a href="https://twitter.com/citizenkrans">@citizenkrans</a>        |   1.905|
|   231| <a href="https://twitter.com/SooOh">@SooOh</a>                      |   1.905|
|   232| <a href="https://twitter.com/john_diedrich">@john\_diedrich</a>     |   1.905|
|   233| <a href="https://twitter.com/rcfp">@rcfp</a>                        |   1.905|
|   234| <a href="https://twitter.com/sarahalvarezMI">@sarahalvarezMI</a>    |   1.905|
|   235| <a href="https://twitter.com/journtoolbox">@journtoolbox</a>        |   1.905|
|   236| <a href="https://twitter.com/joemurph">@joemurph</a>                |   1.905|
|   237| <a href="https://twitter.com/DK_NewsData">@DK\_NewsData</a>         |   1.822|
|   238| <a href="https://twitter.com/MateoClarke">@MateoClarke</a>          |   1.822|
|   239| <a href="https://twitter.com/PBienenfeld">@PBienenfeld</a>          |   1.822|
|   240| <a href="https://twitter.com/Orla_McCaffrey">@Orla\_McCaffrey</a>   |   1.822|
|   241| <a href="https://twitter.com/cthydng">@cthydng</a>                  |   1.822|
|   242| <a href="https://twitter.com/mattdrange">@mattdrange</a>            |   1.822|
|   243| <a href="https://twitter.com/aric_chokey">@aric\_chokey</a>         |   1.822|
|   244| <a href="https://twitter.com/Lmazade">@Lmazade</a>                  |   1.822|
|   245| <a href="https://twitter.com/mbgerring">@mbgerring</a>              |   1.822|
|   246| <a href="https://twitter.com/tylerallyndavis">@tylerallyndavis</a>  |   1.822|
|   247| <a href="https://twitter.com/jhett93">@jhett93</a>                  |   1.822|
|   248| <a href="https://twitter.com/magiccia">@magiccia</a>                |   1.822|
|   249| <a href="https://twitter.com/MargotWilliams">@MargotWilliams</a>    |   1.822|
|   250| <a href="https://twitter.com/jonahshai">@jonahshai</a>              |   1.822|
|   251| <a href="https://twitter.com/CraigPalosky">@CraigPalosky</a>        |   1.732|
|   252| <a href="https://twitter.com/txtianmiller">@txtianmiller</a>        |   1.732|
|   253| <a href="https://twitter.com/cherylwt">@cherylwt</a>                |   1.732|
|   254| <a href="https://twitter.com/ahofschneider">@ahofschneider</a>      |   1.732|
|   255| <a href="https://twitter.com/jpheasly">@jpheasly</a>                |   1.732|
|   256| <a href="https://twitter.com/asuozzo">@asuozzo</a>                  |   1.732|
|   257| <a href="https://twitter.com/heychrisbarr">@heychrisbarr</a>        |   1.732|
|   258| <a href="https://twitter.com/tiffehr">@tiffehr</a>                  |   1.732|
|   259| <a href="https://twitter.com/irworkshop">@irworkshop</a>            |   1.732|
|   260| <a href="https://twitter.com/kschorsch">@kschorsch</a>              |   1.732|
|   261| <a href="https://twitter.com/ajmnoble">@ajmnoble</a>                |   1.732|
|   262| <a href="https://twitter.com/Carlapedret">@Carlapedret</a>          |   1.732|
|   263| <a href="https://twitter.com/mcrosasb">@mcrosasb</a>                |   1.732|
|   264| <a href="https://twitter.com/BritRenee_">@BritRenee\_</a>           |   1.732|
|   265| <a href="https://twitter.com/abbyblachman">@abbyblachman</a>        |   1.732|
|   266| <a href="https://twitter.com/ByNinaMartin">@ByNinaMartin</a>        |   1.732|
|   267| <a href="https://twitter.com/davidherzog">@davidherzog</a>          |   1.732|
|   268| <a href="https://twitter.com/salcedonews">@salcedonews</a>          |   1.636|
|   269| <a href="https://twitter.com/DanielTrielli">@DanielTrielli</a>      |   1.636|
|   270| <a href="https://twitter.com/databyler">@databyler</a>              |   1.636|
|   271| <a href="https://twitter.com/NiemanLab">@NiemanLab</a>              |   1.636|
|   272| <a href="https://twitter.com/micahflee">@micahflee</a>              |   1.636|
|   273| <a href="https://twitter.com/kylebentle">@kylebentle</a>            |   1.636|
|   274| <a href="https://twitter.com/rwells1961">@rwells1961</a>            |   1.636|
|   275| <a href="https://twitter.com/MUOBrien">@MUOBrien</a>                |   1.636|
|   276| <a href="https://twitter.com/MUCollegeofComm">@MUCollegeofComm</a>  |   1.636|
|   277| <a href="https://twitter.com/elthenerd">@elthenerd</a>              |   1.636|
|   278| <a href="https://twitter.com/katchicago">@katchicago</a>            |   1.636|
|   279| <a href="https://twitter.com/JaymeKFraser">@JaymeKFraser</a>        |   1.636|
|   280| <a href="https://twitter.com/slifty">@slifty</a>                    |   1.636|
|   281| <a href="https://twitter.com/SouthSideWeekly">@SouthSideWeekly</a>  |   1.636|
|   282| <a href="https://twitter.com/write_this_way">@write\_this\_way</a>  |   1.636|
|   283| <a href="https://twitter.com/ChicagoReporter">@ChicagoReporter</a>  |   1.636|
|   284| <a href="https://twitter.com/justinJprice">@justinJprice</a>        |   1.636|
|   285| <a href="https://twitter.com/jpeebles">@jpeebles</a>                |   1.531|
|   286| <a href="https://twitter.com/mfederis">@mfederis</a>                |   1.531|
|   287| <a href="https://twitter.com/jeanhuguesroy">@jeanhuguesroy</a>      |   1.531|
|   288| <a href="https://twitter.com/MuckRock">@MuckRock</a>                |   1.531|
|   289| <a href="https://twitter.com/myersnews">@myersnews</a>              |   1.531|
|   290| <a href="https://twitter.com/lisalsong">@lisalsong</a>              |   1.531|
|   291| <a href="https://twitter.com/garveymcvg">@garveymcvg</a>            |   1.531|
|   292| <a href="https://twitter.com/ICFJKnight">@ICFJKnight</a>            |   1.531|
|   293| <a href="https://twitter.com/MeghanHoyer">@MeghanHoyer</a>          |   1.531|
|   294| <a href="https://twitter.com/LATdatadesk">@LATdatadesk</a>          |   1.531|
|   295| <a href="https://twitter.com/amayaverde">@amayaverde</a>            |   1.531|
|   296| <a href="https://twitter.com/Dinsmore">@Dinsmore</a>                |   1.531|
|   297| <a href="https://twitter.com/BradQSkillman">@BradQSkillman</a>      |   1.531|
|   298| <a href="https://twitter.com/SunFoundation">@SunFoundation</a>      |   1.531|
|   299| <a href="https://twitter.com/DJNF">@DJNF</a>                        |   1.531|
|   300| <a href="https://twitter.com/EvanWyloge">@EvanWyloge</a>            |   1.414|
|   301| <a href="https://twitter.com/ChristyGutowsk1">@ChristyGutowsk1</a>  |   1.414|
|   302| <a href="https://twitter.com/juliasilge">@juliasilge</a>            |   1.414|
|   303| <a href="https://twitter.com/edbice">@edbice</a>                    |   1.414|
|   304| <a href="https://twitter.com/IAmStevenPotter">@IAmStevenPotter</a>  |   1.414|
|   305| <a href="https://twitter.com/gijnAfrica">@gijnAfrica</a>            |   1.414|
|   306| <a href="https://twitter.com/cocteau">@cocteau</a>                  |   1.414|
|   307| <a href="https://twitter.com/gluissandoval">@gluissandoval</a>      |   1.414|
|   308| <a href="https://twitter.com/ReporterTopher">@ReporterTopher</a>    |   1.414|
|   309| <a href="https://twitter.com/UlrikBaltzer">@UlrikBaltzer</a>        |   1.414|
|   310| <a href="https://twitter.com/InfoAmazonia">@InfoAmazonia</a>        |   1.414|
|   311| <a href="https://twitter.com/ashhwu">@ashhwu</a>                    |   1.414|
|   312| <a href="https://twitter.com/gridinoc">@gridinoc</a>                |   1.414|
|   313| <a href="https://twitter.com/Dataminr">@Dataminr</a>                |   1.414|
|   314| <a href="https://twitter.com/bpopken">@bpopken</a>                  |   1.414|
|   315| <a href="https://twitter.com/ElenaFerrarin">@ElenaFerrarin</a>      |   1.414|
|   316| <a href="https://twitter.com/DiannaNanez">@DiannaNanez</a>          |   1.282|
|   317| <a href="https://twitter.com/niemanfdn">@niemanfdn</a>              |   1.282|
|   318| <a href="https://twitter.com/zhoyoyo">@zhoyoyo</a>                  |   1.282|
|   319| <a href="https://twitter.com/ProPublicaIL">@ProPublicaIL</a>        |   1.282|
|   320| <a href="https://twitter.com/mvtopic">@mvtopic</a>                  |   1.282|
|   321| <a href="https://twitter.com/KenichiSerino">@KenichiSerino</a>      |   1.282|
|   322| <a href="https://twitter.com/pilhofer">@pilhofer</a>                |   1.282|
|   323| <a href="https://twitter.com/act_rational">@act\_rational</a>       |   1.282|
|   324| <a href="https://twitter.com/FedorZarkhin">@FedorZarkhin</a>        |   1.282|
|   325| <a href="https://twitter.com/pierreconti">@pierreconti</a>          |   1.282|
|   326| <a href="https://twitter.com/stephanierlamm">@stephanierlamm</a>    |   1.282|
|   327| <a href="https://twitter.com/Mapbox">@Mapbox</a>                    |   1.282|
|   328| <a href="https://twitter.com/SPIEGEL_Data">@SPIEGEL\_Data</a>       |   1.282|
|   329| <a href="https://twitter.com/zehnzehen">@zehnzehen</a>              |   1.282|
|   330| <a href="https://twitter.com/JacobNierenberg">@JacobNierenberg</a>  |   1.282|
|   331| <a href="https://twitter.com/nostarch">@nostarch</a>                |   1.282|
|   332| <a href="https://twitter.com/practicalsql">@practicalsql</a>        |   1.282|
|   333| <a href="https://twitter.com/AlenaMaschke">@AlenaMaschke</a>        |   1.282|
|   334| <a href="https://twitter.com/21stShow">@21stShow</a>                |   1.282|
|   335| <a href="https://twitter.com/LeeVGaines">@LeeVGaines</a>            |   1.282|
|   336| <a href="https://twitter.com/ssdatar">@ssdatar</a>                  |   1.282|
|   337| <a href="https://twitter.com/GarrettSantora">@GarrettSantora</a>    |   1.282|
|   338| <a href="https://twitter.com/neo4j">@neo4j</a>                      |   1.282|
|   339| <a href="https://twitter.com/some_yeo">@some\_yeo</a>               |   1.282|
|   340| <a href="https://twitter.com/becca_aa">@becca\_aa</a>               |   1.282|
|   341| <a href="https://twitter.com/nhannahjones">@nhannahjones</a>        |   1.129|
|   342| <a href="https://twitter.com/mattwynn">@mattwynn</a>                |   1.129|
|   343| <a href="https://twitter.com/AgNews_Otto">@AgNews\_Otto</a>         |   1.129|
|   344| <a href="https://twitter.com/jburnmurdoch">@jburnmurdoch</a>        |   1.129|
|   345| <a href="https://twitter.com/runasand">@runasand</a>                |   1.129|
|   346| <a href="https://twitter.com/DagmedyaVeri">@DagmedyaVeri</a>        |   1.129|
|   347| <a href="https://twitter.com/RobertMaguire_">@RobertMaguire\_</a>   |   1.129|
|   348| <a href="https://twitter.com/JacquieEli">@JacquieEli</a>            |   1.129|
|   349| <a href="https://twitter.com/disolis">@disolis</a>                  |   1.129|
|   350| <a href="https://twitter.com/realavivahr">@realavivahr</a>          |   1.129|
|   351| <a href="https://twitter.com/ChrisLKellerLAT">@ChrisLKellerLAT</a>  |   1.129|
|   352| <a href="https://twitter.com/portlandmercury">@portlandmercury</a>  |   1.129|
|   353| <a href="https://twitter.com/kcecireyes">@kcecireyes</a>            |   1.129|
|   354| <a href="https://twitter.com/abraji">@abraji</a>                    |   1.129|
|   355| <a href="https://twitter.com/RobertBenincasa">@RobertBenincasa</a>  |   1.129|
|   356| <a href="https://twitter.com/BBGVisualData">@BBGVisualData</a>      |   1.129|
|   357| <a href="https://twitter.com/zammagazine">@zammagazine</a>          |   1.129|
|   358| <a href="https://twitter.com/jczamora">@jczamora</a>                |   1.129|
|   359| <a href="https://twitter.com/StefanieMurray">@StefanieMurray</a>    |   1.129|
|   360| <a href="https://twitter.com/levinecarrie">@levinecarrie</a>        |   0.944|
|   361| <a href="https://twitter.com/JeffKLO">@JeffKLO</a>                  |   0.944|
|   362| <a href="https://twitter.com/MattCData">@MattCData</a>              |   0.944|
|   363| <a href="https://twitter.com/zuckerco">@zuckerco</a>                |   0.944|
|   364| <a href="https://twitter.com/allyjarmanning">@allyjarmanning</a>    |   0.944|
|   365| <a href="https://twitter.com/shansquared">@shansquared</a>          |   0.944|
|   366| <a href="https://twitter.com/kissane">@kissane</a>                  |   0.944|
|   367| <a href="https://twitter.com/wwrfd">@wwrfd</a>                      |   0.702|
|   368| <a href="https://twitter.com/gteresa">@gteresa</a>                  |   0.702|
|   369| <a href="https://twitter.com/DeniseDSLu">@DeniseDSLu</a>            |   0.702|
|   370| <a href="https://twitter.com/mjbeckel">@mjbeckel</a>                |   0.702|
|   371| <a href="https://twitter.com/tylrfishr">@tylrfishr</a>              |   0.702|
|   372| <a href="https://twitter.com/DDJ_Tools">@DDJ\_Tools</a>             |   0.702|
|   373| <a href="https://twitter.com/tkb">@tkb</a>                          |   0.702|
|   374| <a href="https://twitter.com/thejessicabrady">@thejessicabrady</a>  |   0.702|
|   375| <a href="https://twitter.com/queenalma19">@queenalma19</a>          |   0.702|
|   376| <a href="https://twitter.com/Brizzyc">@Brizzyc</a>                  |   0.702|
|   377| <a href="https://twitter.com/GerryLanosga">@GerryLanosga</a>        |   0.702|
|   378| <a href="https://twitter.com/crit">@crit</a>                        |   0.702|
|   379| <a href="https://twitter.com/asincopado">@asincopado</a>            |   0.702|
|   380| <a href="https://twitter.com/UFCJCLibrarian">@UFCJCLibrarian</a>    |   0.702|
|   381| <a href="https://twitter.com/davelevinthal">@davelevinthal</a>      |   0.333|
|   382| <a href="https://twitter.com/gilra">@gilra</a>                      |   0.333|
|   383| <a href="https://twitter.com/gijnArabic">@gijnArabic</a>            |   0.333|
|   384| <a href="https://twitter.com/DanJFord">@DanJFord</a>                |   0.333|
|   385| <a href="https://twitter.com/joemfox">@joemfox</a>                  |   0.333|
|   386| <a href="https://twitter.com/MMInvestigates">@MMInvestigates</a>    |   0.333|
|   387| <a href="https://twitter.com/ReutersPR">@ReutersPR</a>              |   0.333|
|   388| <a href="https://twitter.com/NCDJ_ASU">@NCDJ\_ASU</a>               |   0.333|
|   389| <a href="https://twitter.com/rdmurphy">@rdmurphy</a>                |   0.333|
|   390| <a href="https://twitter.com/noeL_maS">@noeL\_maS</a>               |   0.333|
|   391| <a href="https://twitter.com/mediatwit">@mediatwit</a>              |   0.333|
|   392| <a href="https://twitter.com/MediaShiftOrg">@MediaShiftOrg</a>      |   0.333|
|   393| <a href="https://twitter.com/The_Dean">@The\_Dean</a>               |   0.333|
|   394| <a href="https://twitter.com/FrancescaFionda">@FrancescaFionda</a>  |   0.333|
