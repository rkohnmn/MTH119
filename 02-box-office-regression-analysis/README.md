# Hollywood Box Office Revenue Regression Analysis

An applied linear modeling study investigating the relationship between opening weekend box office receipts and total lifetime worldwide gross earnings across Hollywood feature films.

---

## What I Worked On

- **Variable Classification & Modeling:** Defined `OpeningWeekend` (millions USD) as the explanatory variable and `WorldGross` (millions USD) as the response variable for 970 theatrical releases (`HollywoodMovies`).
- **Exploratory Data Visualization:** Generated a bivariate scatterplot overlaid with an Ordinary Least Squares (OLS) regression line using `lattice::xyplot`.
- **Correlation & Parameter Estimation:** Computed the Pearson correlation coefficient ($r$) using pairwise complete observations and estimated the OLS regression parameters ($\hat{\beta}_0, \hat{\beta}_1$).
- **Statistical Interpretation:** Contextualized the economic meaning of the regression slope in terms of box office revenue multiplication.
- **Prediction & Residual Diagnostics:** Performed a point prediction for a hypothetical $\$50\text{M}$ opening weekend and analyzed a major commercial outlier (*The Great Gatsby*, 2013), calculating its observed-versus-predicted residual.

---

## Tools

- **Language:** R (v4.4+)
- **Packages:**
  - `Lock5Data` (source dataset: `HollywoodMovies`)
  - `lattice` (`xyplot`)
  - `stats` (`cor`, `lm`, `predict`)

---

## Files

- **`report.md`**: Complete analytical case study with narrative interpretation, equations, and embedded regression scatterplot.
- **`report.Rmd`**: Reproducible R Markdown source document executable in RStudio.
- **`analysis.R`**: Standalone R script replicating the modeling, prediction, and residual calculations.
- **`figures/`**: Visualizations including the fitted regression scatterplot (`hollywood-regression-scatterplot.png`).
- **`data/README.md`**: Data provenance, variable schema, and access instructions for the `HollywoodMovies` dataset.

---

## Results / Takeaways

- **Correlation:** $r = 0.9066$ ($p < 2.2 \times 10^{-16}$), demonstrating an exceptionally strong positive linear association between opening weekend performance and global gross.
- **Fitted Regression Model:**
  $$\widehat{\text{WorldGross}} = 15.408 + 7.502 \times \text{OpeningWeekend}$$
- **Coefficient of Determination ($R^2$):** $R^2 = 0.8219$, meaning that approximately $82.2\%$ of the variation in total worldwide gross among Hollywood releases is explained by opening weekend receipts.
- **Slope Interpretation:** On average, for every additional $\$1\text{M}$ earned during opening weekend, a film is expected to generate approximately $\$7.502\text{M}$ in total lifetime worldwide gross.
- **Prediction:** A film earning $\$50\text{M}$ during its opening weekend is predicted to yield:
  $$\widehat{\text{WorldGross}} = 15.408 + 7.502(50) = \$390.51\text{M}$$
- **Outlier Diagnostic:** *The Great Gatsby* (2013) earned $\$50.9\text{M}$ opening weekend with an actual world gross of $\$353.64\text{M}$. The model predicts $\approx \$397.26\text{M}$, yielding a residual of:
  $$e = y - \hat{y} = 353.64 - 397.26 = -\$43.62\text{M}$$
  (Robert's coursework calculation: $-36.87\text{M}$ based on intermediate rounded parameters).

---

## Running the Analysis

From this directory in R:

```r
# Step 1: Ensure dependencies are installed
source("../setup.R")

# Step 2: Run analysis script
source("analysis.R")
```
