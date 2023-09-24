FROM rocker/verse 
WORKDIR /rstudio/611
COPY . .
RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
RUN yes | unminimize