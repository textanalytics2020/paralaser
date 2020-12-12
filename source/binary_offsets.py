import numpy as np

def binary_indices(path):
    indices = []
    with open(path, "rb") as f:
        i = 0
        for line in f:
            indices.append(i)
            i += len(line)
    return indices

indices = np.array(binary_indices("dev/input.txt"), dtype=np.int64)
with open("dev/input.ref.bin64", "wb") as f:
    indices.tofile(f)
