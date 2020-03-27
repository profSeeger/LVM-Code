# DATA FRAMES #################################################################

# A data frame is a table or a two-dimensional array-like structure in which each 
# column contains values of one variable and each row contains one set of values from each column.

# Create a data frame for six cribbage players that includes their id, name, best hand and birthdate
cribbage.data <- data.frame(
  player_id = c (1:5), 
  player_name = c("Jon","Sage","Chris","Kersten","Linden"),
  player_best = c(12,14,8,16,12), 
  player_bDate = as.Date(c("1944-07-16", "2006-02-07", "1972-07-12", "1974-12-10",
                         "2003-09-27")),
  stringsAsFactors = FALSE
)
# Print the data frame		
cribbage.data

# View the structure of the data frame
str(cribbage.data)

# Statistical summary of the data
summary(cribbage.data)

# Extract a specific column of data from the named data frame
result <- data.frame(cribbage.data$player_name,cribbage.data$player_best)
result


# Extract just the first two rows and all columns
result <- cribbage.data[1:2,]
result


# Extract 3rd and 5th row with 2nd and 4th column. eg name and birthdate
result <- cribbage.data[c(3,5),c(2,4)]
result


# To add a row we need to bring in the new rows into a new data frame using the same structure as the 
# existing data frame and use the rbind() function.

# Create the second data frame
cribbage.newdata <- 	data.frame(
  player_id = c (6:7), 
  player_name = c("Kathy", "Denny"),
  player_best = c(8, 14), 
  player_bDate = as.Date(c("1950-03-23", "1935-10-12")),
  stringsAsFactors = FALSE
)

# Bind the two data frames.
cribbage.finaldata <- rbind(cribbage.data,cribbage.newdata)
cribbage.finaldata


# Add a "wins" coulmn.
cribbage.finaldata$wins <- c(2,3,6,4,2,0,5)
cribbage.finaldata