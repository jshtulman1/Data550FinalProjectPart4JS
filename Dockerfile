FROM rocker/tidyverse

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      pandoc \
      build-essential \
      ca-certificates \
      pkg-config \
      libcurl4-openssl-dev \
      libxml2-dev \
      libssl-dev \
 && rm -rf /var/lib/apt/lists/*

COPY FinalProjectP4JS.Rmd .
COPY .Rprofile .
COPY renv.lock .
COPY renv/activate.R renv/

RUN Rscript -e "if (!requireNamespace('renv', quietly=TRUE)) install.packages('renv', repos='https://cloud.r-project.org')" \
 && Rscript -e "renv::activate('/project'); renv::restore(prompt = FALSE)"

COPY FinalProjectP4JS.Rproj ./
COPY Makefile .
COPY Raw_Data/ Raw_Data/
COPY Code/ Code/
COPY Clean_Data/ Clean_Data/
COPY Tables_Figures/ Tables_Figures

RUN mkdir -p /final_report

CMD ["bash","-lc","make FinalProjectP4JS.html && mv FinalProjectP4JS.html /final_report/"]
