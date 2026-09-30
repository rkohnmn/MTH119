# Calculation Worksheets: MTH 119 Capstone

This directory contains `mth119-final-project-calculations.xlsx`, an Excel workbook developed by Robert Kohn to organize summary statistics, compute five-number summaries, and cross-verify statistical calculations performed in R.

---

## Contents

- **`Template`**: General layout template embedding automated formulas for outlier fences:
  - Low-end outlier threshold: $Q_1 - 1.5 \times (Q_3 - Q_1)$
  - High-end outlier threshold: $Q_3 + 1.5 \times (Q_3 - Q_1)$
- **`Copy of ANOVA`**: Summary calculations and ANOVA table verification for the `RestaurantTips` analysis (Servers A, B, and C).
- **`BikeCommute`**: Summary statistics, sample mean difference, and $t$-test values for the carbon vs. steel bicycle commuting study.
- **`Regression`**: Bivariate correlation ($r, R^2$), slope ($\hat{\beta}_1$), intercept ($\hat{\beta}_0$), and $t$-test summaries for 2019 MLB team wins vs. RBIs (`BaseballHits2019`).
- **`HELPrct`**: Two-way cross-tabulation table and $\chi^2$ test statistic recording for the substance abuse vs. housing status study.

This workbook served as an intermediate analytical verification tool alongside RStudio during the completion of the capstone project.
