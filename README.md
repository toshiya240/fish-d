# fish-d

change to a recently visited directory with [fzf]

## Install

With [fisherman]

```
fisher toshiya240/fish-d
```

## FZF binary

This plugin will fail if the `fzf` binary is not detected in your `PATH`.

The recommended means of installing `fzf` is through your respective package managers.

## Usage

```fish
d [dir]
```

## Configuring zi

There is command that let you modify the behaviour of `zi`:

```fish
set -U D_AUTO_CMD    eval after cd if defined
```
[fisherman]: https://github.com/fisherman/fisherman
[fzf]: https://github.com/junegunn/fzf
