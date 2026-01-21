import timeit
import numpy as np

# Creating the matrices
n = 1024

# Creating first matrix
A = np.fromfunction(lambda i, j: 2*i + j, (n, n), dtype=int)

# Creating Second Matrix
B = np.fromfunction(lambda i, j: 3*j - 2*i + 5, (n, n), dtype=int)

# Starting counting time
start = timeit.default_timer()

# Finding product matrix
P = np.dot(A, B)

# Ending time count
end = timeit.default_timer()

# Printing time
print(f"Matrix multiplication through Numpy took {end - start:.6f} seconds")

