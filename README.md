# Dotfiles

I mostly use this to keep track of and store my own dotfiles, but you are welcome to use them or parts of them as well. Some files might depend on certain scripts in .local/bin/ or externam programs. All files are licensed under the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.txt).

## Installation instructions (experimental)
Before installation:
 - install `git` to clone this repo 
 - build `yay` in order to install packages from the AUR
 - install `zsh` and change your shell using `chsh`
 - install Oh My ZSH from https://ohmyz.sh/
From your $HOME directory:
```bash
mkdir dotfiles
git clone --bare https://github.com/TriMill/dotfiles.git dotfiles
git --git-dir=dotfiles --work-tree=$HOME checkout
yay -S --needed --noconfirm $(cat PACKAGELIST)
```
