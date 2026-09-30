# Applied Statistical Investigations: MTH 119 Capstone Project

A comprehensive four-part empirical investigation applying classical statistical inference and linear modeling to real-world datasets from the `Lock5Data` library. The project explores four core inferential paradigms: contingency table testing, one-way analysis of variance, two-sample mean comparison, and simple linear regression with slope testing.

---

## What I Worked On

- **Categorical Independence Testing:** Constructed two-way contingency tables and evaluated conditional sample proportions for 453 detoxification unit patients (`HELPrct`). Conducted a Pearson's $\chi^2$ test of independence to assess the relationship between primary substance of abuse and housing status.
- **One-Way ANOVA & Variance Diagnostics:** Analyzed customer bill amounts across three servers ($n = 157$) at a dining establishment (`RestaurantTips`). Formulated null and alternative hypotheses, verified ANOVA assumptions (group normality via Q-Q plots and homoscedasticity using the rule-of-thumb standard deviation ratio), and interpreted the resulting $F$-test.
- **Two-Sample Hypothesis Testing & Interval Estimation:** Evaluated commute times between carbon fiber ($n = 26$) and steel frame ($n = 30$) bicycles (`BikeCommute`). Checked distribution shapes using dotplots and Q-Q plots, conducted a Welch two-sample $t$-test for difference in means, and constructed a 95% confidence interval for $\mu_C - \mu_S$.
- **Bivariate Regression & Correlation Analysis:** Modeled regular season team wins as a function of Runs Batted In across Major League Baseball franchises (`BaseballHits2019`, $n = 30$). Estimated Pearson's correlation coefficient ($r$), coefficient of determination ($R^2$), and the OLS regression slope, followed by hypothesis testing for non-zero population slope and correlation.

---

## Tools

- **Language:** R (v4.4+)
- **Packages:**
  - `Lock5Data` (source datasets: `HELPrct`, `RestaurantTips`, `BikeCommute`, `BaseballHits2019`)
  - `mosaic` (`tally`, `xchisq.test`, `favstats`)
  - `lattice` (`bwplot`, `xqqmath`, `xyplot`)
  - `ggformula` (`gf_dotplot`)
  - `stats` (`chisq.test`, `aov`, `t.test`, `lm`, `cor`)

---

## Files

- **`report.md`**: Complete, self-contained project report with formal hypotheses, assumption evaluations, data tables, embedded figures, and contextual interpretations.
- **`report.Rmd`**: Reproducible R Markdown source document executable in RStudio.
- **`analysis.R`**: Standalone R script reproducing all data transformations, statistical tests, and graphics.
- **`figures/`**: Visualizations and diagnostic graphics generated during the analyses (boxplots, dotplots, scatterplots, Q-Q plots, and summary tables).
- **`data/README.md`**: Documentation of the datasets, variable dictionaries, sample sizes, and access instructions.
- **`worksheets/`**: Contains `mth119-final-project-calculations.xlsx`, the accompanying calculation spreadsheet used to verify five-number summaries, outlier boundaries ($1.5 \times \text{IQR}$ rule), and test statistics.

---

## Results / Takeaways

1. **Substance Use vs. Housing Status (`HELPrct`):**  
   - $\chi^2 = 17.012$, $\text{df} = 2$, $p$-value $= 0.000202$ ($\alpha = 0.05$).
   - The null hypothesis of independence was rejected. Detoxification unit patients who were homeless exhibited a higher proportion of alcohol dependency ($\hat{p}_a = 0.582$), whereas patients with stable housing showed higher proportions of cocaine ($\hat{p}_c = 0.388$) or heroin ($\hat{p}_h = 0.379$) usage.

2. **Server Effect on Bill Amount (`RestaurantTips`):**  
   - ANOVA: $F(2, 154) = 1.671$, $p$-value $= 0.191$ ($\alpha = 0.05$).
   - Group means: Server A ($\$22.76$), Server B ($\$21.14$), Server C ($\$25.92$).
   - The test showed insufficient evidence to reject the null hypothesis of equal server mean bills. Server assignment does not have a statistically significant relationship with table bill size.

3. **Commute Time by Bike Frame (`BikeCommute`):**  
   - Welch $t$-test: $t = 0.3656$, $\text{df} = 46.96$, $p$-value $= 0.7163$ ($\alpha = 0.05$).
   - 95% Confidence Interval for $\mu_C - \mu_S$: $[-2.49, 3.60]$ minutes.
   - Sample means: Carbon ($108.34$ min), Steel ($107.79$ min).
   - The data showed insufficient evidence to claim a difference in mean commute times between bicycle frame materials; the interval easily spans zero.

4. **MLB Wins vs. RBIs (`BaseballHits2019`):**  
   - Correlation: $r = 0.817$, $R^2 = 0.668$.
   - Regression Equation: $\widehat{\text{Wins}} = -30.82 + 0.149 \times \text{RBI}$.
   - Slope $t$-test: $t(28) = 7.507$, $p$-value $= 3.55 \times 10^{-8}$ ($\alpha = 0.05$).
   - A statistically significant positive linear relationship exists. Approximately 66.8% of the variance in regular season team wins in 2019 was explained by team RBIs.

---

## Running the Analysis

From the repository root or this directory in R:

```r
# Step 1: Ensure required packages are installed
source("../setup.R")

# Step 2: Run the full analysis script
source("analysis.R")
```

To knit or review the report:
- Open `report.Rmd` in RStudio and click **Knit** (or run `rmarkdown::render("report.Rmd")` if pandoc is installed).
- View `report.md` directly on GitHub for instant rendering.
