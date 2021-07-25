```
Benchmark validate_input_bench: RUNNING...
benchmarking Elem text 10
time                 1.067 μs   (999.6 ns .. 1.151 μs)
                     0.972 R²   (0.961 R² .. 0.986 R²)
mean                 1.201 μs   (1.157 μs .. 1.235 μs)
std dev              130.0 ns   (97.06 ns .. 179.9 ns)
variance introduced by outliers: 90% (severely inflated)

benchmarking Optimized2 10
time                 891.4 ns   (846.2 ns .. 939.6 ns)
                     0.983 R²   (0.973 R² .. 0.993 R²)
mean                 928.1 ns   (893.8 ns .. 999.8 ns)
std dev              140.1 ns   (79.97 ns .. 236.5 ns)
variance introduced by outliers: 95% (severely inflated)

benchmarking Attoparsec 10
time                 761.8 ns   (725.7 ns .. 816.8 ns)
                     0.975 R²   (0.961 R² .. 0.986 R²)
mean                 835.1 ns   (793.6 ns .. 871.9 ns)
std dev              131.1 ns   (108.9 ns .. 157.1 ns)
variance introduced by outliers: 96% (severely inflated)

benchmarking Regex pcre 10
time                 2.803 μs   (2.724 μs .. 2.875 μs)
                     0.995 R²   (0.993 R² .. 0.997 R²)
mean                 2.769 μs   (2.710 μs .. 2.893 μs)
std dev              308.5 ns   (158.9 ns .. 518.6 ns)
variance introduced by outliers: 90% (severely inflated)

benchmarking Regex posix 10
time                 719.0 ns   (715.6 ns .. 723.4 ns)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 710.2 ns   (705.9 ns .. 714.8 ns)
std dev              14.49 ns   (11.55 ns .. 18.51 ns)
variance introduced by outliers: 25% (moderately inflated)

benchmarking Elem text 50
time                 4.830 μs   (4.760 μs .. 4.910 μs)
                     0.998 R²   (0.997 R² .. 0.999 R²)
mean                 4.925 μs   (4.863 μs .. 5.007 μs)
std dev              263.2 ns   (193.8 ns .. 405.9 ns)
variance introduced by outliers: 66% (severely inflated)

benchmarking Optimized2 50
time                 4.284 μs   (4.203 μs .. 4.370 μs)
                     0.997 R²   (0.996 R² .. 0.999 R²)
mean                 4.288 μs   (4.227 μs .. 4.386 μs)
std dev              259.0 ns   (163.4 ns .. 424.0 ns)
variance introduced by outliers: 71% (severely inflated)

benchmarking Attoparsec 50
time                 3.447 μs   (3.332 μs .. 3.592 μs)
                     0.988 R²   (0.976 R² .. 0.997 R²)
mean                 3.460 μs   (3.355 μs .. 3.690 μs)
std dev              468.5 ns   (193.1 ns .. 817.9 ns)
variance introduced by outliers: 93% (severely inflated)

benchmarking Regex pcre 50
time                 2.790 μs   (2.761 μs .. 2.831 μs)
                     0.998 R²   (0.998 R² .. 0.999 R²)
mean                 2.797 μs   (2.765 μs .. 2.828 μs)
std dev              114.9 ns   (103.7 ns .. 129.0 ns)
variance introduced by outliers: 54% (severely inflated)

benchmarking Regex posix 50
time                 2.435 μs   (2.429 μs .. 2.444 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 2.431 μs   (2.427 μs .. 2.442 μs)
std dev              25.42 ns   (10.46 ns .. 45.88 ns)

benchmarking Elem text 100
time                 8.679 μs   (8.581 μs .. 8.770 μs)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 8.595 μs   (8.518 μs .. 8.679 μs)
std dev              261.7 ns   (233.9 ns .. 319.8 ns)
variance introduced by outliers: 36% (moderately inflated)

benchmarking Optimized2 100
time                 8.110 μs   (7.969 μs .. 8.286 μs)
                     0.996 R²   (0.992 R² .. 0.999 R²)
mean                 8.216 μs   (8.109 μs .. 8.448 μs)
std dev              459.0 ns   (279.5 ns .. 757.2 ns)
variance introduced by outliers: 66% (severely inflated)

benchmarking Attoparsec 100
time                 6.404 μs   (6.284 μs .. 6.527 μs)
                     0.996 R²   (0.994 R² .. 0.998 R²)
mean                 6.528 μs   (6.367 μs .. 6.777 μs)
std dev              659.1 ns   (437.1 ns .. 1.224 μs)
variance introduced by outliers: 87% (severely inflated)

benchmarking Regex pcre 100
time                 2.612 μs   (2.338 μs .. 2.813 μs)
                     0.952 R²   (0.929 R² .. 0.978 R²)
mean                 2.600 μs   (2.430 μs .. 2.747 μs)
std dev              526.3 ns   (446.2 ns .. 596.0 ns)
variance introduced by outliers: 97% (severely inflated)

benchmarking Regex posix 100
time                 4.482 μs   (4.472 μs .. 4.494 μs)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 4.536 μs   (4.505 μs .. 4.618 μs)
std dev              188.8 ns   (38.07 ns .. 360.5 ns)
variance introduced by outliers: 53% (severely inflated)

benchmarking Elem text 200
time                 19.73 μs   (19.09 μs .. 20.60 μs)
                     0.991 R²   (0.987 R² .. 0.995 R²)
mean                 21.09 μs   (20.49 μs .. 21.67 μs)
std dev              1.871 μs   (1.652 μs .. 2.105 μs)
variance introduced by outliers: 82% (severely inflated)

benchmarking Optimized2 200
time                 19.77 μs   (18.59 μs .. 21.13 μs)
                     0.985 R²   (0.978 R² .. 0.994 R²)
mean                 19.68 μs   (19.23 μs .. 20.08 μs)
std dev              1.505 μs   (1.264 μs .. 1.938 μs)
variance introduced by outliers: 77% (severely inflated)

benchmarking Attoparsec 200
time                 14.27 μs   (13.59 μs .. 15.45 μs)
                     0.983 R²   (0.973 R² .. 0.995 R²)
mean                 14.19 μs   (13.75 μs .. 14.68 μs)
std dev              1.763 μs   (1.404 μs .. 2.345 μs)
variance introduced by outliers: 91% (severely inflated)

benchmarking Regex pcre 200
time                 2.980 μs   (2.899 μs .. 3.066 μs)
                     0.994 R²   (0.992 R² .. 0.995 R²)
mean                 3.066 μs   (2.993 μs .. 3.130 μs)
std dev              220.3 ns   (188.1 ns .. 244.4 ns)
variance introduced by outliers: 79% (severely inflated)

benchmarking Regex posix 200
time                 8.098 μs   (8.075 μs .. 8.127 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 8.097 μs   (8.086 μs .. 8.129 μs)
std dev              56.56 ns   (24.12 ns .. 113.8 ns)

Benchmark validate_input_bench: FINISH
```
