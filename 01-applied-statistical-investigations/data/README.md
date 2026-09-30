# Data Documentation: Applied Statistical Investigations

The datasets analyzed in this project originate from the `Lock5Data` R package, accompanying the textbook *Statistics: Unlocking the Power of Data* by Robin H. Lock, Patti Frazer Lock, Kari Lock Morgan, Eric F. Lock, and Dennis F. Lock.

Rather than redistributing raw data files, datasets are accessed directly via CRAN through the `Lock5Data` package.

---

## 1. `HELPrct` (Health Evaluation and Linkage to Primary Care)
- **R Access Command:** `data(HELPrct, package = "Lock5Data")`
- **Sample Size:** 453 observations, 27 variables
- **Study Background:** A clinical trial of adult inpatients admitted to a detoxification unit with alcohol, cocaine, or heroin dependency.
- **Variables Used in Analysis:**
  - `substance`: Primary substance of abuse (`alcohol`, `cocaine`, `heroin`)
  - `homeless`: Housing status indicator (`homeless`, `housed`)

---

## 2. `RestaurantTips`
- **R Access Command:** `data(RestaurantTips, package = "Lock5Data")`
- **Sample Size:** 157 observations, 7 variables
- **Study Background:** Customer receipts collected from a restaurant in upstate New York across different servers.
- **Variables Used in Analysis:**
  - `Server`: Identifier for the server attending the table (`A`, `B`, `C`)
  - `Bill`: Total cost of the meal in US dollars (Quantitative)

---

## 3. `BikeCommute`
- **R Access Command:** `data(BikeCommute, package = "Lock5Data")`
- **Sample Size:** 56 observations, 9 variables
- **Study Background:** Data recorded by a bicycle commuter testing whether a lighter carbon-frame bicycle meaningfully reduces commute times relative to a traditional steel-frame bicycle over identical routes.
- **Variables Used in Analysis:**
  - `Bike`: Frame material of the bicycle (`Carbon`, `Steel`)
  - `Minutes`: Total commuting travel time in minutes (Quantitative)

---

## 4. `BaseballHits2019`
- **R Access Command:** `data(BaseballHits2019, package = "Lock5Data")`
- **Sample Size:** 30 observations (all MLB teams in 2019), 16 variables
- **Study Background:** Team-level regular season batting, pitching, and victory statistics for the 2019 Major League Baseball season.
- **Variables Used in Analysis:**
  - `RBI`: Total Runs Batted In accumulated by the team (Quantitative)
  - `Wins`: Total regular season games won by the team (Quantitative)

---

## Loading Data in R

To load all four datasets into an active R session:
```r
if (!requireNamespace("Lock5Data", quietly = TRUE)) {
  install.packages("Lock5Data")
}
library(Lock5Data)

data(HELPrct)
data(RestaurantTips)
data(BikeCommute)
data(BaseballHits2019)
```
