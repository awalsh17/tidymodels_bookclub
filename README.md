# R-Ladies Philly Book Club

Materials I made for the July R-Ladies event for the ISLR + {tidymodels} book club.
[Meetup page](https://www.meetup.com/rladies-philly/events/286295893/)

## Chapter 3: Linear Regression

https://emilhvitfeldt.github.io/ISLR-tidymodels-labs/linear-regression.html

## Files

I took the Rmd from https://github.com/EmilHvitfeldt/ISLR-tidymodels-labs and
created a modified version here:

[03-linear-regression-remix.Rmd](./tidymodels/03-linear-regression-remix.Rmd)

My changes are mainly showing a contrast between

+ a classic (no tidymodels) workflow in [classic_version](./classic_version/)
+ {tidymodels} workflow as in the above links [tidymodels](./tidymodels/)
+ {tidymodels} + {targets} [tidymodels_targets](./tidymodels_targets/)

I also changed the dataset from the Boston housing dataset in {MASS} package
to the {palmerpenguins} penguin dataset.
