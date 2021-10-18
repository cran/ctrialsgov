## ---- message=FALSE-----------------------------------------------------------
library(ctrialsgov)

## ---- eval=FALSE--------------------------------------------------------------
#  library(DBI)
#  library(RPostgreSQL)
#  
#  drv <- dbDriver('PostgreSQL')
#  con <- DBI::dbConnect(drv, dbname="aact")
#  ctgov_create_data(con)

## ---- eval=FALSE--------------------------------------------------------------
#  ctgov_load_cache()

## -----------------------------------------------------------------------------
ctgov_load_sample()

## -----------------------------------------------------------------------------
ctgov_query(study_type = "Interventional")

## -----------------------------------------------------------------------------
ctgov_query(study_type = "Interventional", sponsor_type = "Industry")

## -----------------------------------------------------------------------------
ctgov_query(enrollment_range = c(40, 42))

## -----------------------------------------------------------------------------
ctgov_query(enrollment_range = c(1000, NA))

## -----------------------------------------------------------------------------
ctgov_query(date_range = c("2020-01-01", "2020-02-01"))

## -----------------------------------------------------------------------------
ctgov_query(description_kw = "lung cancer")

## -----------------------------------------------------------------------------
ctgov_query(description_kw = c("lung cancer", "colon cancer"))

## -----------------------------------------------------------------------------
ctgov_query(description_kw = c("lung cancer", "colon cancer"), match_all = TRUE)

## -----------------------------------------------------------------------------
ctgov_query(
  description_kw = "cancer",
  enrollment_range = c(100, 200),
  date_range = c("2019-01-01", "2020-02-01")
)

## ---- message=FALSE-----------------------------------------------------------
library(dplyr)

ctgov_query() %>%
  ctgov_query(description_kw = "cancer") %>%
  ctgov_query(enrollment_range = c(100, 200)) %>%
  ctgov_query(date_range = c("2019-01-01", "2020-02-01"))

## -----------------------------------------------------------------------------
ctgov_query(
  description_kw = "cancer",
  enrollment_range = c(100, 200),
  date_range = c("2019-01-01", "2020-02-01")
) %>%
  ctgov_plot_timeline() +
    ggplot2::theme_minimal()

