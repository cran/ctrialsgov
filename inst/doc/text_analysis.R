## ----message=FALSE------------------------------------------------------------
library(ctrialsgov)
library(dplyr)
ctgov_load_sample()

## -----------------------------------------------------------------------------
z <- ctgov_query(study_type = "Interventional")
ctgov_kwic("bladder", z$brief_title)

## -----------------------------------------------------------------------------
z <- ctgov_query(study_type = "Interventional")
ctgov_kwic("bladder", z$brief_title, z$nct_id)

## -----------------------------------------------------------------------------
z <- ctrialsgov::ctgov_query()
tfidf <- ctgov_tfidf(z$description)
print(tfidf, n = 30)

## -----------------------------------------------------------------------------
tfidf <- ctgov_tfidf(z$description, tolower = FALSE)
print(tfidf, n = 30)

## -----------------------------------------------------------------------------
tfidf <- ctgov_tfidf(z$description, min_df = 0.02, max_df = 0.2)
print(tfidf, n = 30)

## -----------------------------------------------------------------------------
z <- ctgov_query(
  study_type = "Interventional", sponsor_type = "Industry", phase = "Phase 2"
)
scores <- ctgov_text_similarity(z$description, min_df = 0, max_df = 0.1)
dim(scores)

## -----------------------------------------------------------------------------
index <- order(scores[,100], decreasing = TRUE)[1:5]
z$brief_title[index]

