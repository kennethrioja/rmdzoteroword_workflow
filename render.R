#!/usr/bin/env Rscript
## __________________________
## Title: Render .rmd to .docx
## Author: Kenneth Rioja, University of Geneva
## Email: kenneth.rioja@unige.ch
## Date Created: 2023-09-23
## __________________________
## Notes:
##   1) Why just not simply 'knit' ?
##    - You can but this .R file allows you to choose the doc file name AND
##      a short description to describe the current version (e.g., "added intro",
##      "trying model 1", etc.)
## __________________________

## Top ----
## clear workspace
rm(list=ls())

## mandatory: use it as a short description to describe the changes of the current version
subtitle <- "This version shows the new Results section"

## get the arguments passed through bash script, args[1] corresponds to the subtitle given during bash script
args = paste(commandArgs(trailingOnly=TRUE), collapse = ' ')
if (args != '') {
  subtitle <- args
}

## set path to current dir - uncomment if you use this script with RStudio
# setwd(dirname(rstudioapi::getSourceEditorContext()$path)) # this needs to be commented for 'render_script_mac.command' to work

## retrieve rmd file name
rmd_file_name <- list.files()[grep('\\.Rmd$', list.files(), ignore.case = T)]

# this appears at the beginning of the docx file name, e.g., '<DOCFILENAME>_20230921.docx'
doc_file_name <- gsub('.Rmd', '', rmd_file_name)

## set the output name file
dir.create(file.path("./output"), showWarnings = FALSE)
output_file_name <- paste('./output/', doc_file_name, '_', gsub('-', '', Sys.Date()), '.docx', sep='')

## custom render : https://stackoverflow.com/a/73394088
render_subject <- function(sub) {
  rmarkdown::render(
    input = rmd_file_name,
    params = list(doc_subtitle = sub),
    output_file = output_file_name
  )
}
render_subject(subtitle)

## for the render_script_mac.command
## create a file 'tmp' containing output_file_name to be able to open it automatically
file.create("tmp")
write(output_file_name, file = "tmp")
