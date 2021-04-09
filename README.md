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

## Mappings table

| Action                                  | Mapping         | Mode              |
| --------------------------------------- | --------------- | ----------------- |
| Save                                    | Ctrl + s        | Normal            |
| Undo                                    | Ctrl + z        | Normal            |
| Redo                                    | Ctrl + r        | Normal            |
| Copy selection                          | y               | Visual            |
| Copy the current line                   | Y               | Visual            |
| Cut selection                           | d               | Visual            |
| Cut the current line                    | D               | Visual            |
| Paste                                   | p               | Normal and Visual |
| Replicate current line                  | yy + p          | Normal            |
| Open new tab                            | leader key + t  | Normal            |
| Close current buffer                    | leader key + c  | Normal            |
| Navigate to the next tab                | Tab             | Normal            |
| Navigate to the previous tab            | Tab + Shift     | Normal            |
| Switch splitted window ↑                | ↑               | Normal and Visual |
| Switch splitted window ←                | ←               | Normal and Visual |
| Switch splitted window →                | →               | Normal and Visual |
| Switch splitted window ↓                | ↓               | Normal and Visual |
| Resize splitted window vertical up      | leader key + ↑  | Normal            |
| Resize splitted window vertical down    | leader key + ↓  | Normal            |
| Resize splitted window horizontal left  | leader key + ←  | Normal            |
| Resize splitted window horizontal right | leader key + →  | Normal            |
| Buffer navigation ←                     | leader key + q  | Normal            |
| Buffer navigation →                     | leader key + w  | Normal            |
| Format current buffer                   | leader key + f  | Normal            |
| C#: Sort usings                         | leader key + u  | Normal            |
| Go to definition                        | leader key + gd | Normal            |
| Go to type definition                   | leader key + gt | Normal            |
| Go to implementation                    | leader key + gi | Normal            |
| Go to references                        | leader key + gr | Normal            |
