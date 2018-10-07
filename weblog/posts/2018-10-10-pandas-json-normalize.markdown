---
title: Pandas' json_normalize
author: me
pagename: Pandas & JSON
---

[Documentation page](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.io.json.json_normalize.html)

```
In [1]: data = [
   ...:     {'date': date(2016, 1, 2), 'ticket_purchases': [{ 'user_id': 5565, 'ticket_purchases': [{ 'quantity': 666.0, 'price': 42.0 }, { 'quantity': 555.0, 'price': 42.1 }]}]},
   ...:     {'date': date(2016, 2, 2), 'ticket_purchases': [{ 'user_id': 5565, 'ticket_purchases': [{ 'quantity': 666.0, 'price': 42.0 }, { 'quantity': 555.0, 'price': 42.1 }]}]},
   ...: ]

In [2]: pd.io.json.json_normalize(
    ...:     data,
    ...:     ['daily_purchases', 'ticket_purchases'],
    ...:     ['date', ['daily_purchases', 'user_id']]
    ...: ).rename(
    ...:     columns={'daily_purchases.user_id': 'user_id'}
    ...: ).set_index(['date', 'user_id'])
Out[2]:
                      price  quantity
date       user_id
2016-01-02 5565        42.0     666.0
           5565        42.1     555.0
2016-02-02 5565        42.0     666.0
           5565        42.1     555.0
```