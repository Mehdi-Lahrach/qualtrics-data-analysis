

#importing data
data <- read.csv("C:\\Users\\pc\\Desktop\\data\\data.csv")
View(data)
summary(data)

#deleting first 2 colums
new_data <- data[-c(1, 2), ]
View(new_data)


na_count <- sum(is.na(new_data$scl_dpt))
empty_string_count <- sum(new_data$scl_dpt == "")


#deleting evry row that has an empty string in its scl dpt
new_data2 <- subset(new_data, scl_dpt != "")
View(new_data2)


names(data)
library(dplyr)

new_data3 <- new_data2 %>%
  select(-StartDate, -EndDate, -Status, -IPAddress, -Progress, -Duration..in.seconds.,
         -Finished, -RecordedDate, -ResponseId, -RecipientLastName, -RecipientFirstName,
         -RecipientLastName, -RecipientEmail, -ExternalReference, -LocationLatitude,
         -LocationLongitude, -DistributionChannel, -UserLanguage)

View(new_data3)

yes_block <- new_data3[new_data3$No_or_YesBlock_1 >= 4, ]
View(yes_block)

no_block <- new_data3[new_data3$No_or_YesBlock_1 <= 3, ]
View(no_block)

yes_block <- yes_block %>%
    select(-reson_on_lack, -reson_on_lack_5_TEXT, -is_nan_positive,
         -satis_on_experience_1, -satis_on_performance_1, -aware_of_nan,
         -if_change_yes_no, -suggest_new_nan)
View(yes_block)


no_block <- no_block %>% 
    select(-Satisf_NA_1, -stress_manageY_1, -time_manageY_1,
         -satis_with_communiY_1, -aware_with_nanY, -nan_grades_1,
         -nan_overall_expY_1, -suggest_new_nanY, -input_for._new_nan)
View(no_block)

yes_block$stress_manageY_1 <- as.numeric(as.character(yes_block$stress_manageY_1))
yes_block$Satisf_NA_1 <- as.numeric(as.character(yes_block$Satisf_NA_1))
yes_block$time_manageY_1 <- as.numeric(as.character(yes_block$time_manageY_1))
yes_block$satis_with_communiY_1 <- as.numeric(as.character(yes_block$satis_with_communiY_1))
yes_block$nan_grades_1 <- as.numeric(as.character(yes_block$nan_grades_1))
yes_block$nan_overall_expY_1 <- as.numeric(as.character(yes_block$nan_grades_1))


no_block$satis_on_experience_1 <- as.numeric(as.character(no_block$satis_on_experience_1))


