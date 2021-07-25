# benchmarks

## Validate input

Comapre approaches to validate text data.

- `validateInput` multi traversing of elem
- `validateInputAtto` usual Attoparsec parser
- `validateInputOptimized` refactored first approach. `Elem` shrinked.
- `validateInputRegexPcre` regex with `PCRE`
- `validateInputRegexPosix` regex with `Posix`

[results](benchmark/Output/validateInput.md)

## Show sumtype

Compare generic `show` against approach using `unpack`.

`Unpack` (from Text to String) reduces operation speed in 6-7 times.

[results](benchmark/Output/unpack-overhead.md)


