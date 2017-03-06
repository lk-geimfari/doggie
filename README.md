# Doggie

[![Build Status](https://travis-ci.org/lk-geimfari/doggie.svg?branch=master)](https://travis-ci.org/lk-geimfari/doggie)
[![codecov](https://codecov.io/gh/lk-geimfari/doggie/branch/master/graph/badge.svg)](https://codecov.io/gh/lk-geimfari/doggie)

<p align="center">
<a href="https://github.com/lk-geimfari/doggie/">
  <img src="https://raw.githubusercontent.com/lk-geimfari/doggie/master/logo.png">
</a>
</p>

**Doggie** is a tiny library that provides the most commonly used regular expression patterns. This library can be useful when you don't want to write regular expression manually. You can use `doggie` in testing phase of your software. Doggie is a translate of [expynent](https://github.com/lk-geimfari/expynent) library to Elixir.


## Documentation
`Doggie` is simple to use, and the below examples should help you get started. Complete documentation for Doggie is available here: https://hexdocs.pm/doggie/


## Usage
Very simple example:
```elixir
def email(address) do
  case Regex.match?(Doggie.email(), address) do
    true  -> {:ok, :valid}
    false -> {:error, :invalid}
    _ -> {:some_other_stuff}
  end
end
```

## Installation

Package can be installed by adding `doggie` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:doggie, "~> 0.1.0"}]
end
```

## License
Doggie is licensed under the MIT License. See [LICENSE](https://github.com/lk-geimfari/doggie/blob/master/LICENSE) for more information.
