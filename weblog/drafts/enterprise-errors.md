
Errors inspired by real cases encountered in a professional or open source environment.

## Silent failures with find and atoi

```cpp
auto token = get_token_from_message();
// text_here_X_YYYYMMDD"
auto date_pos = token.find_last_of('W');
return atoi(&(token[date_pos]));
```

Unluckily for us, the token format was not guaranteed to remain the same over time.
One day, there was no 'W' in the token, meaning we atoi'd `std::basic_string::npos`.
After atoi silently returned 0, we tried to access an array using this value -1, and has a segmentation fault to go with our morning coffee.

How to avoid this:
- Checking that `find_last_of() != std::string::npos`
- Using `std::stoi` instead of atoi

## Padding matters

```cpp
char buf[32];
sprintf("%d.%d", seconds, microseconds);
```

This problem happened because the microseconds began with a 0.
Since we didn't specify the number of digits in the microseconds part of the string, we ended up with a string missing one character.
    

