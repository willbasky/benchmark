# benchmarks

Comapre three approaches to validate text input.

1. `validateInput` uses multi traversing
2. `validateInputAtto` usual Attoparsec parser
3. `validateInputOptimized` refactored first approach

## Benchmarks output

```
Benchmark validate_input_bench: RUNNING...
benchmarking Elem text 10
time                 1.055 μs   (969.8 ns .. 1.152 μs)
                     0.958 R²   (0.947 R² .. 0.972 R²)
mean                 1.240 μs   (1.185 μs .. 1.286 μs)
std dev              170.8 ns   (124.9 ns .. 202.2 ns)
variance introduced by outliers: 94% (severely inflated)

benchmarking Optimized2 10
time                 767.2 ns   (737.7 ns .. 796.8 ns)
                     0.994 R²   (0.990 R² .. 0.999 R²)
mean                 757.6 ns   (745.7 ns .. 773.3 ns)
std dev              45.05 ns   (29.87 ns .. 66.76 ns)
variance introduced by outliers: 74% (severely inflated)

benchmarking Attoparsec 10
time                 705.3 ns   (689.5 ns .. 716.7 ns)
                     0.997 R²   (0.996 R² .. 0.999 R²)
mean                 691.3 ns   (677.4 ns .. 704.7 ns)
std dev              49.18 ns   (38.34 ns .. 72.71 ns)
variance introduced by outliers: 81% (severely inflated)

benchmarking Regex imerative 10
time                 1.757 μs   (1.628 μs .. 1.936 μs)
                     0.913 R²   (0.887 R² .. 0.942 R²)
mean                 2.163 μs   (1.963 μs .. 2.354 μs)
std dev              616.7 ns   (571.3 ns .. 683.5 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking Elem text 50
time                 5.497 μs   (5.420 μs .. 5.661 μs)
                     0.994 R²   (0.988 R² .. 0.999 R²)
mean                 5.547 μs   (5.374 μs .. 5.816 μs)
std dev              732.2 ns   (339.7 ns .. 1.219 μs)
variance introduced by outliers: 92% (severely inflated)

benchmarking Optimized2 50
time                 4.460 μs   (4.361 μs .. 4.601 μs)
                     0.993 R²   (0.990 R² .. 0.995 R²)
mean                 4.554 μs   (4.457 μs .. 4.672 μs)
std dev              384.7 ns   (342.0 ns .. 433.0 ns)
variance introduced by outliers: 83% (severely inflated)

benchmarking Attoparsec 50
time                 3.486 μs   (3.369 μs .. 3.695 μs)
                     0.971 R²   (0.955 R² .. 0.984 R²)
mean                 3.806 μs   (3.562 μs .. 4.065 μs)
std dev              788.0 ns   (651.9 ns .. 1.037 μs)
variance introduced by outliers: 97% (severely inflated)

benchmarking Regex imerative 50
time                 2.495 μs   (2.244 μs .. 2.725 μs)
                     0.947 R²   (0.919 R² .. 0.974 R²)
mean                 2.255 μs   (2.031 μs .. 2.403 μs)
std dev              565.7 ns   (519.1 ns .. 626.8 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking Elem text 100
time                 8.527 μs   (8.461 μs .. 8.596 μs)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 8.551 μs   (8.491 μs .. 8.650 μs)
std dev              228.1 ns   (188.4 ns .. 295.1 ns)
variance introduced by outliers: 30% (moderately inflated)

benchmarking Optimized2 100
time                 8.097 μs   (7.969 μs .. 8.281 μs)
                     0.997 R²   (0.994 R² .. 0.999 R²)
mean                 8.158 μs   (8.080 μs .. 8.320 μs)
std dev              371.5 ns   (214.1 ns .. 616.1 ns)
variance introduced by outliers: 56% (severely inflated)

benchmarking Attoparsec 100
time                 6.615 μs   (6.268 μs .. 6.987 μs)
                     0.982 R²   (0.969 R² .. 0.997 R²)
mean                 6.474 μs   (6.268 μs .. 6.985 μs)
std dev              1.183 μs   (551.1 ns .. 2.072 μs)
variance introduced by outliers: 96% (severely inflated)

benchmarking Regex imerative 100
time                 3.004 μs   (2.935 μs .. 3.068 μs)
                     0.993 R²   (0.986 R² .. 0.997 R²)
mean                 2.982 μs   (2.873 μs .. 3.047 μs)
std dev              279.6 ns   (168.2 ns .. 502.6 ns)
variance introduced by outliers: 87% (severely inflated)

benchmarking Elem text 200
time                 20.58 μs   (20.14 μs .. 21.15 μs)
                     0.997 R²   (0.995 R² .. 0.999 R²)
mean                 20.56 μs   (20.35 μs .. 20.78 μs)
std dev              744.5 ns   (560.0 ns .. 1.013 μs)
variance introduced by outliers: 42% (moderately inflated)

benchmarking Optimized2 200
time                 20.34 μs   (19.54 μs .. 21.01 μs)
                     0.995 R²   (0.993 R² .. 0.998 R²)
mean                 19.56 μs   (19.31 μs .. 20.09 μs)
std dev              1.029 μs   (759.4 ns .. 1.328 μs)
variance introduced by outliers: 61% (severely inflated)

benchmarking Attoparsec 200
time                 14.25 μs   (13.94 μs .. 14.55 μs)
                     0.995 R²   (0.992 R² .. 0.997 R²)
mean                 14.38 μs   (13.87 μs .. 15.46 μs)
std dev              2.598 μs   (1.031 μs .. 4.709 μs)
variance introduced by outliers: 95% (severely inflated)

benchmarking Regex imerative 200
time                 2.531 μs   (2.297 μs .. 2.752 μs)
                     0.944 R²   (0.930 R² .. 0.962 R²)
mean                 2.487 μs   (2.305 μs .. 2.678 μs)
std dev              600.5 ns   (551.5 ns .. 667.1 ns)
variance introduced by outliers: 98% (severely inflated)

Benchmark validate_input_bench: FINISH

```

## Extra unpacking reduce operation speed in 6-7 times.  (From Text to String)

```
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
```
