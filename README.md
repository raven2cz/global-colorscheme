# global-colorscheme
Independent global colorscheme switcher for any GNU/Linux distribution. Main goal of this project is easy addition of an application for coloring and default/custom color schemes.

# Script Usage
Just make script executable and run it `global-colorscheme.lua [themeName]`. The theme will be changed for all supported applications which are installed in the station. These applications have to be installed and configured with appropriate supported themes, more descriptions are provided in the next chapter (how to configure it).

ThemeNames are unified for all applications. This parameter `themeName` checks directly in the script. Configuration with lua is trivial, you can very easily add your additional color schemes or add next applications. Just create fork of this project and extends the configuration. PR will be good too ;-)

# Supported Applications
## Kitty
* Link for theme url: https://sw.kovidgoyal.net/kitty/kittens/themes/
* First is necessary to install theme extension, which can be used for listing themes too and dynamically change it: `kitty +kitten themes`
* Script change which can be control by automatically
```bash
kitty +kitten themes --reload-in=all [ThemeName]
```
* Custom theme `.conf` has to be placed to `~/.config/kitty/themes`, this technique can be used for override the existed precompiled kitty themes from default theme folder. Kitty this custom folder uses with higher priority. The custom or overriden theme will be added and part of complete theme list.

## Alacritty
* URL link: https://github.com/toggle-corp/alacritty-colorscheme
* Install scheme switcher `paru -S alacritty-colorscheme`
* Install basic color schemes:

```bash
  # Colorschemes from from eendroroy/alacritty-theme
  REPO=https://github.com/eendroroy/alacritty-theme.git
  DEST="$HOME/.eendroroy-colorschemes"
  
  # Get colorschemes
  git clone $REPO $DEST
  # Create symlink at default colors location (optional)
  ln -s "$DEST/themes" "$HOME/.config/alacritty/colors"

  # Colorschemes from aaron-williamson/base16-alacritty
  REPO="https://github.com/aaron-williamson/base16-alacritty.git"
  DEST="$HOME/.aarors-williamson-colorschemes"

  # Get colorschemes
  git clone $REPO $DEST
  # Create symlink at default colors location (optional)
  ln -s "$DEST/colors" "$HOME/.config/alacritty/colors"
```
* Switch theme dynamically `alacritty-colorscheme -V apply [colorName]`
* Custom scheme is better to placed to separate directory `~/.config/alacritty/custom-colors`. After this is necessary to call command with additional parameter, see this `alacritty-colorscheme -C ~/.config/alacritty/custom-colors -V apply [colorName]`
