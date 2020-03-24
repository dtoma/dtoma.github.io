---
title: Simple Code by Example
---

When writing a new bit of code, my priorities are:

- keep the code short
- make it easy to debug
- make it easy to test (test multiple cases, test runs fast, test is reliable)

*Note: I am assuming `pytest` and `pandas` are imported in the code samples below.*

## An example

```python
def a_function(*args, **kwargs):
    return (
        fetch_data_from_rest_api(...)
        .groupby('baz')[['foo', 'bar']].sum()
        .join(fetch_data_from_db(...), how='inner')
    )
```

I can't inspect the data returned by `fetch_data_from_rest_api` or `fetch_data_from_db`, or compare the data before/after the `groupby` or the `join`.

I also need to patch two function calls when writing the test:

```python
@patch('a_module.fetch_data')
@patch('a_module.fetch_more_data')
def test_a_function(mock_fetch_data, mock_fetch_more_data):
    mock_fetch_data.return_value = pd.DataFrame(...)
    mock_fetch_more_data.return_value = pd.DataFrame(...)
    df = a_function(...)
    assert_frame_equal(df.shape, pd.DataFrame(...))
```

It gets worse if I want to test multiple cases at once:

```python
@patch('a_module.fetch_data')
@patch('a_module.fetch_more_data')
@parametrize('rest_data,db_data,expected', [
    (pd.DataFrame(...), pd.DataFrame(...), pd.DataFrame(...)),
    (pd.DataFrame(...), pd.DataFrame(...), pd.DataFrame(...)),
])
def test_a_function(mock_fetch_data, mock_fetch_more_data, rest_data, db_data, expected):
    mock_fetch_data.return_value = rest_data
    mock_fetch_more_data.return_value = db_data
    df = a_function(...)
    assert_frame_equal(df.shape, expected)
```

## Separating data and logic

We can make the function easier to test by giving it the data as arguments:

```python
def a_function(rest_data, db_data):
    data = rest_data.groupby('baz')[['foo', 'bar']].sum()
    data = data.join(db_data, how='inner')    
    return data
```

It also becomes easier to use a tool like [hypothesis](https://hypothesis.works/) to write tests:

```python
@given(data_frames(column('foo', ...), column('bar', ...), column('baz', ...)))
@given(data_frames(column('asdf', ...), column('baz', ...)))
def test_a_function(rest_data, db_data):
    df = a_function(rest_data, db_data)
    assert df.columns == [...]
    assert df.shape == (365, 2)
    assert (df[x] < df[y] < df[z]>).all()
```

## Sources

- http://mauveweb.co.uk/posts/2014/09/every-mock-patch-is-a-little-smell.html
- https://hernantz.github.io/mock-yourself-not-your-tests.html
