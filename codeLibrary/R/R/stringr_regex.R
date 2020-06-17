install.packages("stringr")
library(stringr)

hex <- c("#FFFFFF", "#CE9F9F", "#000000")


str_extract_all(hex, "[0-9]")
str_extract_all(hex, "[0-9]+") #this is greedy
str_extract_all(hex, "[A-Z][0-9]")
str_extract_all(hex, "[A-Z][0-9]+") #this is greedy
str_detect(hex, "[:digit:]{3,}") #at least three of any digit?



#counts the number of characters
x <- c("why", "video", "cross", "extra", "deal", "authority")
str_length(x) 


bateman <-c("I live in American Gardens building on West 81st street")

str_locate_all(bateman, "\\s[A-Z]")
str_extract_all(bateman, "[:blank:][A-Z][a-z]+")

str_extract_all(bateman, "[:alnum:]*t[:alnum:]*")

str_extract_all(bateman, "[:alnum:]*t\\b*)



patient <-"name: Jane, Age: 25, Condition: OK"
            

   str_extract_all(patient, "(?<=Name:)*)             



