# elm-test-crash
## Demonstration of a crash bug in elm-test

To run:

1) Install Elm and/or elm-test if not already installed:

`npm install -g elm`
`npm install -g elm-test`

2) Navigate to the repository's root folder and run elm-test from the command line:

`elm-test`

What's happening: The test fuzzer creates lists of integers that are 99% `1`s and 1% `2`s. The only "test" (such as it is) in the suite compares the length of the original list to a list that has all of the `2`s stripped out, using `Expect.equalLists`. Thus, the test should pass if the original list consists only of `1`s, and fail if the original list contains any `2`s. The test does pass in the first case, but rather than failing in the second, it crashes with a node.js error: **RangeError: Maximum call stack size exceeded**.

The crash seems to be dependent on factors that you wouldn't expect to be relevant, such as whether the Elm code is in a package (crashes reliably) or in an application (I could not get it to crash that way).