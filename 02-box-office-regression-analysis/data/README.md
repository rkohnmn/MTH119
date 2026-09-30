# Data Documentation: Hollywood Box Office Regression

The dataset used in this analysis originates from the `Lock5Data` R package, accompanying *Statistics: Unlocking the Power of Data* by Robin H. Lock et al.

---

## Dataset: `HollywoodMovies`

- **R Access Command:** `data(HollywoodMovies, package = "Lock5Data")`
- **Sample Size:** 970 observations (theatrical feature films released between 2007 and 2013), 16 variables
- **Description:** Box office returns, production budgets, genre categorizations, and critical reception scores compiled across major Hollywood releases.
- **Variables Used in Analysis:**
  - `Movie`: Title of the feature film
  - `OpeningWeekend`: Domestic opening weekend revenue in millions of US dollars (Quantitative explanatory variable)
  - `WorldGross`: Total global lifetime box office gross in millions of US dollars (Quantitative response variable)

---

## Loading Data in R

To access the dataset directly in R:

```r
if (!requireNamespace("Lock5Data", quietly = TRUE)) {
  install.packages("Lock5Data")
}
library(Lock5Data)
data(HollywoodMovies)
```
