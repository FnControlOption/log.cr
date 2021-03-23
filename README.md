# log.cr

A simple logging library implemented in Crystal (inspired by [`rxi/log.c`](https://github.com/rxi/log.c))

## Usage

**[log.cr](log.cr?raw=1)** provides 6 functions for logging:

```crystal
Log.trace(*objects)
Log.debug(*objects)
Log.info(*objects)
Log.warn(*objects)
Log.error(*objects)
Log.fatal(*objects)
```

For example:

```crystal
Log.trace("Hello world")
```

This results in a line with the given format printed to stderr:

```
20:18:26 TRACE /tmp/main.cr:11: Hello world
```

### Log.level

The current logging level can be set by changing the `Log.level` variable. All logs below the given level will not be written to `stderr`. By default the level is `Log::Level::Trace`, such that nothing is ignored.

### Log.use_color

If `Log.use_color` is set to `true` ANSI color escape codes will be used when printing.

## License

This library is free software; you can redistribute it and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.
