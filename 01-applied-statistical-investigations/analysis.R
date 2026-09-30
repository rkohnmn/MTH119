# ==============================================================================
# Applied Statistical Investigations (MTH 119 Capstone)
# Analysis Script
# Author: Robert Kohn (Muhlenberg College)
# ==============================================================================

# Load required packages
suppressPackageStartupMessages({
  library(Lock5Data)
  library(mosaic)
  library(lattice)
  library(ggformula)
})

# ==============================================================================
# Part 1: Categorical vs. Categorical
# Research Question: For patients in the detoxification unit, are substance of 
# abuse and housing status related?
# Dataset: HELPrct (Health Evaluation and Linkage to Primary Care trial)
# ==============================================================================
cat("\n=======================================================\n")
cat("Part 1: Substance vs. Homeless Status (HELPrct)\n")
cat("=======================================================\n")

data(HELPrct)

# 1.1 Two-way contingency table of counts
tally_counts <- tally(substance ~ homeless, data = HELPrct)
cat("\nContingency Table (Counts):\n")
print(tally_counts)

# 1.2 Conditional proportions by substance
tally_props <- tally(~ homeless | substance, format = "proportion", data = HELPrct)
cat("\nConditional Proportions (Homeless status given substance):\n")
print(tally_props)

# 1.3 Chi-square test of independence
# H0: Choice of drug is independent of housing status
# Ha: Choice of drug is not independent of housing status
chisq_res <- xchisq.test(tally_counts)
print(chisq_res)


# ==============================================================================
# Part 2: Quantitative vs. Categorical I (ANOVA)
# Research Question: Is there a relationship between which server is serving a
# table and the mean bill amount?
# Dataset: RestaurantTips
# ==============================================================================
cat("\n=======================================================\n")
cat("Part 2: Bill Amount by Server (RestaurantTips - ANOVA)\n")
cat("=======================================================\n")

data(RestaurantTips)

# 2.1 Numerical summary (Five-number summary, mean, sd, n)
cat("\nSummary Statistics by Server:\n")
tips_stats <- favstats(Bill ~ Server, data = RestaurantTips)
print(tips_stats)

# 2.2 Assumption checks
# Ratio of max standard deviation to min standard deviation
max_sd <- max(tips_stats$sd)
min_sd <- min(tips_stats$sd)
cat(sprintf("\nHomoscedasticity Check: Max SD = %.2f, Min SD = %.2f (Ratio = %.2f < 2.0)\n",
            max_sd, min_sd, max_sd / min_sd))

# 2.3 One-way ANOVA
# H0: mu_A = mu_B = mu_C
# Ha: At least one server mean bill is different
aov_tips <- aov(Bill ~ Server, data = RestaurantTips)
cat("\nANOVA Model Summary:\n")
print(summary(aov_tips))


# ==============================================================================
# Part 3: Quantitative vs. Categorical II (Two-Sample t-Test)
# Research Question: Are mean commuting times different depending on which bike
# (carbon vs. steel) is used?
# Dataset: BikeCommute
# ==============================================================================
cat("\n=======================================================\n")
cat("Part 3: Commute Minutes by Bike Frame (BikeCommute - t-Test)\n")
cat("=======================================================\n")

data(BikeCommute)

# 3.1 Numerical summary
cat("\nSummary Statistics by Bike Frame Material:\n")
bike_stats <- favstats(Minutes ~ Bike, data = BikeCommute)
print(bike_stats)

# 3.2 Two-Sample Welch t-Test
# H0: mu_carbon - mu_steel = 0
# Ha: mu_carbon - mu_steel != 0
ttest_bike <- t.test(Minutes ~ Bike, data = BikeCommute, conf.level = 0.95)
cat("\nWelch Two-Sample t-Test:\n")
print(ttest_bike)


# ==============================================================================
# Part 4: Quantitative vs. Quantitative (Linear Regression)
# Research Question: What is the relationship between MLB team wins and RBIs?
# Dataset: BaseballHits2019
# ==============================================================================
cat("\n=======================================================\n")
cat("Part 4: MLB Wins vs. RBIs (BaseballHits2019 - Regression)\n")
cat("=======================================================\n")

data(BaseballHits2019)

# 4.1 Pearson Correlation
r_val <- cor(Wins ~ RBI, data = BaseballHits2019)
cat(sprintf("\nPearson Correlation (r): %.4f\n", r_val))
cat(sprintf("Coefficient of Determination (R^2): %.4f\n", r_val^2))

# 4.2 Linear Model Estimation
# H0: beta_1 = 0, rho = 0
# Ha: beta_1 != 0, rho != 0
lm_base <- lm(Wins ~ RBI, data = BaseballHits2019)
cat("\nLinear Model Summary:\n")
print(summary(lm_base))

cat("\nAnalysis complete.\n")
