# Weploy Timesheet

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

1.  a controller for Entries
2.  a model for Entry
3.  Entry have: date, start time, finish time, total amount
4.  some customize lib classes
5.  two simple frontend pages: index and new
6.  validation for input data in backend

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
a instance store single time range and rate
```
{
  range_start_time
  range_end_time
  rate
}
```
Weekday_Handler:
receive input date and create belonged Weekday objects
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

The Weekdays moudle is using the command pattern. Using command objects makes it easier to construct general components that need to delegate, sequence or execute method calls at a time of their choosing without the need to know the class of the method or the method parameters.

***

### Model Validations

1.  Date of entry, can not be in the future.
2.  Finish time can not before start time.
3.  Entries time can not overlapping.
4.  Index page, dispaly Entries base on Date decrease order.

***

### Total Amount Caculation

#### Weekdays Moudle

Here I implement 7 weekdays subclass inherit from base class: Weekdays::Weekday.
Each Weekdays::Weekday can be seen as an Event of current weekday. So it has:
```
{
  event_start_time
  event_finish_time
}
```
Besides this, Weekdays::Weekday also have an array of Range objects. This Range class is an object store one time period, so it has:
```
{
  range_start_time
  range_end_time
  current_time_range_rate
}
```
The advantage in this design way:

1.  loose coupling between time period and different weekday
2.  easy extend
3.  can create a time period as much as you want, not limited to one inside and one outside
4.  can create many Event on a weekday on the same day
5.  time periods always can cover from 00:00 to 24:00
6.  avoid the brute force

#### Time period implementation

- First, check the start_time is covered by the current time period(the first time period always start from 00:00) or not:
```
(range.range_start..range.range_end).cover?(@start_time)
```
if start_time is not covered, it means finish_time is not in this period as well, just return 0;

- Second, if start_time is covered then check the finish_time is covered or not:
```
(range.range_start..range.range_end).cover?(@finish_time)
```
if finish_time is covered, it means current event is finished inside current time period, do:
```
return @caculator.amount_caculate(@start_time, @finish_time, range.rate)
```
and return the amount of current time range;

- Third, if finish_time is not covered, it means the current time range will need to fully calculate:
```
amount = @caculator.amount_caculate(@start_time, range.range_end, range.rate)
```
also, the start_time will be assigned to the current time range's end_time, because the calculation is not complete yet, there still other time period left:
```
@start_time = range.range_end
return amount
```
and return the current amount, and repeat First step.

- Finally, in `process` method, add all amount together and return total_amount to Entry model.
```
total = 0
@time_ranges.each do |range|
  total += process_range(range)
end
total
```

***

### Something can be refactoring...

- I more focus on the Backend side development, therefore the frontend page only use simple html and css to render. After can add bootstrap lib, or use ReactJs to the styling page.

- Can use some service objects like interactor-rails to refactoring code and thin controller.

- Add more validation and exceptions.

- Use REST API or GraphQL to pass data.