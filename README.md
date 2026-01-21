**ES 336 – Assignment 1**
**Performance Analysis of Matrix Multiplication**

This repository contains Assignment–1 for the course ES 336: Computer Organization and Architecture at IIT Gandhinagar.

The objective of this assignment is to study how the execution time of the same matrix multiplication program varies based on:

1. Programming language (C vs Python)
2. Compiler optimization levels
3. Use of optimized numerical libraries (NumPy)
4. Underlying machine-level behavior

**Problem Overview**

A fixed-size matrix multiplication program (N = 1024) is implemented and executed using:

1. C (baseline, no optimization)
2. C with compiler optimizations (-O2, -O3)
3. Python using explicit nested loops
4. Python using NumPy (np.dot)

Execution times are measured using the Linux time command and in-code timers, and results are analyzed using concepts from Computer Organization, such as:

1. CPU time
2. User vs system time
3. Instruction-level optimizations
4. Compiler behavior

**--> Reference Commands for Linux:**

**1. Baseline (no optimization):**
gcc -E Matrix_multiplication.c > Matrix_multiplication.i
   
**2. Optimization Level O2:**
gcc -O2 Matrix_multiplication.c -o mm_O2

**3. Optimization Level O3:**
gcc -O3 Matrix_multiplication.c -o mm_O3
   
**4. Pre Processed File:**
gcc -E Matrix_multiplication.c > Matrix_multiplication.i
   
**5. Assembly File:**
Baseline: gcc -S Matrix_multiplication.c
O2: gcc -O2 -S Matrix_multiplication.c
O3: gcc -O3 -S Matrix_multiplication.c

**6. Running Binary Executable Files in C:**
./mm_O0
./mm_O2
./mm_O3

**7. Measuring Executation Time:**
time ./mm_O0
time ./mm_O2
time ./mm_O3

**8. Running Python Programs:**
time python3 Matrix_multiplication.py
time python3 Matrix_multiplication_numpy.py

**9. CPU and System Information:**
lscpu
