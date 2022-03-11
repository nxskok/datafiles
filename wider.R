library(tidyverse)
d1 <- tribble(
  ~item, ~g, ~x,
  1, "treatment", 101,
  2, "treatment", 103,
  3, "treatment", 103,
  4, "treatment", 105,
  1, "control", 99,
  2, "control", 97,
  3, "control", 95,
  4, "control", 100
)
write_csv(d1, "docs/wider1.csv")
d2 <- tribble(
  ~item, ~g, ~x,
  1, "treatment", 101,
  2, "treatment", 103,
  3, "treatment", 103,
  4, "treatment", 105,
  5, "treatment", 108,
  1, "control", 99,
  2, "control", 97,
  3, "control", 95,
  4, "control", 100
)
write_csv(d2, "docs/wider2.csv")

d3 <- tribble(
  ~item, ~g, ~x,
  1, "treatment", 101,
  2, "treatment", 103,
  1, "treatment", 103,
  2, "treatment", 105,
  1, "treatment", 108,
  2, "control", 99,
  1, "control", 97,
  2, "control", 95,
  1, "control", 100
)
d3
write_csv(d2, "docs/wider3.csv")
