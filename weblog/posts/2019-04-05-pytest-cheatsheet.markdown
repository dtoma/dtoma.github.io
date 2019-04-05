---
title: Pytest cheatsheet
author: me
---

## SetUp/TearDown

We can use `yield` in pytest fixtures to emulate class-based tests SetUp/TearDown methods.
It works particularly well with decorators - the example below will run `test_foo` with a patched `module.function`, then reset the patched function after the test finishes:

```
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

## Testing logs

We can use the `caplog` fixture, then filter its output:

```
def test_my_logs(caplog):
    fixture = some_fixture()

    assert some_function() == some_result

    # filter by level
    info_logs = (
        logger, line
        for logger, level, line in caplog.record_tuples
        if level == logging.INFO)

    # filter by logger
    some_function_logs = (
        logger, line
        for logger, level, line in caplog.record_tuples
        if logger == 'some_module.some_function')

    # assert the logs are what we expected
    assert list(line for _, line in info_logs) == [
        'first message',
        'second_message',
        'third_message: %d' % fixture.id,
    ]
```
