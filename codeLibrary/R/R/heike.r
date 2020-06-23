
install.packages("purrr")
library("purrr")


#sample (6, 2, replace = FALSE)
#sample (6, 7, replace = TRUE)


attack3 <- function() {
  attacker <- sort(sample(6, 3, replace = TRUE), decreasing = TRUE)
  defender <- sort(sample(6, 3, replace = TRUE), decreasing = TRUE)
  wins <- sum(attacker > defender) 
  losses <- sum(attacker <= defender) 
  wins - losses
}

n <- 100

set.seed(20200610)
attacks <- replicate(n, attack3())
table(attacks)/n


set.seed(20200610)
attacks <- purrr::rerun(n, attack3())
table(unlist(attacks))/n


##### Coin Flips #####
install.packages("discreteRV")
library(discreteRV)

fair.coin <- RV(c("1", "0"), probs = 0.5)

iid(fair.coin, 2)
iid(fair.coin, 2, fractions)



##### Grand Slam #####
D <- RV(c(1,0), probs = c(15/36, 21/36))

(wins <- SofIID(D, n=4, fractions = FALSE))

