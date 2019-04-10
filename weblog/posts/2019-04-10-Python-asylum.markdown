---
---

## Pylint

We have to use `pylint` because we don't have a compiler to catch our mistakes before running our code.

However, the tool is very slow: it first uses `astroid` to build an AST of our program, then runs the `pylint` checks.

Sometimes after an update the tool will suddenly be twice as slow, have bugs, forcing users to revert back to a previous version or figure out which combination of `astroid` & `pylint` should be used.

Looking at a flamegraph of `httpie`'s test run, we can see the overhead of pylint compared to the actual tests:


Makefile update:

```
diff --git a/Makefile b/Makefile
index c477abe..e9d753c 100644
--- a/Makefile
+++ b/Makefile
@@ -34,7 +34,7 @@ clean:
 
 test: init
        @echo $(TAG)Running tests on the current Python interpreter with coverage $(END)
-       py.test --cov ./httpie --cov ./tests --doctest-modules --verbose ./httpie ./tests
+       pyflame -x -o httpie_prof.txt -t py.test --cov ./httpie --cov ./tests --doctest-modules --verbose ./httpie ./tests
        @echo

```

Generating the flamegraph:

```
flamegraph.pl --title "pytest run for httpie" --width 1500 httpie_prof.txt > httpie_prof.svg
```

And then we still have to deal with people chosing different testing frameworks (unittest, pytest, nose), different ways to handle mocking, fixtures... it's a far cry from "There should be one-- and preferably only one --obvious way to do it.".

## Pip/requirements.txt

Between pip, pipenv, poetry, etc. who even know what's the proper way to deploy a python program. Compared to the deployment of a static binary...

## Type checking: mypy/pyre/...

Not event mature enough for production: doesn't work with numpy/pandas, tons of common libraries don't provide type hints.

