```
Benchmark validate_input_bench: RUNNING...
benchmarking Elem text 10
time                 810.7 ns   (794.3 ns .. 839.0 ns)
                     0.991 R²   (0.986 R² .. 0.996 R²)
mean                 836.6 ns   (811.7 ns .. 900.2 ns)
std dev              131.0 ns   (65.12 ns .. 239.8 ns)
variance introduced by outliers: 96% (severely inflated)

benchmarking Optimized2 10
time                 673.3 ns   (651.4 ns .. 698.6 ns)
                     0.994 R²   (0.993 R² .. 0.996 R²)
mean                 649.2 ns   (638.0 ns .. 664.0 ns)
std dev              39.61 ns   (30.29 ns .. 49.16 ns)
variance introduced by outliers: 76% (severely inflated)

benchmarking Attoparsec 10
time                 598.6 ns   (593.2 ns .. 605.5 ns)
                     0.998 R²   (0.996 R² .. 0.999 R²)
mean                 605.0 ns   (596.8 ns .. 629.2 ns)
std dev              44.26 ns   (21.81 ns .. 73.96 ns)
variance introduced by outliers: 82% (severely inflated)

benchmarking Regex posix 10
time                 555.5 ns   (554.6 ns .. 556.4 ns)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 564.6 ns   (555.8 ns .. 588.4 ns)
std dev              52.62 ns   (2.843 ns .. 101.3 ns)
variance introduced by outliers: 88% (severely inflated)

benchmarking Regex TDFA 10
time                 807.5 ns   (789.9 ns .. 827.4 ns)
                     0.996 R²   (0.994 R² .. 0.998 R²)
mean                 803.1 ns   (791.7 ns .. 815.7 ns)
std dev              42.55 ns   (35.53 ns .. 53.48 ns)
variance introduced by outliers: 70% (severely inflated)

benchmarking Regex Pcre 10
time                 462.1 ns   (455.9 ns .. 470.1 ns)
                     0.997 R²   (0.993 R² .. 1.000 R²)
mean                 469.3 ns   (457.4 ns .. 520.0 ns)
std dev              68.82 ns   (11.33 ns .. 155.8 ns)
variance introduced by outliers: 95% (severely inflated)

benchmarking Elem text 50
time                 4.052 μs   (3.953 μs .. 4.206 μs)
                     0.994 R²   (0.989 R² .. 0.999 R²)
mean                 4.139 μs   (4.039 μs .. 4.265 μs)
std dev              404.6 ns   (323.0 ns .. 539.6 ns)
variance introduced by outliers: 87% (severely inflated)

benchmarking Optimized2 50
time                 3.676 μs   (3.563 μs .. 3.783 μs)
                     0.995 R²   (0.991 R² .. 0.999 R²)
mean                 3.636 μs   (3.594 μs .. 3.711 μs)
std dev              209.3 ns   (106.9 ns .. 345.2 ns)
variance introduced by outliers: 69% (severely inflated)

benchmarking Attoparsec 50
time                 2.909 μs   (2.838 μs .. 3.023 μs)
                     0.994 R²   (0.988 R² .. 0.999 R²)
mean                 3.025 μs   (2.845 μs .. 3.698 μs)
std dev              1.115 μs   (127.7 ns .. 2.357 μs)
variance introduced by outliers: 99% (severely inflated)

benchmarking Regex posix 50
time                 2.188 μs   (2.182 μs .. 2.195 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 2.190 μs   (2.180 μs .. 2.200 μs)
std dev              34.19 ns   (19.33 ns .. 46.76 ns)
variance introduced by outliers: 15% (moderately inflated)

benchmarking Regex TDFA 50
time                 3.516 μs   (3.406 μs .. 3.665 μs)
                     0.991 R²   (0.985 R² .. 0.996 R²)
mean                 3.600 μs   (3.510 μs .. 3.709 μs)
std dev              334.2 ns   (245.9 ns .. 454.3 ns)
variance introduced by outliers: 86% (severely inflated)

benchmarking Regex Pcre 50
time                 750.0 ns   (735.5 ns .. 771.2 ns)
                     0.992 R²   (0.984 R² .. 0.998 R²)
mean                 772.0 ns   (752.7 ns .. 796.8 ns)
std dev              81.25 ns   (51.96 ns .. 108.8 ns)
variance introduced by outliers: 90% (severely inflated)

benchmarking Elem text 100
time                 7.600 μs   (7.390 μs .. 7.882 μs)
                     0.994 R²   (0.990 R² .. 0.998 R²)
mean                 7.460 μs   (7.289 μs .. 7.903 μs)
std dev              897.5 ns   (394.4 ns .. 1.705 μs)
variance introduced by outliers: 91% (severely inflated)

benchmarking Optimized2 100
time                 6.885 μs   (6.768 μs .. 7.017 μs)
                     0.996 R²   (0.992 R² .. 0.998 R²)
mean                 7.093 μs   (6.922 μs .. 7.377 μs)
std dev              710.1 ns   (428.6 ns .. 1.079 μs)
variance introduced by outliers: 87% (severely inflated)

benchmarking Attoparsec 100
time                 5.505 μs   (5.411 μs .. 5.636 μs)
                     0.996 R²   (0.993 R² .. 0.998 R²)
mean                 5.494 μs   (5.408 μs .. 5.633 μs)
std dev              344.4 ns   (217.8 ns .. 485.6 ns)
variance introduced by outliers: 72% (severely inflated)

benchmarking Regex posix 100
time                 3.907 μs   (3.878 μs .. 3.939 μs)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 3.890 μs   (3.876 μs .. 3.905 μs)
std dev              53.42 ns   (43.02 ns .. 68.73 ns)
variance introduced by outliers: 11% (moderately inflated)

benchmarking Regex TDFA 100
time                 6.914 μs   (6.560 μs .. 7.129 μs)
                     0.992 R²   (0.990 R² .. 0.997 R²)
mean                 6.847 μs   (6.739 μs .. 6.990 μs)
std dev              438.2 ns   (347.9 ns .. 612.0 ns)
variance introduced by outliers: 72% (severely inflated)

benchmarking Regex Pcre 100
time                 1.073 μs   (1.066 μs .. 1.083 μs)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 1.069 μs   (1.063 μs .. 1.076 μs)
std dev              21.42 ns   (13.19 ns .. 30.70 ns)
variance introduced by outliers: 24% (moderately inflated)

benchmarking Elem text 200
time                 17.24 μs   (17.02 μs .. 17.50 μs)
                     0.998 R²   (0.997 R² .. 0.999 R²)
mean                 17.26 μs   (17.14 μs .. 17.49 μs)
std dev              555.6 ns   (412.4 ns .. 790.8 ns)
variance introduced by outliers: 37% (moderately inflated)

benchmarking Optimized2 200
time                 15.80 μs   (15.54 μs .. 16.02 μs)
                     0.998 R²   (0.997 R² .. 0.999 R²)
mean                 15.60 μs   (15.47 μs .. 15.96 μs)
std dev              700.9 ns   (425.7 ns .. 1.152 μs)
variance introduced by outliers: 54% (severely inflated)

benchmarking Attoparsec 200
time                 12.06 μs   (11.23 μs .. 12.84 μs)
                     0.967 R²   (0.946 R² .. 0.990 R²)
mean                 11.50 μs   (11.14 μs .. 12.19 μs)
std dev              1.646 μs   (1.200 μs .. 2.250 μs)
variance introduced by outliers: 93% (severely inflated)

benchmarking Regex posix 200
time                 7.709 μs   (7.523 μs .. 7.987 μs)
                     0.995 R²   (0.990 R² .. 0.999 R²)
mean                 7.622 μs   (7.515 μs .. 7.815 μs)
std dev              441.0 ns   (229.4 ns .. 675.7 ns)
variance introduced by outliers: 68% (severely inflated)

benchmarking Regex TDFA 200
time                 15.82 μs   (14.79 μs .. 16.83 μs)
                     0.979 R²   (0.968 R² .. 0.994 R²)
mean                 15.10 μs   (14.78 μs .. 15.61 μs)
std dev              1.474 μs   (997.8 ns .. 2.159 μs)
variance introduced by outliers: 85% (severely inflated)

benchmarking Regex Pcre 200
time                 1.817 μs   (1.782 μs .. 1.858 μs)
                     0.991 R²   (0.981 R² .. 0.999 R²)
mean                 1.883 μs   (1.815 μs .. 1.970 μs)
std dev              286.4 ns   (154.9 ns .. 402.0 ns)
variance introduced by outliers: 95% (severely inflated)

Benchmark validate_input_bench: FINISH
```
