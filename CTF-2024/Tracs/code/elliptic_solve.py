import pandas as pd

from three_points_give_multiple_of_p import get_mult_p

# Load the data
data = pd.read_csv("points.csv", delimiter=";")
evilboy_point = data[data["login"] == "evilboy"]
print()
points = []

for i in range(len(data)):
    if data["login"][i] != "evilboy":
        points.append((int(data["x"][i]), int(data["y"][i])))

mulitples = []
for i in range(0, len(points) - 1, 2):
    mulitples.append(
        get_mult_p(
            points[i][0],
            points[i][1],
            points[i + 1][0],
            points[i + 1][1],
            int(evilboy_point["x"].values[0]),
            int(evilboy_point["y"].values[0]),
        )
    )

print(mulitples)
