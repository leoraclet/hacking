import math

import pandas as pd

df = pd.read_csv("orders.csv")

df = df.sort_values(by="date")

first_date = "2019-12-31"
second_date = "2023-01-01"
df = df[(df["date"] >= first_date) & (df["date"] < second_date)]

earn_through_discounts = 0
people = {}

for index, row in df.iterrows():
    seller = row["seller_id"]
    buyer = row["buyer_id"]

    if seller not in people:
        people[seller] = 10000

    people[seller] += row["price"] - (row["price"] * (row["discount"] / 100))
    if buyer not in people:
        people[buyer] = 10000
    people[buyer] -= row["price"] - (row["price"] * (row["discount"] / 100))

    earn_through_discounts += row["price"] * (row["discount"] / 100)

print(df.head())
res2 = math.floor(earn_through_discounts)
res1 = max(people, key=people.get)
res3 = len([k for k, v in people.items() if v < 0])
print("Hero{%s_%s_%s}" % (res1, res2, res3))

# people = {k: v for k, v in sorted(people.items(), key=lambda item: item[1])}
