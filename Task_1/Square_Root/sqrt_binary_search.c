#include <stdio.h>

double sqrt_binary_search(double x, int max_iter ) {
    if (x < 0.0) {
        return -1.0;  // error case
    }

    if (x == 0.0 || x == 1.0) {
        return x; 
    }

    double low = 0.0;
    double high = (x >= 1.0) ? x : 1.0;
    double mid = 0.0;
    int i = 0;

    while ((high - low) > 1e-6 && i < max_iter) {
        mid = (low + high) / 2.0;

        if (mid * mid > x)
            high = mid;
        else
            low = mid;

        i++;
    }

    return (low + high) / 2.0;
}

int main() {
    double x;

    printf("Enter a number to find its square root: ");
    scanf("%lf", &x);

    double result = sqrt_binary_search(x, 100);

    if (result == -1.0)
        printf("Error: Cannot compute sqrt of a negative number.\n");
    else
        printf("Approximate sqrt(%.6f) = %.6f\n", x, result);

    return 0;
}

