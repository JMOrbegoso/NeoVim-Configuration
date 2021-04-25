# NeoVim Configuration

Configuration and templates for NeoVim.

## Requirements

For the shared clipboard it is necessary to have **xclip** installed on the GNU/Linux system:

Arch based distros:

```bash
sudo pacman -S xclip
```

Debian based distros:

```bash
sudo apt install xclip
```

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

## Visual Theme

The theme One Half is installed in its dark and light modes, to switch between them just change the value of the variable:

Dark theme:

```vim-script
g:light_theme = 0
```

Light theme:

```vim-script
g:light_theme = 1
```

## Templates

Copy the folder **templates** to the folder ~/.config/nvim/ to use the templates, remember that each skeleton file name must follow the next pattern taken from vim-skeletons documentation:

`skeleton-name.<extra>.<filetype>`, for example:

- `skeleton.js` for Javascript files.
- `skeleton.angular.js` for Angular.js Javascript files.
- `skeleton.backbone.js` for Backbone.js Javascript files.
- `skeleton.jquery.js` for Jquery Javascript files.

### Avaliable templates

| Language | File Extension | Specification |
| -------- | -------------- | ------------- |
| C++      | cpp            | Cpp file      |
| C++      | h              | Header file   |
| C#       | cs             | Interface     |
| C#       | cs             | Test class    |
| C#       | cs             | Class         |
| C#       | cs             | Default       |

## Extra

### NERDTree file icons

In order to see the icons in the NERDTree file system explorer, the console needs to use a [Nerd font](https://github.com/ryanoasis/nerd-fonts#patched-fonts).

### Sort usings with OmniSharp

OmniSharp by default do not sort the usings in a cs file, you can change this by specifying it in the OmniSharp configuration file located on ~/.omnisharp/omnisharp.json adding the next values:

```json
{
  "FormattingOptions": {
    "OrganizeImports": true
  }
}
```

## Mapping tables

### Switch mode mappings

| Action                                             | Mapping        | From mode           | Switch to |
| -------------------------------------------------- | -------------- | ------------------- | --------- |
| Switch mode before the current cursor position     | i              | Normal              | Insert    |
| Switch mode after the current cursor position      | a              | Normal              | Insert    |
| Switch mode at the beginning of the line           | I              | Normal              | Insert    |
| Switch mode at the end of the line                 | A              | Normal              | Insert    |
| Insert a new line below the cursor and switch mode | o              | Normal              | Insert    |
| Insert a new line above the cursor and switch mode | O              | Normal              | Insert    |
| Toggle terminal                                    | Leader + t + e | Normal and Terminal | Normal    |
| Close Terminal mode                                | ESC            | Terminal            | Normal    |

### Basic mappings

| Action          | Mapping       | Mode   |
| --------------- | ------------- | ------ |
| Open start page | Leader + Home | Normal |
| Command history | Leader + y    | Normal |

### Basic write mappings

| Action                            | Mapping        | Mode              |
| --------------------------------- | -------------- | ----------------- |
| Save current buffer               | Ctrl + s       | Normal and Visual |
| Save all open buffers             | Leader + s     | Normal            |
| Undo                              | Ctrl + z       | Normal            |
| Redo                              | Ctrl + r       | Normal            |
| Copy selection                    | y              | Visual            |
| Copy the current line             | yy             | Visual            |
| Cut selection                     | d              | Visual            |
| Cut the current line              | dd             | Visual            |
| Paste after the cursor position   | p              | Normal            |
| Paste before the cursor position  | P              | Normal            |
| Comment / Uncomment code portion  | Leader + c + c | Normal and Visual |
| Go to the beginning of the buffer | gg             | Normal            |
| Go to the beginning of the buffer | Ctrl + Home    | Normal and Visual |
| Go to the end of the buffer       | Shift + g      | Normal            |
| Go to the end of the buffer       | Ctrl + End     | Normal and Visual |
| Select all the buffer content     | Ctrl + a       | Normal            |

### Markdown mappings

| Action                  | Mapping    | Mode   |
| ----------------------- | ---------- | ------ |
| Toggle Markdown preview | Leader + p | Normal |

### Buffer mappings

| Action               | Mapping    | Mode   |
| -------------------- | ---------- | ------ |
| Open new buffer      | Leader + t | Normal |
| Close current buffer | Leader + w | Normal |
| Buffer navigation ←  | Leader + ← | Normal |
| Buffer navigation →  | Leader + → | Normal |
| Search open buffer   | Leader + b | Normal |

### Splitted windows mappings

| Action                                  | Mapping        | Mode              |
| --------------------------------------- | -------------- | ----------------- |
| Open horizontal split window            | Leader + s + h | Normal            |
| Open vertical split window              | Leader + s + v | Normal            |
| Switch splitted window ↑                | ↑              | Normal and Visual |
| Switch splitted window ←                | ←              | Normal and Visual |
| Switch splitted window →                | →              | Normal and Visual |
| Switch splitted window ↓                | ↓              | Normal and Visual |
| Resize splitted window vertical up      | Leader + +     | Normal            |
| Resize splitted window vertical down    | Leader + -     | Normal            |
| Resize splitted window horizontal left  | +              | Normal            |
| Resize splitted window horizontal right | -              | Normal            |

### Code syntax mappings

| Action                   | Mapping        | Mode   |
| ------------------------ | -------------- | ------ |
| Format current buffer    | Leader + f     | Normal |
| Go to definition         | Leader + c + d | Normal |
| Go to type definition    | Leader + c + t | Normal |
| Go to implementation     | Leader + c + i | Normal |
| Go to references         | Leader + c + r | Normal |
| Go to the next error     | Leader + e + n | Normal |
| Go to the previous error | Leader + e + p | Normal |
| Rename symbol            | Leader + r + n | Normal |

### Git mappings

| Action                             | Mapping        | Mode   |
| ---------------------------------- | -------------- | ------ |
| Git log                            | Leader + g + l | Normal |
| Git status                         | Leader + g + s | Normal |
| Git diff                           | Leader + g + d | Normal |
| Git add current file               | Leader + g + w | Normal |
| Git add all files                  | Leader + g + a | Normal |
| Git reset                          | Leader + g + r | Normal |
| Git commit                         | Leader + g + c | Normal |
| Git pull                           | Leader + g + p | Normal |
| Git push origin                    | Leader + g + o | Normal |
| Git branch                         | Leader + g + b | Normal |
| Git checkout                       | Leader + g + k | Normal |
| Git undo last commit to stage area | Leader + g + u | Normal |

### File mappings

| Action                            | Mapping        | Mode   |
| --------------------------------- | -------------- | ------ |
| Open NERDTree in splitted windows | F2             | Normal |
| Toggle NERDTree                   | F3             | Normal |
| Find files on the directory       | Leader + f + z | Normal |
| Set working directory             | Leader + .     | Normal |
