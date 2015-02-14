require(RCurl)

npi_df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT score, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, Q32, Q33, Q34, Q35, Q36, Q37, Q38, Q39, Q40, elapse, gender, age FROM NPI"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_nm22335', PASS='orcl_nm22335', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

View(npi_df)

#null issues when calling variables - renaming fixed them
names(npi_df)[1] <- "score"
names(npi_df)[2] <- "Q1"
names(npi_df)[3] <- "Q2"
names(npi_df)[4] <- "Q3"
names(npi_df)[5] <- "Q4"
names(npi_df)[6] <- "Q5"
names(npi_df)[7] <- "Q6"
names(npi_df)[8] <- "Q7"
names(npi_df)[9] <- "Q8"
names(npi_df)[10] <- "Q9"
names(npi_df)[11] <- "Q10"
names(npi_df)[12] <- "Q11"
names(npi_df)[13] <- "Q12"
names(npi_df)[14] <- "Q13"
names(npi_df)[15] <- "Q14"
names(npi_df)[16] <- "Q15"
names(npi_df)[17] <- "Q16"
names(npi_df)[18] <- "Q17"
names(npi_df)[19] <- "Q19"
names(npi_df)[19] <- "Q18"
names(npi_df)[20] <- "Q19"
names(npi_df)[21] <- "Q20"
names(npi_df)[22] <- "Q21"
names(npi_df)[23] <- "Q22"
names(npi_df)[24] <- "Q23"
names(npi_df)[25] <- "Q24"
names(npi_df)[26] <- "Q25"
names(npi_df)[27] <- "Q26"
names(npi_df)[28] <- "Q27"
names(npi_df)[29] <- "Q28"
names(npi_df)[30] <- "Q29"
names(npi_df)[31] <- "Q30"
names(npi_df)[32] <- "Q31"
names(npi_df)[33] <- "Q32"
names(npi_df)[34] <- "Q33"
names(npi_df)[35] <- "Q34"
names(npi_df)[36] <- "Q35"
names(npi_df)[37] <- "Q36"
names(npi_df)[38] <- "Q37"
names(npi_df)[39] <- "Q38"
names(npi_df)[40] <- "Q39"
names(npi_df)[41] <- "Q40"
names(npi_df)[42] <- "elapse"
names(npi_df)[43] <- "gender"
names(npi_df)[44] <- "age"

require(tidyr)
require(dplyr)
require(ggplot2)

npi_df$gender <- as.factor(npi_df$gender)

npi_df %>% group_by(score, age, gender) %>% ggplot(aes(x= age, y = score, color=gender)) + geom_point() + facet_wrap(~gender)
npi_df %>% ungroup()

npi_df %>% group_by(score, elapse, gender) %>% ggplot(aes(x= score, y = elapse, color = as.factor(gender))) + geom_point()
npi_df %>% ungroup()

#boxplot(elapse~score, data = npi_df, xlab= "Score", ylab= "time taken to complete the test" )

hist(npi_df$score, breaks=20, col="red")

boxplot(score~gender, data = npi_df, xlab= "gender", ylab= "Tendency towards Narcicissm" )

npi_df %>% group_by(score, elapse, gender) %>% ggplot(aes(x= score, y = elapse, color = as.factor(gender))) + geom_point()
npi_df %>% ungroup()


ggplot(aes(x= score, y = age, color = as.factor(gender))) + geom_point() 










