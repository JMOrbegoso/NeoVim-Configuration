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

| Action                                  | Mapping            | Mode              |
| --------------------------------------- | ------------------ | ----------------- |
| Save                                    | Ctrl + s           | Normal            |
| Undo                                    | Ctrl + z           | Normal            |
| Redo                                    | Ctrl + r           | Normal            |
| Copy selection                          | y                  | Visual            |
| Copy the current line                   | Y                  | Visual            |
| Cut selection                           | d                  | Visual            |
| Cut the current line                    | D                  | Visual            |
| Paste                                   | p                  | Normal and Visual |
| Replicate current line                  | yy + p             | Normal            |
| Open new buffer                         | Leader key + t     | Normal            |
| Close current buffer                    | Leader key + c     | Normal            |
| Buffer navigation ←                     | Leader key + q     | Normal            |
| Buffer navigation →                     | Leader key + w     | Normal            |
| Search open buffer                      | Leader key + b     | Normal            |
| Switch splitted window ↑                | ↑                  | Normal and Visual |
| Switch splitted window ←                | ←                  | Normal and Visual |
| Switch splitted window →                | →                  | Normal and Visual |
| Switch splitted window ↓                | ↓                  | Normal and Visual |
| Resize splitted window vertical up      | Leader key + ↑     | Normal            |
| Resize splitted window vertical down    | Leader key + ↓     | Normal            |
| Resize splitted window horizontal left  | Leader key + ←     | Normal            |
| Resize splitted window horizontal right | Leader key + →     | Normal            |
| Format current buffer                   | Leader key + f     | Normal            |
| Go to definition                        | Leader key + c + d | Normal            |
| Go to type definition                   | Leader key + c + t | Normal            |
| Go to implementation                    | Leader key + c + i | Normal            |
| Go to references                        | Leader key + c + r | Normal            |
| Git log                                 | Leader key + g + l | Normal            |
| Git status                              | Leader key + g + s | Normal            |
| Git diff                                | Leader key + g + d | Normal            |
| Git add current file                    | Leader key + g + w | Normal            |
| Git add all files                       | Leader key + g + a | Normal            |
| Git reset                               | leader key + g + r | Normal            |
| Git commit                              | Leader key + g + c | Normal            |
| Git pull                                | Leader key + g + p | Normal            |
| Git push origin                         | Leader key + g + o | Normal            |
| Git branch                              | leader key + g + b | Normal            |
| Git checkout                            | leader key + g + k | Normal            |
| Git undo last commit to stage area      | leader key + g + u | Normal            |
