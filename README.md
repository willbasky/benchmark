# benchmarks

Comapre three approaches to validate text input.

1. `validateInput` uses multi traversing
2. `validateInputAtto` usual Attoparsec parser
3. `validateInputOptimized` refactored first approach

## Benchmarks output

```
Benchmark benchmark-benchmark: RUNNING...
benchmarking validateInput 10
time                 83.77 μs   (82.87 μs .. 84.75 μs)
                     0.998 R²   (0.996 R² .. 0.999 R²)
mean                 86.22 μs   (84.79 μs .. 89.56 μs)
std dev              7.235 μs   (3.522 μs .. 12.05 μs)
variance introduced by outliers: 76% (severely inflated)

benchmarking validateInputOptimized 10
time                 1.972 μs   (1.903 μs .. 2.077 μs)
                     0.984 R²   (0.971 R² .. 0.995 R²)
mean                 2.025 μs   (1.970 μs .. 2.129 μs)
std dev              250.9 ns   (162.7 ns .. 372.0 ns)
variance introduced by outliers: 92% (severely inflated)

benchmarking validateInputOptimized2 10
time                 3.137 μs   (2.929 μs .. 3.269 μs)
                     0.986 R²   (0.981 R² .. 0.991 R²)
mean                 2.859 μs   (2.779 μs .. 2.966 μs)
std dev              286.5 ns   (214.2 ns .. 384.5 ns)
variance introduced by outliers: 88% (severely inflated)

benchmarking validateInputAtto 10
time                 2.348 μs   (2.268 μs .. 2.422 μs)
                     0.987 R²   (0.971 R² .. 0.994 R²)
mean                 2.301 μs   (2.245 μs .. 2.406 μs)
std dev              250.8 ns   (146.7 ns .. 413.0 ns)
variance introduced by outliers: 90% (severely inflated)

benchmarking validateInput 50
time                 268.1 μs   (255.5 μs .. 289.3 μs)
                     0.966 R²   (0.942 R² .. 0.988 R²)
mean                 285.7 μs   (273.6 μs .. 325.3 μs)
std dev              72.60 μs   (42.65 μs .. 130.7 μs)
variance introduced by outliers: 97% (severely inflated)

benchmarking validateInputOptimized 50
time                 8.823 μs   (8.677 μs .. 9.058 μs)
                     0.989 R²   (0.977 R² .. 0.998 R²)
mean                 8.794 μs   (8.537 μs .. 9.271 μs)
std dev              1.125 μs   (695.2 ns .. 1.719 μs)
variance introduced by outliers: 91% (severely inflated)

benchmarking validateInputOptimized2 50
time                 11.09 μs   (10.71 μs .. 11.66 μs)
                     0.976 R²   (0.948 R² .. 0.997 R²)
mean                 11.54 μs   (11.16 μs .. 12.32 μs)
std dev              1.705 μs   (796.6 ns .. 3.158 μs)
variance introduced by outliers: 93% (severely inflated)

benchmarking validateInputAtto 50
time                 9.705 μs   (9.398 μs .. 10.19 μs)
                     0.983 R²   (0.970 R² .. 0.997 R²)
mean                 10.21 μs   (9.792 μs .. 11.26 μs)
std dev              2.200 μs   (1.056 μs .. 4.088 μs)
variance introduced by outliers: 97% (severely inflated)

benchmarking validateInput 100
time                 272.2 μs   (261.4 μs .. 290.3 μs)
                     0.981 R²   (0.964 R² .. 0.997 R²)
mean                 335.5 μs   (278.1 μs .. 504.2 μs)
std dev              364.9 μs   (30.57 μs .. 702.9 μs)
variance introduced by outliers: 99% (severely inflated)

benchmarking validateInputOptimized 100
time                 14.51 μs   (14.10 μs .. 14.93 μs)
                     0.991 R²   (0.983 R² .. 0.996 R²)
mean                 14.81 μs   (14.01 μs .. 17.88 μs)
std dev              4.815 μs   (1.303 μs .. 9.921 μs)
variance introduced by outliers: 99% (severely inflated)

benchmarking validateInputOptimized2 100
time                 18.08 μs   (16.64 μs .. 19.46 μs)
                     0.970 R²   (0.962 R² .. 0.988 R²)
mean                 17.78 μs   (17.17 μs .. 18.58 μs)
std dev              2.114 μs   (1.606 μs .. 3.063 μs)
variance introduced by outliers: 90% (severely inflated)

benchmarking validateInputAtto 100
time                 18.32 μs   (18.03 μs .. 18.64 μs)
                     0.990 R²   (0.971 R² .. 0.998 R²)
mean                 21.01 μs   (19.72 μs .. 25.05 μs)
std dev              7.891 μs   (4.757 μs .. 13.94 μs)
variance introduced by outliers: 99% (severely inflated)

Benchmark benchmark-benchmark: FINISH
```

## Extra unpacking reduce operation speed in 6-7 times.  (From Text to String)

Benchmark pack_overhead_bench: RUNNING...
benchmarking generic Status show: Register
time                 18.44 ns   (17.48 ns .. 19.87 ns)
                     0.949 R²   (0.938 R² .. 0.963 R²)
mean                 23.93 ns   (22.49 ns .. 25.16 ns)
std dev              5.013 ns   (4.398 ns .. 5.392 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking unpack using showStatus: Register
time                 126.2 ns   (121.7 ns .. 135.0 ns)
                     0.967 R²   (0.949 R² .. 0.981 R²)
mean                 150.9 ns   (142.0 ns .. 159.4 ns)
std dev              30.92 ns   (27.21 ns .. 33.99 ns)
variance introduced by outliers: 98% (severely inflated)
