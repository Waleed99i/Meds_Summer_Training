#include <stdio.h>


double exp_taylor(double x, int terms) {
    double result = 1.0;     
    double numerator = 1.0;  // x^i
    double denominator = 1.0; // i!

    for (int i = 1; i < terms; i++) {
        numerator *= x;       // x^i
        denominator *= i;     // i!
        result += numerator / denominator;
    }

    return result;
}


int main() {
    double x;
    int terms;
    double approx;

    printf("Enter the value of x for e^x: ");
    if (scanf("%lf", &x) != 1) {
        printf("Invalid input! Please enter a numeric value for x.\n");
        return 1;  // Exit with error
    }

    printf("Enter number of terms (default is 20, enter 0 to use default): ");
    if (scanf("%d", &terms) != 1 || terms < 0) {
        printf("Invalid input! Please enter a positive integer for terms.\n");
        return 1;
    }

    // If user enters 0, use default 20 terms
    if (terms == 0)
        terms = 20;

    // Handle negative x
    if (x < 0) {
        approx = 1.0 / exp_taylor(-x, terms);
    } else {
        approx = exp_taylor(x, terms);
    }

    printf("exp(%.2lf) ~ %.10lf\n", x, approx);

    return 0;
}

