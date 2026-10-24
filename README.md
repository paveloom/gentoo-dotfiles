# Configuration files for Gentoo

This repository is intended to be deployed in a place where all users can see
it. You can store it under your home directory as well, but that would require
the execute permission to be set for other users on the home directory.

Instead, here's an example of symlinking `/etc/config` to `~/dotfiles`:

```console
# mkdir /etc/config
# chown user:user /etc/config
# ln -s /etc/config /home/user/dotfiles
# chown user:user -h /home/user/dotfiles
```

Then, clone the repository as a regular user to `~/dotfiles`. Thus, you can
directly edit configuration files as a regular user and deploy them system-wide
via the `sync.bash` script.

Git mirrors:

- [Codeberg](https://codeberg.org/paveloom/gentoo-dotfiles)
- [GitHub](https://github.com/paveloom/gentoo-dotfiles)
- [GitLab](https://gitlab.com/paveloom-g/personal/gentoo/dotfiles)
