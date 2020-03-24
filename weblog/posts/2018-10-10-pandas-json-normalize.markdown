---
title: Pandas & JSON
author: me
---

# json_normalize

[Documentation page](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.io.json.json_normalize.html)

To transform nested JSON into a DataFrame, we can use `json_normalize` to describe how to unwrap the object.
The official documentation is not very clear on how to select data from nested dicts.
For example we have the following data:

```python
[{
  'date': '2016-01-01',
  'daily_purchases': [{
    'user_id': 4242,
    'ticket_purchases': [
      { 'quantity': 35, 'price': 42.0 },
      { 'quantity': 1337, 'price': 42.1 }]}, {
    'user_id': 5565,
    'ticket_purchases': [
      { 'quantity': 666.0, 'price': 42.0 },
      { 'quantity': 555.0, 'price': 42.1 }]}
  ]}, {
  'date': '2016-01-02',
  'daily_purchases': [{
    'user_id': 5565,
    'ticket_purchases': [
      { 'quantity': 666.0, 'price': 42.0 },
      { 'quantity': 555.0, 'price': 42.1 }]}]
}]
```

We can get a flat DataFrame with the purchase data per user in one function call:

```python
import pandas as pd

df = pd.io.json.json_normalize(
     data=data,                                            # dict-like object
     record_path=['daily_purchases', 'ticket_purchases'],  # the path to the data [1]
     meta=['date', ['daily_purchases', 'user_id']]         # metadata for each record [2]
)

df = df.rename(columns={'daily_purchases.user_id': 'user_id'})
```

The DataFrame will look like below:

```
   price  quantity  user_id        date
0   42.0      35.0     4242  2016-01-01
1   42.1    1337.0     4242  2016-01-01
2   42.0     666.0     5565  2016-01-01
3   42.1     555.0     5565  2016-01-01
4   42.0     666.0     5565  2016-01-02
5   42.1     555.0     5565  2016-01-02
```

[1] Here we pass a list of strings to be used as nested keys - we want data in `dict['daily_purchases']['ticket_purchases']`. This gives us the columns `price` and `quantity`.

[2] We can also use a nested list here to select columns from nested objects. In our example, this
gives us the columns `date` and `user_id`.
