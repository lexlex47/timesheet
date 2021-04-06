# Weploy

[![Build Status](https://travis-ci.org/lexlex47/timesheet.svg?branch=main)](https://travis-ci.org/lexlex47/timesheet)
[![codecov](https://codecov.io/gh/lexlex47/timesheet/branch/main/graph/badge.svg?token=3idyfQden5)](https://codecov.io/gh/lexlex47/timesheet)
[![Maintainability](https://api.codeclimate.com/v1/badges/6b3afef29f340675818c/maintainability)](https://codeclimate.com/github/lexlex47/timesheet/maintainability)

It is a code test for Weploy.

## Task

Your task is to create a timesheet entry application. Keep in mind that you will be required to extend it in the next process of the interview.

### TODO

1.  A timesheet consists of a Date, a Start Time and a Finish Time.
2.  Your application should display existing timesheets, calculate their dollar value, and allow users to create new timesheets.
3.  It should consist of two screens.

### Dependencies

    Ruby => 2.7.2p137 (2020-10-01 revision 5445e04352) [x64-mingw32]
    Rails => 6.0.3.6
    Bundler => 2.1.4
    Gem => 3.1.4

### CI Tools

    Travis CI
    Code Climate
    Codecov

### Installation

Clone the repo from https://github.com/lexlex47/timesheet

and then execute:

    $ bundle install
    $ rails db:create
    $ rails db:migrate

### Run

To run execute:

    $ rails s

Then vist http://localhost:3000/

### Test

To run rspec test execute:

    $ bundle exec rspec

***

## Design