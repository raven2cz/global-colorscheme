# global-colorscheme
Independent global colorscheme switcher for any GNU/Linux distribution. Main goal of this project is easy addition of an application for coloring and default/custom color schemes.

# Script Usage
Just make script executable and run it `global-colorscheme.lua [themeName]`. The theme will be changed for all supported applications which are installed in the station. These applications have to be installed and configured with appropriate supported themes, more descriptions are provided in the next chapter (how to configure it).

ThemeNames are unified for all applications. This parameter `themeName` checks directly in the script. Configuration with lua is trivial, you can very easily add your additional color schemes or add next applications. Just create fork of this project and extends the configuration. PR will be good too ;-)

# Installation (optional)
You can start script `install.sh` presents in this repository. This script just copy `global-colorscheme.lua` to your `~/.local/bin`.

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

## Doom Emacs
* URL link: https://github.com/hlissner/doom-emacs
* Theme extensions are already installed.
* There is my settings of themes in the config.eld or config.org file

```emacs-lisp
(map! :leader
      :desc "Load new theme" "h t" #'counsel-load-theme)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-palenight)
;;(setq doom-theme 'doom-one)
(use-package doom-themes
   :config
   ;; Global settings (defaults)
   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t) ; if nil, italics is universally disabled
   (load-theme 'doom-one t)

   ;; Enable flashing mode-line on errors
   (doom-themes-visual-bell-config)
   ;; Enable custom neotree theme (all-the-icons must be installed!)
   (doom-themes-neotree-config)
   ;; or for treemacs users
   (doom-themes-treemacs-config)
   ;; Corrects (and improves) org-mode's native fontification.
   (doom-themes-org-config))

(setq doom-themes-treemacs-theme "doom-colors")
```
* `load-theme` section is replaced by global-colorscheme script. All schemeIds are supported by doom emacs.

## Atom
* URL link: https://atom.io/
* Backup your atom plugins with cli: `apm list --installed --bare > ~/.atom/package.list`
* Restore your atom plugins with cli: `apm install --packages-file ~/.atom/package.list`
* Inside this github project is attached `atom/package.list` for atom with all required colorthemes which are used with color script.
* Sometimes plugins are changes, it is very active repository. Just make fork and modify it and create PR for it.
* Add file `styles.less` to your `~/.atom` with this content

```css
.tree-view {
  font-size: 14px;
}
```
