#!/usr/bin/env bash
# Setup script for Zambia mapping project
# Installs R and required packages, then renders the R Markdown document

set -euo pipefail

# Install system dependencies (for Debian/Ubuntu systems)
if command -v apt-get >/dev/null; then
  sudo apt-get update
  sudo apt-get install -y --no-install-recommends \
    r-base r-base-dev \
    libcurl4-openssl-dev libssl-dev libxml2-dev \
    libgdal-dev libudunits2-dev
fi

# Install required R packages
Rscript -e "install.packages(c('tidyverse','sf','readxl','tmap','rmarkdown'), repos='https://cloud.r-project.org')"

# Render the R Markdown file
Rscript -e "rmarkdown::render('zambia_maps.Rmd')"
