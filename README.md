# Jie Fu's MacOS env config setup as a computer student.

This repo is managed by `stow`, `stow` can manage all your config files in a single git repository. Below show how it works.

*Suppose you want to sync your `nvim` config files which should have the path `~/.config/nvim`, you just need to do the following steps:
 
1. create a `stow` folder which is used as your git repo. Suppose we make `.env_config` as the stow folder.
2. go into the stow folder, and create nvim folder: `mkdir -p nvim/.config/nvim`, the folder structure nvim/**.config/nvim** if very important, it allows you to **create a soft link called nvim under the .config folder in your system
3. create soft link of nvim config: run the command `stow nvim` inside your stow folder.
