npi_df$score <- as.factor(npi_df$score)
npi_df$elapse <- as.numeric(npi_df$elapse)

boxplot(elapse~score, data = npi_df, xlab= "Participants' Score (Score)", ylab= "Time Taken to Complete NPI Test", main = "Narcisstic Tendency Based On the Duration of Test Completion")




