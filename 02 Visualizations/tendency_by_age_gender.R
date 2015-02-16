npi_df %>% group_by(score, age, gender) %>% ggplot(aes(x= age, y = score, color = gender)) + geom_point() + facet_wrap(~gender) + xlab("Participants' Age") + ylab("Tendency Towards Narcissicm") + ggtitle("Narcisstic Tendency By Age & Gender") 

