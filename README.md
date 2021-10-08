# The Gilded Rose Code Kata

![RSpec](https://github.com/plainprogrammer/GildedRose.rb/actions/workflows/rspec.yml/badge.svg)

This is a refactoring kata, so you will be starting with a legacy
code base.  To work this kata, clone this repo and checkout `main` before
pulling off a new branch to begin your work. Once you have your branch ready to
work on, run `bin/rake` or `rspec spec/` to confirm your stating point is
clean. As you make your refactorings, ensure you are running the test suite
with the previously mentioned commands to ensure correctness.

---

# The Gilded Rose

Hi and welcome to team Gilded Rose. As you know, we are a small inn
with a prime location in a prominent city run by a friendly innkeeper
named Allison. We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as
they approach their sell by date. We have a system in place that
updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add
the new feature to our system so that we can begin selling a new
category of items. First an introduction to our system:

- All items have a SellIn value which denotes the number of days we
  have to sell the item
- All items have a Quality value which denotes how valuable the item
  is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

  - Once the sell by date has passed, Quality degrades twice as fast
  - The Quality of an item is never negative
  - "Aged Brie" actually increases in Quality the older it gets
  - The Quality of an item is never more than 50
  - "Sulfuras", being a legendary item, never has to be sold or
    decreases in Quality
  - "Backstage passes", like aged brie, increases in Quality as it's
    SellIn value approaches; Quality increases by 2 when there are 10
    days or less and by 3 when there are 5 days or less but Quality
    drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any
new code as long as everything still works correctly. However, do not
alter the Item class or Items property as those belong to the goblin
in the corner who will insta-rage and one-shot you as he doesn't
believe in shared code ownership (you can make the UpdateQuality
method and Items property static if you like, we'll cover for
you). Your work needs to be completed by Friday, February 18, 2011
08:00:00 AM PST.

Just for clarification, an item can never have its Quality increase
above 50, however "Sulfuras" is a legendary item and as such its
Quality is 80 and it never alters.

<hr />

## Installation

The easiest way is to use bundler to install and get setup.

    gem install bundler
    bundle install
    bundle exec rspec

## Git Branches

* The `main` branch contains the starting point for the kata.

## Changes from the original

This Ruby version follows the original code very closely, but has the
following changes:

* The original had no tests.  Since this is a refactoring kata, I feel
  the tests are important and provide a fairly complete test suite. (Jim Weirich)

* The original used a hard coded set of "items", presumably for
  testing the code.  Since I added a test suite, the hard coded values
  were not of much use.  I also changed the interface to accept a list of
  items as a parameter rather than a hard coded constant. (Jim Weirich)

You can read
[the original kata article](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/) for more details.
