#!/usr/bin/env lua

local params = {...}
for key,value in pairs(params) do print(key, value) end

local sel_sc = params[1]

local colorschemes = {
  dracula = {
    kitty = "Dracula",
    alacritty = "dracula.yaml"
  },
  doom_one = {
    kitty = "Atom",
    alacritty = "doom_one.yml"
  },
  darcula = {
    kitty = "Jet Brains Darcula",
    alacritty = "darcula.yaml"
  },
  eighties_one_dark = {
    kitty = "Dark Pastel",
    alacritty = "dark_pastels.yaml"
  },
  gruvbox_dark_soft = {
    kitty = "Gruvbox Dark",
    alacritty = "gruvbox_dark.yaml"
  },
  gruvbox_light_soft = {
    kitty = "Gruvbox Light",
    alacritty = "gruvbox_light.yaml"
  },
  material_palenight = {
    kitty = "Oceanic Material",
    alacritty = "palenight.yml"
  },
  material = {
    kitty = "Material Dark",
    alacritty = "material_theme.yaml"
  },
  monokai_pro = {
    kitty = "Monokai Pro (filter Machine)",
    alacritty = "dark_pastels.yaml"
  },
  nord = {
    kitty = "Nord",
    alacritty = "nord.yaml"
  },
  oceanic_next = {
    kitty = "Oceanic Material",
    alacritty = "oceanic_next.yaml"
  },
  one_dark = {
    kitty = "One Dark",
    alacritty = "one_dark.yaml"
  },
  solarized_dark = {
    kitty = "Solarized Dark - Patched",
    alacritty = "solarized_dark.yaml"
  },
  solarized_light = {
    kitty = "Solarized Light",
    alacritty = "solarized_light.yaml"
  },
  tomorrow_night = {
    kitty = "Tomorrow Night Eighties",
    alacritty = "tomorrow_night.yaml"
  },
}

local found = false
for colorId,apps in pairs(colorschemes) do
  print(colorId, apps)
  if sel_sc == colorId then
    print(colorId.." [selected]")
    found = true
    for appId,cs in pairs(apps) do
      print(appId, cs)
      -- KITTY
      if appId == "kitty" then
        os.execute("kitty +kitten themes --reload-in=all "..cs)
      -- ALACRITTY
      elseif appId == "alacritty" then
        os.execute("alacritty-colorscheme -V apply "..cs)
      end
    end
    break
  end
end

if not found then
  print("No color scheme was selected. Choose available color scheme by input argument!")
else
  print("Color scheme is applied successufully.")
end
