#!/bin/sh

set -e

if test ! $(which R)
then
    echo "   Install R first. (i..e run osx-brew.sh)"
    exit
fi

cd "$(dirname "$0")"

CRAN=(
    bookdown
    broom
    crayon
    devtools
    ggplot2
    ggthemes
    inline
    IRdisplay
    knitr
    lubridate
    magrittr
    microbenchmark
    memoise
    packrat
    pbdZMQ
    plyr
    png
    RColorBrewer
    Rcpp
    repr
    reshape2
    RMySQL
    RSQLite
    sqldf
    stringr
    tidyr
)

CRAN_S=(
    dplyr # need to install from source because no-binary error
    readr # binary is 0.2.2, source is 1.x.x
    pryr
)

github=(
    google/rfmt
    IRkernel/IRkernel
    hadley/lineprof
    hadley/S3
)

for package in ${CRAN[@]}
do
    Rscript -e "if (!is.element(\"$package\", installed.packages()[,1])) { \
        install.packages(\"$package\", type=\"mac.binary.mavericks\") \
    } else { \
        print(\"$package already installed\") \
    }"
done

for package in ${CRAN_S[@]}
do
    Rscript -e "if (!is.element(\"$package\", installed.packages()[,1])) { \
        install.packages(\"$package\", type=\"source\") \
    } else { \
        print(\"$package already installed\") \
    }"
done

for repo in ${github[@]}
do
    Rscript -e "devtools::install_github(\"$repo\")"
done

echo "    Running post-installation scripts."
Rscript -e "IRkernel::installspec()"
