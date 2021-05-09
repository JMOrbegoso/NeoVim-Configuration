# NeoVim Configuration

Configuration and templates for NeoVim.

## Requirements

For the shared clipboard it is necessary to have **xclip** installed
on the GNU/Linux system:

**Arch based distros:**

```bash
sudo pacman -S xclip
```

**Debian based distros:**

```bash
sudo apt install xclip
```

## Font

To use the icons in the NERDTree file system explorer and others,
the terminal emulator must use a Nerd Font.

You can download a NerdFont from:
[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads).

To install it on a Linux system you must copy the unzipped font folder
to the folder `usr/share/fonts/` and refresh the fonts cache with the command:

```bash
 fc-cache -f -v.
```

After that, you just need to set that nerd font in the settings of the terminal emulator
you are using, like xfce-terminal, Konsole, etc.

## Language Servers for code completion

Language servers of Json, HTML, TypeScript and C# are installed
on the first **:PlugInstall**, but for C/C++ code completion require **ccls**
installed on the system first:

**Arch based distros:**

```bash
sudo pacman -S ccls
```

**Debian based distros:**

```bash
sudo apt install ccls
```

Also is necesary to copy the file coc-settings.json to the folder
`~/.config/nvim`, or copy its content to the file opened by Nvim
when we use the command:

```vim-script
:CocConfig
```

## Visual Theme

To switch between dark and light themes just change the value of the variable:

**Dark theme:**

```vim-script
g:light_theme = 0
```

**Light theme:**

```vim-script
g:light_theme = 1
```

## Templates

Copy the folder **templates** to the folder `~/.config/nvim/` to use the templates,
remember that each skeleton file name must follow the next pattern taken
from vim-skeletons documentation:

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

## Debug

The plugin Vimspector is used to graphical debug,
to use it,
after open NeoVim and install all the plugins,
use the following command to install the debugging
requirements in the available languages:

```vim-script
:VimspectorInstall
```

### Vimspector parameters file

The Vimspector plugin require a parameters file to debug a project,
just create a **.vimspector.json** file using the available templates
for that and customize it according the project properties.

#### Default C++ .vimspector.json file

In the case of C++ projects, you can use a default vimspector.json file,
to use it, just copy the file `src/vimspector/vimspector.cpp.json` to
`~/.config/nvim/plugged/vimspector/configurations/linux/cpp/`.

### C++ debug requirements

Before debug any C++ project, first install **gdb**:

Arch based distros:

```bash
sudo pacman -S gdb
```

Debian based distros:

```bash
sudo apt install gdb
```

### Update the debug gadgets

To update the gadgets to the latest supported versions you can use the command:

```vim-script
:VimspectorUpdate
```

## Extra

### Sort usings with OmniSharp

OmniSharp by default do not sort the usings in a cs file,
you can change this by specifying it in the OmniSharp configuration file
located on `~/.omnisharp/omnisharp.json` adding the next values:

```json
{
  "FormattingOptions": {
    "OrganizeImports": true
  }
}
```

## Mapping tables

### Switch mode mappings

| Action                             | Mapping        | From     | To       |
| ---------------------------------- | -------------- | -------- | -------- |
| Before the current cursor position | i              | Normal   | Insert   |
| After the current cursor position  | a              | Normal   | Insert   |
| Beginning of the line              | I              | Normal   | Insert   |
| End of the line                    | A              | Normal   | Insert   |
| New line below the cursor          | o              | Normal   | Insert   |
| New line above the cursor          | O              | Normal   | Insert   |
| Toggle terminal                    | Leader + t + e | Normal   | Terminal |
| Toggle terminal                    | Leader + t + e | Terminal | Normal   |
| Close Terminal mode                | ESC            | Terminal | Normal   |

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
| Undo                              | Ctrl + z       | Normal and Insert |
| Redo                              | Ctrl + y       | Normal and Insert |
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

| Action                                  | Mapping        | Mode   |
| --------------------------------------- | -------------- | ------ |
| Git log                                 | Leader + g + l | Normal |
| Git status                              | Leader + g + s | Normal |
| Git diff                                | Leader + g + d | Normal |
| Open Git diff of current buffer         | Leader + g + f | Normal |
| Git add current buffer                  | Leader + g + w | Normal |
| Git add all changes on repository files | Leader + g + a | Normal |
| Git reset                               | Leader + g + r | Normal |
| Git commit                              | Leader + g + c | Normal |
| Git pull                                | Leader + g + p | Normal |
| Git push origin                         | Leader + g + o | Normal |
| Git branch                              | Leader + g + b | Normal |
| Git checkout                            | Leader + g + k | Normal |
| Git undo last commit to stage area      | Leader + g + u | Normal |
| Open current line in GitHub             | Leader + g + g | Normal |

### File mappings

| Action                            | Mapping        | Mode   |
| --------------------------------- | -------------- | ------ |
| Open NERDTree in splitted windows | F2             | Normal |
| Toggle NERDTree                   | F3             | Normal |
| Find files on the directory       | Leader + f + z | Normal |
| Set working directory             | Leader + .     | Normal |

### Build mappings

| FileType | Action                            | Mapping        | Mode   |
| -------- | --------------------------------- | -------------- | ------ |
| cpp, h   | Build in debug mode               | Leader + b + d | Normal |
| cpp, h   | Build in release mode             | Leader + b + b | Normal |
| cpp, h   | Build in release mode for Windows | Leader + b + w | Normal |

### Debug Mappings

| Action                             | Mapping        | Mode   |
| ---------------------------------- | -------------- | ------ |
| Start debugging                    | Leader + d + d | Normal |
| Continue debugging                 | Leader + d + c | Normal |
| Close debugger                     | Leader + d + x | Normal |
| Toggle debug breakpoint            | Leader + d + b | Normal |
| Clear breakpoints                  | Leader + d + v | Normal |
| Go to the next breakpoint          | Leader + d + n | Normal |
| Go to the next step                | Leader + d + i | Normal |
| Step out of current function scope | Leader + d + o | Normal |
