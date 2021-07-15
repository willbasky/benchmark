# benchmark

Comapre three approaches to validate text input.

1. `patternMatch` uses multi traversing
2. `patternMatchAtto` usual Attoparsec parser
3. `patternMatchOptimized` refactored first approach

## Benchmarks

```
Benchmark benchmark-benchmark: RUNNING...
benchmarking patternMatch 10
time                 82.16 μs   (80.36 μs .. 85.93 μs)
                     0.985 R²   (0.973 R² .. 0.994 R²)
mean                 88.52 μs   (84.36 μs .. 104.7 μs)
std dev              26.39 μs   (9.076 μs .. 53.19 μs)
variance introduced by outliers: 98% (severely inflated)

benchmarking patternMatchOptimized 10
time                 2.093 μs   (1.965 μs .. 2.197 μs)
                     0.982 R²   (0.974 R² .. 0.994 R²)
mean                 2.008 μs   (1.950 μs .. 2.090 μs)
std dev              246.4 ns   (178.8 ns .. 324.4 ns)
variance introduced by outliers: 92% (severely inflated)

benchmarking patternMatchAtto 10
time                 2.666 μs   (2.531 μs .. 2.848 μs)
                     0.974 R²   (0.945 R² .. 0.993 R²)
mean                 2.663 μs   (2.526 μs .. 3.002 μs)
std dev              722.1 ns   (418.0 ns .. 1.131 μs)
variance introduced by outliers: 98% (severely inflated)

benchmarking patternMatch 50
time                 302.0 μs   (284.7 μs .. 318.7 μs)
                     0.983 R²   (0.976 R² .. 0.990 R²)
mean                 288.5 μs   (275.7 μs .. 299.7 μs)
std dev              34.07 μs   (27.25 μs .. 41.70 μs)
variance introduced by outliers: 83% (severely inflated)

benchmarking patternMatchOptimized 50
time                 8.979 μs   (8.761 μs .. 9.211 μs)
                     0.989 R²   (0.983 R² .. 0.995 R²)
mean                 9.434 μs   (9.112 μs .. 10.44 μs)
std dev              1.931 μs   (868.9 ns .. 3.719 μs)
variance introduced by outliers: 97% (severely inflated)

benchmarking patternMatchAtto 50
time                 11.01 μs   (10.53 μs .. 11.54 μs)
                     0.982 R²   (0.974 R² .. 0.990 R²)
mean                 10.81 μs   (10.44 μs .. 11.23 μs)
std dev              1.245 μs   (930.9 ns .. 1.506 μs)
variance introduced by outliers: 90% (severely inflated)

benchmarking patternMatch 100
time                 271.6 μs   (255.4 μs .. 293.2 μs)
                     0.967 R²   (0.951 R² .. 0.985 R²)
mean                 290.1 μs   (276.1 μs .. 313.9 μs)
std dev              64.22 μs   (36.82 μs .. 98.32 μs)
variance introduced by outliers: 96% (severely inflated)

benchmarking patternMatchAtto 100
time                 22.03 μs   (19.96 μs .. 23.96 μs)
                     0.950 R²   (0.906 R² .. 0.984 R²)
mean                 21.63 μs   (20.17 μs .. 23.74 μs)
std dev              5.908 μs   (2.149 μs .. 9.584 μs)
variance introduced by outliers: 98% (severely inflated)

benchmarking patternMatchOptimized 100
time                 14.54 μs   (14.26 μs .. 15.03 μs)
                     0.994 R²   (0.990 R² .. 0.997 R²)
mean                 15.44 μs   (15.16 μs .. 15.82 μs)
std dev              1.131 μs   (883.1 ns .. 1.382 μs)
variance introduced by outliers: 76% (severely inflated)

Benchmark benchmark-benchmark: FINISH
```
