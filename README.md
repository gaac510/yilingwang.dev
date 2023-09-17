Rebuild of ~~Evangelion~~ *yilingwang.dev*.

# Background

Building and deploying your own webapp is surely a good way to learn.

# Available Utilities

## Use `eslint-config-prettier` to check for ESLint rules that conflicts with Prettier

See: https://github.com/prettier/eslint-config-prettier#cli-helper-tool

# Next.js usage

## App Router: Use parallel routes to define multi-slots content

For example, for each path, to define both a header section and a main section
that could be placed at arbitrary locations in a common layout, define a
`@header` slot at the layout level, then map each path in the slot, and write
the header component in `@header/<path>/page.tsx`.

The downside to this is that contents for the same page are spread across the
project source code.