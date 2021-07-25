```
Benchmark validate_input_bench: RUNNING...
benchmarking Elem text 10
time                 852.7 ns   (811.5 ns .. 906.4 ns)
                     0.986 R²   (0.975 R² .. 0.997 R²)
mean                 823.7 ns   (805.9 ns .. 852.6 ns)
std dev              70.21 ns   (47.18 ns .. 108.4 ns)
variance introduced by outliers: 86% (severely inflated)

benchmarking Optimized2 10
time                 717.4 ns   (712.5 ns .. 723.2 ns)
                     0.999 R²   (0.998 R² .. 1.000 R²)
mean                 725.2 ns   (719.9 ns .. 731.7 ns)
std dev              21.06 ns   (16.80 ns .. 25.73 ns)
variance introduced by outliers: 40% (moderately inflated)

benchmarking Attoparsec 10
time                 677.3 ns   (667.0 ns .. 690.9 ns)
                     0.997 R²   (0.995 R² .. 0.998 R²)
mean                 670.2 ns   (659.4 ns .. 681.9 ns)
std dev              38.21 ns   (31.04 ns .. 47.75 ns)
variance introduced by outliers: 73% (severely inflated)

benchmarking Regex pcre 10
time                 2.365 μs   (2.067 μs .. 2.634 μs)
                     0.930 R²   (0.907 R² .. 0.958 R²)
mean                 2.329 μs   (2.145 μs .. 2.483 μs)
std dev              559.4 ns   (486.9 ns .. 645.8 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking Regex posix 10
time                 661.8 ns   (611.7 ns .. 734.5 ns)
                     0.952 R²   (0.933 R² .. 0.993 R²)
mean                 657.2 ns   (624.5 ns .. 714.8 ns)
std dev              134.1 ns   (84.17 ns .. 178.3 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking Elem text 50
time                 5.514 μs   (4.992 μs .. 6.144 μs)
                     0.947 R²   (0.929 R² .. 0.971 R²)
mean                 5.479 μs   (5.200 μs .. 6.045 μs)
std dev              1.336 μs   (841.5 ns .. 2.021 μs)
variance introduced by outliers: 98% (severely inflated)

benchmarking Optimized2 50
time                 4.558 μs   (4.331 μs .. 4.927 μs)
                     0.920 R²   (0.854 R² .. 0.971 R²)
mean                 6.017 μs   (5.449 μs .. 7.048 μs)
std dev              2.571 μs   (1.362 μs .. 3.781 μs)
variance introduced by outliers: 99% (severely inflated)

benchmarking Attoparsec 50
time                 3.564 μs   (3.386 μs .. 3.734 μs)
                     0.970 R²   (0.953 R² .. 0.984 R²)
mean                 3.916 μs   (3.712 μs .. 4.110 μs)
std dev              833.2 ns   (679.4 ns .. 964.5 ns)
variance introduced by outliers: 97% (severely inflated)

benchmarking Regex pcre 50
time                 1.569 μs   (1.547 μs .. 1.597 μs)
                     0.998 R²   (0.997 R² .. 0.999 R²)
mean                 1.565 μs   (1.535 μs .. 1.594 μs)
std dev              98.64 ns   (75.55 ns .. 128.2 ns)
variance introduced by outliers: 75% (severely inflated)

benchmarking Regex posix 50
time                 2.251 μs   (2.240 μs .. 2.266 μs)
                     0.997 R²   (0.991 R² .. 1.000 R²)
mean                 2.332 μs   (2.282 μs .. 2.510 μs)
std dev              287.2 ns   (64.10 ns .. 596.8 ns)
variance introduced by outliers: 92% (severely inflated)

benchmarking Elem text 100
time                 10.49 μs   (9.643 μs .. 11.38 μs)
                     0.968 R²   (0.947 R² .. 0.988 R²)
mean                 9.418 μs   (9.023 μs .. 9.865 μs)
std dev              1.502 μs   (1.149 μs .. 2.006 μs)
variance introduced by outliers: 94% (severely inflated)

benchmarking Optimized2 100
time                 9.365 μs   (8.946 μs .. 9.858 μs)
                     0.977 R²   (0.958 R² .. 0.991 R²)
mean                 9.207 μs   (8.850 μs .. 9.715 μs)
std dev              1.439 μs   (1.061 μs .. 1.992 μs)
variance introduced by outliers: 94% (severely inflated)

benchmarking Attoparsec 100
time                 7.130 μs   (6.671 μs .. 8.040 μs)
                     0.909 R²   (0.885 R² .. 0.937 R²)
mean                 8.868 μs   (8.391 μs .. 9.551 μs)
std dev              2.193 μs   (1.929 μs .. 2.589 μs)
variance introduced by outliers: 98% (severely inflated)

benchmarking Regex pcre 100
time                 1.807 μs   (1.609 μs .. 2.004 μs)
                     0.950 R²   (0.936 R² .. 0.999 R²)
mean                 1.658 μs   (1.611 μs .. 1.767 μs)
std dev              218.8 ns   (47.11 ns .. 361.6 ns)
variance introduced by outliers: 93% (severely inflated)

benchmarking Regex posix 100
time                 4.024 μs   (4.019 μs .. 4.030 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 4.027 μs   (4.022 μs .. 4.037 μs)
std dev              25.89 ns   (19.59 ns .. 36.89 ns)

benchmarking Elem text 200
time                 19.19 μs   (18.65 μs .. 20.20 μs)
                     0.988 R²   (0.985 R² .. 0.993 R²)
mean                 21.19 μs   (20.50 μs .. 21.76 μs)
std dev              1.986 μs   (1.781 μs .. 2.237 μs)
variance introduced by outliers: 83% (severely inflated)

benchmarking Optimized2 200
time                 19.37 μs   (18.44 μs .. 21.05 μs)
                     0.969 R²   (0.949 R² .. 0.989 R²)
mean                 21.73 μs   (20.89 μs .. 22.54 μs)
std dev              2.744 μs   (2.067 μs .. 3.995 μs)
variance introduced by outliers: 90% (severely inflated)

benchmarking Attoparsec 200
time                 13.00 μs   (12.78 μs .. 13.19 μs)
                     0.992 R²   (0.979 R² .. 0.998 R²)
mean                 13.52 μs   (13.13 μs .. 14.24 μs)
std dev              1.952 μs   (1.097 μs .. 3.606 μs)
variance introduced by outliers: 93% (severely inflated)

benchmarking Regex pcre 200
time                 3.014 μs   (2.975 μs .. 3.053 μs)
                     0.998 R²   (0.996 R² .. 1.000 R²)
mean                 3.019 μs   (2.966 μs .. 3.044 μs)
std dev              115.7 ns   (51.00 ns .. 216.8 ns)
variance introduced by outliers: 51% (severely inflated)

benchmarking Regex posix 200
time                 7.766 μs   (7.733 μs .. 7.799 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 7.767 μs   (7.745 μs .. 7.788 μs)
std dev              77.73 ns   (65.39 ns .. 97.72 ns)

Benchmark validate_input_bench: FINISH
```
