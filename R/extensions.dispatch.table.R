extensions.dispatch.table <- as.environment(
  list("\\.csv$" = reader.csv,
       "\\.csv.bz2$" = reader.csv,
       "\\.csv.zip$" = reader.csv,
       "\\.csv.gz$" = reader.csv,
       "\\.csv2$" = reader.csv2,
       "\\.csv2.bz2$" = reader.csv2,
       "\\.csv2.zip$" = reader.csv2,
       "\\.csv2.gz$" = reader.csv2,
       "\\.tsv$" = reader.tsv,
       "\\.tsv.bz2$" = reader.tsv,
       "\\.tsv.zip$" = reader.tsv,
       "\\.tsv.gz$" = reader.tsv,
       "\\.tab$" = reader.tsv,
       "\\.tab.bz2$" = reader.tsv,
       "\\.tab.zip$" = reader.tsv,
       "\\.tab.gz$" = reader.tsv,
       "\\.wsv$" = reader.wsv,
       "\\.wsv.bz2$" = reader.wsv,
       "\\.wsv.zip$" = reader.wsv,
       "\\.wsv.gz$" = reader.wsv,
       "\\.txt$" = reader.wsv,
       "\\.txt.bz2$" = reader.wsv,
       "\\.txt.zip$" = reader.wsv,
       "\\.txt.gz$" = reader.wsv,
       "\\.Rdata$" = reader.rdata,
       "\\.rda$" = reader.rdata,
       "\\.R$" = reader.r,
       "\\.r$" = reader.r,
       "\\.url$" = reader.url,
       "\\.sql$" = reader.sql,
       "\\.xls$" = reader.xls,
       "\\.xlsx$" = reader.xlsx,
       "\\.sav$" = reader.spss,
       "\\.dta$" = reader.stata,
       "\\.arff$" = reader.arff,
       "\\.dbf$" = reader.dbf,
       "\\.rec$" = reader.epiinfo,
       "\\.mtp$" = reader.mtp,
       "\\.m$" = reader.octave,
       "\\.sys$" = reader.systat,
       "\\.syd$" = reader.systat,
       "\\.sas$" = reader.xport,
       "\\.xport$" = reader.xport,
       "\\.xpt$" = reader.xport,
       "\\.db$" = reader.db,
       "\\.file$" = reader.file,
       "\\.mp3$" = reader.mp3,
       "\\.ppm$" = reader.ppm,
       "\\.dat$" = reader.wsv,
       "\\.dat.bz2$" = reader.wsv,
       "\\.dat.zip$" = reader.wsv,
       "\\.dat.gz$" = reader.wsv)
)

#' Maps file types to the reader functions used to autoload them.
#'
#' This list stores a mapping from regular expressions that match file
#' extensions for the file types supported by LoadMyData to the
#' reader functions that implement autoloading for those formats. Any
#' new file type must be appended to this dispatch table.
#'
#' @include reader.arff.R
#' @include reader.csv.R
#' @include reader.csv2.R
#' @include reader.db.R
#' @include reader.dbf.R
#' @include reader.epiinfo.R
#' @include reader.file.R
#' @include reader.mp3.R
#' @include reader.mtp.R
#' @include reader.octave.R
#' @include reader.ppm.R
#' @include reader.r.R
#' @include reader.rdata.R
#' @include reader.spss.R
#' @include reader.sql.R
#' @include reader.stata.R
#' @include reader.systat.R
#' @include reader.tsv.R
#' @include reader.url.R
#' @include reader.wsv.R
#' @include reader.xls.R
#' @include reader.xlsx.R
#' @include reader.xport.R
supported.file.extensions <- as.list(extensions.dispatch.table)

.TargetEnv <- .GlobalEnv
