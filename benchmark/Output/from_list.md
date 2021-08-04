```
Benchmark from_list: RUNNING...
benchmarking Text 10
time                 55.86 ns   (50.58 ns .. 61.24 ns)
                     0.884 R²   (0.783 R² .. 0.974 R²)
mean                 69.54 ns   (62.39 ns .. 85.66 ns)
std dev              35.26 ns   (17.08 ns .. 64.56 ns)
variance introduced by outliers: 100% (severely inflated)

benchmarking FromList Text 10
time                 778.2 ns   (765.9 ns .. 791.6 ns)
                     0.995 R²   (0.990 R² .. 0.998 R²)
mean                 819.8 ns   (790.9 ns .. 888.7 ns)
std dev              144.7 ns   (70.31 ns .. 268.1 ns)
variance introduced by outliers: 97% (severely inflated)

benchmarking Text 50
time                 270.7 ns   (257.8 ns .. 288.2 ns)
                     0.983 R²   (0.977 R² .. 0.993 R²)
mean                 271.3 ns   (265.7 ns .. 279.9 ns)
std dev              25.17 ns   (19.51 ns .. 34.99 ns)
variance introduced by outliers: 88% (severely inflated)

benchmarking FromList Text 50
time                 4.732 μs   (4.663 μs .. 4.830 μs)
                     0.997 R²   (0.996 R² .. 0.998 R²)
mean                 4.863 μs   (4.751 μs .. 4.964 μs)
std dev              370.4 ns   (283.3 ns .. 499.0 ns)
variance introduced by outliers: 79% (severely inflated)

benchmarking Text 100
time                 523.2 ns   (516.6 ns .. 533.9 ns)
                     0.997 R²   (0.992 R² .. 0.999 R²)
mean                 541.7 ns   (532.8 ns .. 559.5 ns)
std dev              41.25 ns   (24.51 ns .. 62.70 ns)
variance introduced by outliers: 83% (severely inflated)

benchmarking FromList Text 100
time                 10.12 μs   (9.403 μs .. 10.82 μs)
                     0.978 R²   (0.962 R² .. 0.995 R²)
mean                 9.937 μs   (9.674 μs .. 10.27 μs)
std dev              997.3 ns   (645.6 ns .. 1.442 μs)
variance introduced by outliers: 86% (severely inflated)

benchmarking Text 200
time                 1.159 μs   (1.094 μs .. 1.231 μs)
                     0.984 R²   (0.975 R² .. 0.992 R²)
mean                 1.069 μs   (1.041 μs .. 1.117 μs)
std dev              123.0 ns   (90.41 ns .. 157.2 ns)
variance introduced by outliers: 91% (severely inflated)

benchmarking FromList Text 200
time                 22.30 μs   (21.09 μs .. 23.96 μs)
                     0.948 R²   (0.926 R² .. 0.970 R²)
mean                 27.89 μs   (24.74 μs .. 32.46 μs)
std dev              10.48 μs   (8.260 μs .. 13.93 μs)
variance introduced by outliers: 99% (severely inflated)

benchmarking Text not similar
time                 338.3 ns   (325.7 ns .. 354.2 ns)
                     0.985 R²   (0.977 R² .. 0.992 R²)
mean                 367.3 ns   (351.6 ns .. 397.3 ns)
std dev              79.76 ns   (52.13 ns .. 121.9 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking FromList. Text not similar
time                 10.36 μs   (9.824 μs .. 11.16 μs)
                     0.976 R²   (0.958 R² .. 0.995 R²)
mean                 10.57 μs   (10.08 μs .. 13.08 μs)
std dev              3.009 μs   (1.277 μs .. 6.654 μs)
variance introduced by outliers: 98% (severely inflated)

benchmarking Text similar
time                 623.1 ns   (581.2 ns .. 698.8 ns)
                     0.937 R²   (0.842 R² .. 0.996 R²)
mean                 614.1 ns   (588.7 ns .. 712.4 ns)
std dev              140.4 ns   (46.37 ns .. 280.2 ns)
variance introduced by outliers: 98% (severely inflated)

benchmarking FromList. Text similar
time                 7.356 μs   (6.960 μs .. 7.674 μs)
                     0.985 R²   (0.981 R² .. 0.989 R²)
mean                 7.149 μs   (6.932 μs .. 7.387 μs)
std dev              852.2 ns   (668.8 ns .. 1.146 μs)
variance introduced by outliers: 90% (severely inflated)

Benchmark from_list: FINISH
```
