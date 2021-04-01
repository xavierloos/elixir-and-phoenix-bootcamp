# Identicon

Will randomly generety and image/avatar

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/identicon](https://hexdocs.pm/identicon).

## Mockups

This will randoly generatr an avatar profile for the user

<img src="img/design.png" width="50%" alt="Desing">

Each identicon/avatar should NOT be randonly generated unless is the first time.

<img src="img/mirror.png" width="50%" alt="Mirror">

Once it's generated will always return the same identicon for the same user

<img src="img/identicon.png" width="50%" alt="Identicon">

Flow of the application

<img src="img/flow.png" width="50%" alt="Flow">

## Generation process

We will get a string and we'll pass it to a series of individual functions and organize them toguether to return an image.

<img src="img/process.png" width="50%" alt="Flow">