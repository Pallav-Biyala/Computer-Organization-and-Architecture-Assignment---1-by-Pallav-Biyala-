#include <stdio.h>
#include <stdlib.h> // to use malloc
#include <time.h> // to find time the whole program took to run

// Since matrix size is huge n*n, we must use dynamic memory allocation
int** create_matrix(int n){
    int **M = (int **)malloc(n*sizeof(int*));
    for (int i = 0; i<n; ++i){
        M[i] = (int*) malloc(n*sizeof(int));
    }
    return M;
}

// Freeing memory
void free_memory(int** M, int n){
    for (int i = 0; i<n; ++i){
        free(M[i]);
    }
    free(M);
}

int main()
{
    // Creating two square matrices of N*N where N is atleast 1024
    int n = 1024;

    // Matrix 1: M where mij = 2*i+j (example)
    int** M = create_matrix(n);
    // Adding values to the matrices
    for (int i = 0; i<n; ++i){
        for (int j = 0; j<n;++j){
            M[i][j] = 2*i + j; // each entry is 2*i+j
        }
    }

    // Matrix 2: N where nij = 3*j - 2*i + 5 (just example)
    int** N = create_matrix(n);
    for (int i = 0; i<n; ++i){
        for (int j = 0; j<n;++j){
            N[i][j] = 3*j - 2*i + 5;
        }
    }

    // Now finding product
    // Creating matrix that would contain product
    int** P = create_matrix(n);

    // Measuring time it took to run the code:
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);

    // Finding product of two matrix:
    for (int i = 0; i<n; ++i){ // loops through row of first matrix
        for (int j = 0; j<n;++j){ // loops through column if second matrix
            P[i][j] = 0; // as we didnt initialize it so to avoid garbage values
            for (int k = 0; k<n;++k){ // sum product of matrix row and column
                P[i][j] += M[i][k]*N[k][j];
            }
        }
    }

    // Ending the time
    clock_gettime(CLOCK_REALTIME, &end);
    
    // Calculating time it took to run the code
    double time_elapsed = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;


    // Printing the time
    printf("Matrix Multiplication of two N*N matrix took %.6f seconds where N = %d\n", time_elapsed, n);
    
    // Freeing memory
    free_memory(M,n);
    free_memory(N,n);
    free_memory(P,n);
    return 0;
}

