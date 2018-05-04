```python
# main.py

def my_add(a, b):
    """Add two numbers together."""
    return sum([a, b])
```

```python
# test_add.py

import main


def test_add():
    assert main.my_add(1, 2) == 3
```

```python
# test_add_fail.py

import main


def test_add():
    assert main.my_add("foo", "bar") == "foobar"
```

# Coverage is not enough

```
$> pytest --cov=main test_add.py
======================== test session starts ========================
platform linux -- Python 3.5.1, pytest-3.5.1, py-1.5.3, pluggy-0.6.0
rootdir: /home/dtoma/lab/python/cvrg, inifile:
plugins: cov-2.5.1
collected 1 item

test_add.py .                                                   [100%]

----------- coverage: platform linux, python 3.5.1-final-0 -----------
Name      Stmts   Miss  Cover
-----------------------------
main.py       2      0   100%


====================== 1 passed in 0.02 seconds ======================
```

So far, so good.

However:

```
$> pytest --cov=main test_add_fail.py
======================== test session starts ========================
platform linux -- Python 3.5.1, pytest-3.5.1, py-1.5.3, pluggy-0.6.0
rootdir: /home/dtoma/lab/python/cvrg, inifile:
plugins: cov-2.5.1
collected 1 item

test_add_fail.py F                                            [100%]

============================= FAILURES =============================

_____________________________ test_add _____________________________

    def test_add():
>       assert main.my_add("foo", "bar") == "foobar"

test_add_fail.py:5:
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

a = 'foo', b = 'bar'

    def my_add(a, b):
        """Add two numbers together."""
>       return sum([a, b])
E       TypeError: unsupported operand type(s) for +: 'int' and 'str'

main.py:3: TypeError

----------- coverage: platform linux, python 3.5.1-final-0 -----------
Name      Stmts   Miss  Cover
-----------------------------
main.py       2      0   100%

======================= 1 failed in 0.02 seconds ======================
```

In order to know that our code is right, we also need typing.
