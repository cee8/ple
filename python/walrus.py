import math

candidates = ['A', 'B', 'C']

if (offered := len(candidates)) != 3:
    raise ValueError(f"Expected 3 candidates, received {offered}")

for x in range(1000, 10000, 1000):
    print(x, log1 := math.log(x), log2 := math.log(log1), math.log(log2))
