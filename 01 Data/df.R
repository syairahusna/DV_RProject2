#loading the packages needed
require(RCurl)
require(tidyr)
require(dplyr)
require(ggplot2)
require(reshape2)

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


npi_df$gender <- as.factor(npi_df$gender)


npi_df %>% group_by(score, age, gender) %>% ggplot(aes(x= age, y = score, color=gender)) + geom_point() + facet_wrap(~gender) + xlab("Participants' Age") + ylab("Tendency Towards Narcissicm") + ggtitle("Narcisstic Tendency By Age & Gender")
npi_df %>% ungroup()


npi_df %>% group_by(score, elapse, gender) %>% ggplot(aes(x= score, y = elapse, color = as.factor(gender))) + geom_point() + xlab("Participants' Score") + ylab("Time Taken to Complete the Personality Test") + ggtitle("Narcisstic Tendency By Duration of Test Completion")
npi_df %>% ungroup()

#do facet wrap to better represent the data, make it more specific
boxplot(elapse~score, data = npi_df, xlab= "Participants' Score (Score)", ylab= "Time Taken to Complete NPI Test", main = "Narcisstic Tendency Based On the Duration of Test Completion")

#hist(score,xlab ="Participants' Score (Score)", ylab = "Number of Participants", main = "The Score Distribution of Narcisstic Personality Inventory (NPI)", breaks=20, col="pink")

npi_df %>% ggplot(aes(score)) + geom_histogram(binwidth=1, fill = "brown", color ="pink") + xlab("Participants' Score (Score)") + ylab("Number of Participants") + ggtitle("The Score Distribution of Narcisstic Personality Inventory (NPI)")


boxplot(score~gender, data = npi_df, xlab= "gender", names = c("No Gender", "Women", "Men", "Other"), ylab= "Participants' Score (Score)", main = "The Score Distribution of Narcisstic Personality Inventory (NPI) Based On Gender", col="light green")

 
#changing the class of all forty questions
npi_df$Q1 <- as.factor(npi_df$Q1)
npi_df$Q2 <- as.factor(npi_df$Q2)
npi_df$Q3 <- as.factor(npi_df$Q3)
npi_df$Q4 <- as.factor(npi_df$Q4)
npi_df$Q5 <- as.factor(npi_df$Q5)
npi_df$Q6 <- as.factor(npi_df$Q6)
npi_df$Q7 <- as.factor(npi_df$Q7)
npi_df$Q8 <- as.factor(npi_df$Q8)
npi_df$Q9 <- as.factor(npi_df$Q9)
npi_df$Q10 <- as.factor(npi_df$Q10)
npi_df$Q11 <- as.factor(npi_df$Q11)
npi_df$Q12 <- as.factor(npi_df$Q12)
npi_df$Q13 <- as.factor(npi_df$Q13)
npi_df$Q14 <- as.factor(npi_df$Q14)
npi_df$Q15 <- as.factor(npi_df$Q15)
npi_df$Q16 <- as.factor(npi_df$Q16)
npi_df$Q17 <- as.factor(npi_df$Q17)
npi_df$Q18 <- as.factor(npi_df$Q18)
npi_df$Q19 <- as.factor(npi_df$Q19)
npi_df$Q20 <- as.factor(npi_df$Q20)
npi_df$Q21 <- as.factor(npi_df$Q21)
npi_df$Q22 <- as.factor(npi_df$Q22)
npi_df$Q23 <- as.factor(npi_df$Q23)
npi_df$Q24 <- as.factor(npi_df$Q24)
npi_df$Q25 <- as.factor(npi_df$Q25)
npi_df$Q26 <- as.factor(npi_df$Q26)
npi_df$Q27 <- as.factor(npi_df$Q27)
npi_df$Q28 <- as.factor(npi_df$Q28)
npi_df$Q29 <- as.factor(npi_df$Q29)
npi_df$Q30 <- as.factor(npi_df$Q30)
npi_df$Q31 <- as.factor(npi_df$Q31)
npi_df$Q32 <- as.factor(npi_df$Q32)
npi_df$Q33 <- as.factor(npi_df$Q33)
npi_df$Q34 <- as.factor(npi_df$Q34)
npi_df$Q35 <- as.factor(npi_df$Q35)
npi_df$Q36 <- as.factor(npi_df$Q36)
npi_df$Q37 <- as.factor(npi_df$Q37)
npi_df$Q38 <- as.factor(npi_df$Q38)
npi_df$Q39 <- as.factor(npi_df$Q39)
npi_df$Q40 <- as.factor(npi_df$Q40)

#creating modified data frame in which all the questions are transformed
mdf <- melt(npi_df, id=c("score", "elapse", "age", "gender"))

mdf %>% ggplot(aes(x= value, color = value)) + geom_bar() + facet_wrap(~variable) +  xlab("Type of Response") + ylab("Number of Participants") + ggtitle("Participants' Response to All Questions in NPI Test") + scale_colour_manual(values=c("red","green","blue")) 

# create a subset of mdf specifically for questions that were left unanswered
unanswered_mdf <- subset(mdf, value == 0)


unanswered_mdf %>% ggplot(aes(x= variable)) + geom_bar()

unanswered_mdf %>% ggplot(aes(variable, fill = variable)) + geom_bar(fill="#FF6666", colour="black") + facet_grid(gender ~ .) + xlab("Questions") + ylab("Number of Participants") + ggtitle("Participants' Non-Response in NPI Test (By Gender)") 














