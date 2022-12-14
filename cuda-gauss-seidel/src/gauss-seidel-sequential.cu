#include <stdio.h>
#include <stdlib.h>

#define MAX_ITER 100
#define MAX 100 // maximum value of the matrix element
#define ERROR 0.000001

// Generate a random float number with the maximum value of max
float rand_float(int max)
{
    return ((float)rand() / (float)(RAND_MAX)) * max;
}

// Allocate 2D matrix
void allocate_init_2Dmatrix(float ***mat, int n, int m)
{
    int i, j;
    *mat = (float **)malloc(n * sizeof(float *));
    for (i = 0; i < n; i++)
    {
        (*mat)[i] = (float *)malloc(m * sizeof(float));
        for (j = 0; j < m; j++)
            (*mat)[i][j] = rand_float(MAX);
    }
}

// solver
void solver(float ***mat, int n, int m)
{
    float diff = 0, temp;
    int done = 0, cnt_iter = 0, i, j;

    while (!done && (cnt_iter < MAX_ITER))
    {
        diff = 0;
        for (i = 1; i < n - 1; i++)
            for (j = 1; j < m - 1; j++)
            {
                temp = (*mat)[i][j];
                (*mat)[i][j] = 0.2 * ((*mat)[i][j] + (*mat)[i][j - 1] + (*mat)[i - 1][j] + (*mat)[i][j + 1] + (*mat)[i + 1][j]);
                diff += abs((*mat)[i][j] - temp);
            }
        if (diff / n / n < ERROR)
            done = 1;
        cnt_iter++;
    }

    if (done)
        printf("Convergiu após %d iterações\n", cnt_iter);
    else
        printf("Não convergiu após %d iterações\n", cnt_iter);
}

int main(int argc, char *argv[])
{
    int n, communication;
    float **a;

    if (argc < 2)
    {
        printf("Passe dois parâmetros: matrix_size communication \n");
        printf("\t matrix_size: Adicione 2 a uma potência de 2 (e.g. : 18, 1026)\n");

        exit(1);
    }

    n = atoi(argv[1]);
    printf("Tamanho da matriz = %d\n", n);

    allocate_init_2Dmatrix(&a, n, n);

    solver(&a, n, n);

    return 0;
}
