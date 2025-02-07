fabricatr: Imagine your data before you collect it
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/fabricatr)](https://cran.r-project.org/package=fabricatr)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/fabricatr?color=green)](https://r-pkg.org/pkg/fabricatr)
[![Build
status](https://github.com/DeclareDesign/fabricatr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DeclareDesign/fabricatr/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/DeclareDesign/fabricatr/graph/badge.svg)](https://app.codecov.io/gh/DeclareDesign/fabricatr)
[![Replications](https://softwarecite.com/badge/fabricatr)](https://softwarecite.com/package/fabricatr)

Making decisions about research design and analysis strategies is often
difficult before data is collected, because it is hard to imagine the
exact form data will take. Instead, researchers typically modify
analysis strategies to fit the data. **fabricatr** helps researchers
imagine what data will look like before they collect it. Researchers can
evaluate alternative analysis strategies, find the best one given how
the data will look, and precommit before looking at the realized data.

### Installing fabricatr

To install the latest stable release of **fabricatr**, please ensure
that you are running version 3.5 or later of R and run the following
code:

``` r
install.packages("fabricatr")
```

### Getting started

Once you have installed **fabricatr**, you can easily import your own
data or generate new data. **fabricatr** is designed to help you solve
two key problems:

1.  Generating variables that look like the real thing, including Likert
    survey responses, treatment status, demographic variables, and
    variables correlated by group.
2.  Generating data that are structured like the real thing, including
    panel data, multi-level (“nested”) data or cross-classified data.

**fabricatr** is easy to learn and easy to read. Consider this example
which generates data modeling the United States House of
Representatives:

``` r
library(fabricatr)

house_members <- fabricate(
  party_id = add_level(
    N = 2, party_names = c("Republican", "Democrat"), party_ideology = c(0.5, -0.5),
    in_power = c(1, 0), party_incumbents = c(241, 194)
  ),
  rep_id = add_level(
    N = party_incumbents, member_ideology = rnorm(N, party_ideology, sd = 0.5),
    terms_served = draw_count(N = N, mean = 4),
    female = draw_binary(N = N, prob = 0.198)
  )
)
```

| party_names | party_ideology | in_power | member_ideology | terms_served | female |
|:------------|---------------:|---------:|----------------:|-------------:|-------:|
| Republican  |            0.5 |        1 |            0.43 |            3 |      0 |
| Republican  |            0.5 |        1 |           -0.19 |            1 |      0 |
| Republican  |            0.5 |        1 |            0.52 |            4 |      0 |
| Republican  |            0.5 |        1 |            0.85 |            2 |      0 |
| Republican  |            0.5 |        1 |            0.59 |            5 |      0 |

### Next Steps

For more information, read our [online
tutorial](/r/fabricatr/articles/getting_started.html) to get started
with **fabricatr**. This tutorial will give you a brief overview of
**fabricatr**’s main functions and direct you towards your next steps.
You can also read our documentation inside R using the command
`?fabricate` as your entry point.

------------------------------------------------------------------------

This project is generously supported by a grant from the [Laura and John
Arnold Foundation](http://www.arnoldfoundation.org) and seed funding
from [EGAP](http://egap.org).
