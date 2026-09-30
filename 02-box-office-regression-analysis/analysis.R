# ==============================================================================
# Hollywood Box Office Revenue Regression Analysis
# Analysis Script
# Author: Robert Kohn (Muhlenberg College)
# ==============================================================================

# Load required packages
suppressPackageStartupMessages({
  library(Lock5Data)
  library(mosaic)   # Enables formula interface for cor() and favstats()
  library(lattice)  # Enables xyplot()
})

# Load HollywoodMovies dataset
data(HollywoodMovies)

cat("=======================================================\n")
cat("Hollywood Box Office: Opening Weekend vs. World Gross\n")
cat("=======================================================\n")

# 1. Pearson Correlation
# Using formula syntax enabled by mosaic
r_val <- cor(WorldGross ~ OpeningWeekend, use = "pairwise.complete", data = HollywoodMovies)
cat(sprintf("Correlation (r): %.7f\n", r_val))
cat(sprintf("R-squared (R^2): %.4f\n", r_val^2))

# 2. Ordinary Least Squares Linear Regression Model
# Explanatory: OpeningWeekend ($M)
# Response: WorldGross ($M)
lm_movies <- lm(WorldGross ~ OpeningWeekend, data = HollywoodMovies)
cat("\nLinear Model Summary:\n")
print(summary(lm_movies))

# Extract coefficients
b0 <- coef(lm_movies)[1]
b1 <- coef(lm_movies)[2]
cat(sprintf("\nEstimated Regression Equation: WorldGross = %.3f + %.3f * OpeningWeekend\n", b0, b1))

# 3. Prediction for a $50M Opening Weekend
pred_50 <- predict(lm_movies, newdata = data.frame(OpeningWeekend = 50))
cat(sprintf("Predicted World Gross for $50M Opening Weekend: $%.3f Million\n", pred_50))

# 4. Outlier Analysis: The Great Gatsby (2013)
gatsby <- subset(HollywoodMovies, grepl("Gatsby", Movie))
if (nrow(gatsby) > 0) {
  act_open <- gatsby$OpeningWeekend[1]
  act_gross <- gatsby$WorldGross[1]
  pred_gatsby <- predict(lm_movies, newdata = data.frame(OpeningWeekend = act_open))
  residual_gatsby <- act_gross - pred_gatsby
  
  cat("\nOutlier Case Analysis - The Great Gatsby:\n")
  cat(sprintf("  Opening Weekend: $%.2f Million\n", act_open))
  cat(sprintf("  Actual World Gross: $%.2f Million\n", act_gross))
  cat(sprintf("  Predicted World Gross: $%.2f Million\n", pred_gatsby))
  cat(sprintf("  Residual (Observed - Predicted): $%.4f Million\n", residual_gatsby))
}

cat("\nAnalysis complete.\n")
