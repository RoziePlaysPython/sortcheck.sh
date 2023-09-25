# About
This script I developed for doing quick tests on my sorting algorithms
*It is currently under development*

# Usage
```bash
sh sortcheck.sh <binary_name> <rng_bottom> <rng_top> <rng_count> <test_count>
```

Every argument apart from the binary name is optional

Default values for those are:

-----
rng_bottom=0 // Doesn't support negative values yet!
rng_top=1000
rng_count=10
test_count=10

-----
# Some explanation
rng_bottom:
  The bottom limit of possible random values
rng_top:
  Top limit
rng_count:
  How many values to generate per test
  For example, rng_count of 10 will produce something like this: "700 284 469 490 902 904 549 360 891 780"
test_count:
  Well, test count :shrug:

