# ==============================================================================
# Setup and Dependency Installation
# R / Statistical Computing Coursework
# Robert Kohn - Muhlenberg College
# ==============================================================================

# List of required packages used across the portfolio projects
required_packages <- c(
  "Lock5Data",  # Datasets from Lock et al., Statistics: Unlocking the Power of Data
  "mosaic",     # Formula-driven statistical summaries (favstats, tally, xchisq.test)
  "lattice",    # Trellis multivariate graphics (xyplot, bwplot, xqqmath)
  "ggformula"   # Formula interface to ggplot2 graphics (gf_dotplot)
)

# Identify missing packages
missing_packages <- required_packages[!(required_packages %in% installed.packages()[, "Package"])]

# Install missing packages if needed
if (length(missing_packages) > 0) {
  message("Installing missing packages: ", paste(missing_packages, collapse = ", "))
  install.packages(missing_packages, repos = "https://cloud.r-project.org")
} else {
  message("All required packages are already installed.")
}

# Verify packages load successfully
message("\nVerifying package availability:")
for (pkg in required_packages) {
  loaded <- suppressPackageStartupMessages(require(pkg, character.only = TRUE))
  message(sprintf("  [%s] %s", ifelse(loaded, "OK", "FAILED"), pkg))
}
