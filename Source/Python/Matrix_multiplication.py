import timeit

# Creating the matrices
n = 1024

# Creating first matrix
A = [[0 for _ in range(n)] for _ in range(n)]
for i in range(0,n):
    for j in range(0,n):
        A[i][j] = 2*i+j

# Creating second matrix
B = [[0 for _ in range(n)] for _ in range(n)]
for i in range(0,n):
    for j in range(0,n):
        B[i][j] = 3*j - 2*i + 5
    
# Finding product matrix
P = [[0 for _ in range(n)] for _ in range(n)]

# Starting counting time
start = timeit.default_timer()

for i in range(n):
    for j in range(n):
        for k in range(n):
            P[i][j] += A[i][k]*B[k][j]

# Ending time count
end = timeit.default_timer()

# Printing time
print(f"Matrix multiplication took {end - start:.6f} seconds")

