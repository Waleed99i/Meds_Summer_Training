def sqrt(x, max_iter=100 ):
    if x < 0:
        raise ValueError("Invalid input ; neg num")

    if x == 0 or x == 1:
        return x


    low = 0.0
    high = x if x >= 1.0 else 1.0
    iter = 0

    while (high - low) > 1e-6 and iter < max_iter:
        mid = (low + high) / 2.0
        square = mid * mid
        if abs(square - x) <= 1e-6:
            return mid
        elif square < x:
            low = mid
        else:
            high = mid
        iter += 1

    return mid



print(sqrt(25))     
print(sqrt(16))
#print(sqrt(-45))     



