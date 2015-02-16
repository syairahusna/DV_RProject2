#creating modified data frame in which all the questions are transformed
mdf <- melt(npi_df, id=c("score", "elapse", "age", "gender"))