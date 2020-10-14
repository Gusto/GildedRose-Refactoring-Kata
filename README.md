## Forked from [here](https://github.com/emilybache/GildedRose-Refactoring-Kata)

Forked to run workshops using the Kata.

## Instructions

1. Clone this repo (`git clone git@github.com:wenley/GildedRose-Refactoring-Kata.git`)
2. Make sure you have the `rspec` gem installed (`gem install rspec`)
3. Run the specs (`rspec ruby/gilded_rose_spec.rb`)
4. Read the [instructions](https://github.com/wenley/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt)
5. Implement the currently skipped tests! (Look for `xcontext` in the spec file and replace it with `context` -> can see if the tests pass).

Strong Hint: You probably want to do some refactoring before implementing the behavior for the skipped tests. Remember, the goal is to practice refactoring, NOT to brute-force get the tests to pass.

Some smell tests:
- If the final change you make to make the skipped tests pass involves an obvious, easy-to-read 1 to 4 line change in one place, you're probably doing it right.
- If the final change you make to make the skipped tests pass involves changing multiple lines scattered across the file, you're probably not done refactoring.

#### Note: Tests are provided

Part of the original exercise is figuring out what tests to add, but that would take more time than we have.

If you want to give a shot at writing your own tests, feel free to do so on your own time! You can clone the original repo and get started from there.

#### Where did this come from?

See the [original repo](https://github.com/emilybache/GildedRose-Refactoring-Kata) for lots of context + story telling about where this exercise came from.
