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

## Spell checking

Using Aspell.

May work better with Markdown once it's updated to the version mentioned in [this PR](https://github.com/GNUAspell/aspell/issues/536).

## Broken links

CI runs a short `wget` command to find broken links.