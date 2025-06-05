def exp_taylor(x, terms ):
    result = 1.0  
    numerator = 1.0  # x^i
    denominator = 1.0  # i!

    for i in range(1, terms):
        numerator *= x  # for x^i
        denominator *= i  #its for i!
        result += numerator / denominator

    return result


# ----------- Main Program -----------

try:
    x = float(input("Enter the value of x for e^x: "))
    
  
    terms_input = input("Enter number of terms in the series (default is 20): ")
    terms = int(terms_input) if terms_input else 20

    if x < 0:
        approx = 1 / exp_taylor((-1)*x, terms)
    else:
        approx = exp_taylor(x, terms)

    print(f"exp({x}) ~ {approx}")

except ValueError:
    print("Invalid input! Please enter numeric values only.")


