make-pipe
=========

Makes pipes easier to use in makefiles by quitting and returning a nonzero exit status if any of the constituent commands return nonzero.

# Usage

Replace where you'd put a pipe with a string containing only the pipe character.

```
make-pipe echo 'heya' '|' cat '|' grep -Eo '[ea]'
# outputs:
# e
# a
```

# Examples

This was made for use in [a bioinformatics project](https://github.com/cosmicexplorer/mutation-optimizer).
