# NeoVim Configuration

Configuration and templates for NeoVim.

## Language Servers for code completion

Language servers of Json, HTML, TypeScript and C# are installed on the first **:PlugInstall**, but for C/C++ code completion require **ccls** installed on the system first:

Arch based distros:

```bash
sudo pacman -S ccls
```

Debian based distros:

```bash
sudo apt install ccls
```

Also is necesary to copy the file coc-settings.json to the folder ~/.config/nvim, or copy its content to the file opened by Nvim when we use the command: **:CocConfig**.

## Mappings table

| Action                | Mapping  | Mode              |
| --------------------- | -------- | ----------------- |
| Save                  | Ctrl + s | Normal            |
| Undo                  | Ctrl + z | Normal            |
| Redo                  | Ctrl + r | Normal            |
| Copy selection        | y        | Visual            |
| Copy the current line | Y        | Visual            |
| Cut selection         | d        | Visual            |
| Cut the current line  | D        | Visual            |
| Paste                 | p        | Normal and Visual |
