# Dotfiles

I mostly use this to keep track of and store my own dotfiles, but you are welcome to use them or parts of them as well. Some files might depend on certain scripts in .local/bin/ or externam programs. All files are licensed under the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.txt).

## Installation instructions (experimental)
### Before installation:
 - Install `git` to clone this repo 
 - Build `yay` in order to install packages from the AUR
 - Install `zsh` and change your shell using `chsh`
 - Install Oh My ZSH from https://ohmyz.sh/

### Cloning dotfiles

```bash
cd $HOME
mkdir dotfiles
git clone --bare https://github.com/TriMill/dotfiles.git dotfiles
git --git-dir=dotfiles --work-tree=$HOME checkout
yay -S --needed --noconfirm $(cat PACKAGELIST)
```
Note: some packages may not install correctly, 

### After installation:
 - Change the value in `.Xresources` depending on your screen DPI (set to 96 for a 1080p display)
 - Install `zsh-syntax-highlighting` using [these instructions](https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95)
 - Configure `newsboat` with your desired RSS feeds
 - Set `$LOCATION` to your town/city name to get the weather
 - Add, remove, and modify anything to make it yours, use the `dotfiles` alias to run git commands on the dotfile repo
 - Change the origin of the dotfile repo so you can commit your own changes
