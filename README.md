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

### Architecture

- Language

Ruby

- System

1.  a controller for Entry
2.  a model for Entry
3.  Entry have: date, start time, finish time, total amount
4.  some customize lib classes for caculate
5.  two simple frontend pages: index and new
6.  validation for input in backend

- Controller and Model

Entries controller
```
{
  index
  create
  new
  update 
}
```
Entry model
```
{
  date: date
  start_time: time
  finish_time: time
  amount: decimal
}
```

- customize libs

Processor:
to receive input and return total caculated amount to Entry model
```
{
  result_amount
}
```
Caculator:
a instance for caculate value
```
{
  amount_caculate
}
```
Range:
a instance store single time range
```
{
  range_start_time
  range_end_time
  rate
}
```
Weekday_Handler:
receive input date and create belonged Weekday instance
```
{
  weekday_create
}
```

***

### Patterns

- Singleton

Set the Processor class to be a singleton. Because of Processor instance will and always be only one in the system. It will not be created except from main application class.

- Command Pattern

