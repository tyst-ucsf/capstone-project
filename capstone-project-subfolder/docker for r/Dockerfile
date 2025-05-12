FROM rocker/r-ver:3.6.3

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libxt-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Must be installed IN THIS ORDER
RUN R -e "install.packages(c('BiocManager', 'remotes'), repos='https://cloud.r-project.org')"

RUN R -e "install.packages(c('Rcpp', 'tmvtnorm', 'norm'), repos='https://cloud.r-project.org')"
RUN R -e "BiocManager::install(c('pcaMethods', 'impute'), ask=FALSE, update=FALSE)"

RUN R -e \"install.packages('https://cran.r-project.org/src/contrib/Archive/imputeLCMD/imputeLCMD_2.0.tar.gz', repos=NULL, type='source')\"