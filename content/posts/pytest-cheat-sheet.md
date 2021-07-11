---
title: Pytest cheat sheet
date: 2019-04-05
---

Some notes about the features I use the most from [pytest](https://docs.pytest.org/en/latest/).

<!--more-->

## SetUp/TearDown

We can use `yield` in pytest fixtures to emulate class-based tests SetUp/TearDown methods.
It works particularly well with decorators - the example below will run `test_foo` with a patched `module.function`, then reset the patched function after the test finishes:

```python
from unittest.mock import patch
import pytest

@pytest.fixture
def my_fixture():
    with patch('module.function', return_value=42)
        yield

@pytest.mark.usefixtures('my_fixture')
def test_foo():
    import module
    assert module.function() == 42
```

## Fixtures scope and autouse

Fixtures can have a scope that is one of:
- function
- class
- module
- package
- session (the whole test run)

With the `autouse` parameter, we can automatically load a function for all the tests in a module, for example:

```python
from mymodels import SomeModel

@django_db
@pytest.fixture(scope='module', autouse=True)
def fixture_populate_database():
    SomeModel.objects.create(foo='Bar')

def test_foo_is_bar():
    assert list(SomeModel.objects.values_list('foo')) == ['bar']
```

Sadly, we can't use session-level fixtures that require a database access. There is a [GitHub issue](https://github.com/pytest-dev/pytest-django/issues/514) open.

## Testing logs

We can use the `caplog` fixture, then filter its output:

```python
def test_my_logs(caplog):
    fixture = some_fixture()

    assert some_function() == some_result

    # filter by level and logger
    info_logs = [
        line
        for logger, level, line in caplog.record_tuples
        if level == logging.INFO and logger == 'some_module.some_function'
    ]

    # assert the logs are what we expected
    assert info_logs == [
        'first message',
        'second_message',
        'third_message: %d' % fixture.id,
    ]
```

## Parametrized tests

It can be useful to run a single test over multiple inputs. Using the `parametrize` decorator,
we can list inputs that we expect to succeed or fail.

```python
@pytest.mark.parametrize(
    "test_input,expected",
    [
        ("3+5", 8),
        ("2+4", 6),
        pytest.param("6*9", 42, marks=pytest.mark.xfail)
    ],
)
def test_eval(test_input, expected):
    assert eval(test_input) == expected
```