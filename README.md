# Web log

## Useful commands

Run from `./weblog`:

- `stack exec site clean`
- `stack exec site build`
- `stack exec site watch`

## Encoding error

[Source](https://jaspervdj.be/hakyll/tutorials/faq.html)

If you get any of the errors:

```
commitBuffer: invalid argument (invalid character)
```

or:

```
hGetContents: invalid argument (Invalid or incomplete multibyte or wide
    character)
```

On Windows:

```
$> chcp 65001
```