﻿# Score Diff Json

This software generates a comparison score between two JSON files.

## How to execute
First of all, have sure that **Ruby 2.7.1** is installed in your local environment.

To execute use the command:

```
ruby -r "./score_diff.rb" -e "ScoreDiff.print_json_score('./data/BreweriesMaster.json', './data/BreweriesSample2.json')"
```

There is an included script for comparing all of the sample data provided called runall.sh


```
./runall.sh
```

## Running tests
To execute the tests can be run with the following command:
```
bundle install
rspec .
```
