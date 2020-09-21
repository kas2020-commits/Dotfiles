### Linux configuration files and settings

A simple set of configuration files to be used on an xdg compliant user
filesystem. It uses GNU Stow to produce symbolic links of the config files to
the expected location in the system. This allows for a very quick and effective
method of having version control of dotfiles while keeping deployability at
maximum.

To install:
```
$ ./install
```

Make sure GNU Stow is installed and set in the system **PATH**
