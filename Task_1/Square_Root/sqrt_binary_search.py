def sqrt(x, max_iter=100):
    if x < 0:
        raise ValueError("Invalid input; negative number")

    if x == 0 or x == 1:
        return x

    low = 0.0
    high = x if x >= 1.0 else 1.0
    iter = 0

    while (high - low) > 1e-6 and iter < max_iter:
        mid = (low + high) / 2.0
        square = mid * mid

        if square < x:
            low = mid
        else:
            high = mid

        iter += 1

    return mid


# --func calling ---
try:
    user_input = float(input("Enter a number to find its square root: "))
    result = sqrt(user_input)
    print(f"Approximate square root of {user_input} is {result}")
except ValueError as e:
    print("Error:", e)


