```
Benchmark pack_overhead_bench: RUNNING...
benchmarking Generic show: Status Register
time                 15.49 ns   (15.44 ns .. 15.55 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 15.51 ns   (15.49 ns .. 15.55 ns)
std dev              106.4 ps   (82.00 ps .. 150.7 ps)

benchmarking Unpack from Text to String: Status Register
time                 134.9 ns   (120.9 ns .. 147.6 ns)
                     0.933 R²   (0.890 R² .. 0.977 R²)
mean                 132.6 ns   (124.1 ns .. 149.2 ns)
std dev              39.15 ns   (26.11 ns .. 60.98 ns)
variance introduced by outliers: 99% (severely inflated)

benchmarking Generic show: Status Observing
time                 17.31 ns   (17.25 ns .. 17.38 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 17.35 ns   (17.27 ns .. 17.43 ns)
std dev              299.0 ps   (213.4 ps .. 429.6 ps)
variance introduced by outliers: 24% (moderately inflated)

benchmarking Unpack from Text to String: Status Observing
time                 124.6 ns   (120.7 ns .. 128.6 ns)
                     0.990 R²   (0.985 R² .. 0.993 R²)
mean                 126.3 ns   (122.4 ns .. 133.1 ns)
std dev              14.30 ns   (12.22 ns .. 18.48 ns)
variance introduced by outliers: 92% (severely inflated)

Benchmark pack_overhead_bench: FINISH
```
