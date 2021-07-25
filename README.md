# benchmarks

## Validate input

Comapre approaches to validate text data.

- `validateInput` multi traversing of elem
- `validateInputAtto` usual Attoparsec parser
- `validateInputOptimized` refactored first approach. `Elem` shrinked.
- `validateInputRegexPcre` regex with `PCRE`
- `validateInputRegexPosix` regex with `Posix`

[text results](benchmark/Output/validate_input.md)

[visual results](benchmark/Output/validate_input_visual.md)

## Show sumtype

Compare generic `show` against approach using `unpack`.

`Unpack` (from Text to String) reduces operation speed in 6-7 times.

[text results](benchmark/Output/unpack_overhead.md)

[visual results](benchmark/Output/unpack_overhead_visual.md)


