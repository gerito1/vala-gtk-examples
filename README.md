# Examples for Vala Gtk

This repository contains some basic examples for using Vala and GTK+ 3.
Each example tries to showcase some use of the widget in an easy-to-understand form.

## Usage

Before running the examples, you will need compile the sources files and for that
you need the Vala compiler.

First install the vala compiler

### Install vala compiler in debian and debian based systems

```
sudo apt-get install valac
```

### Install vala compiler in Arch Linux based systems

```
sudo pacman -S vala
```

### To check the version installed in your system

```
vala --version
```

### Compile the example

Every example is a standalone file `filename.vala` to compile it use

```
valac filename.vala --pkg gtk+-3.0
```

This will generate an executable `filename` in the directory of the repo to run it use

```
./filename
```

Keep in mind that some examples could use other packages besides gtk. Every additional
package can be included in the compiler with directive `--pkg` in the form
`--pkg package-name` for example:

```
valac webkit2.vala --pkg gtk+-3.0 --pkg webkit2gtk-4.0
```

## Aditional Resources
[The Vala Online Documentation](https://valadoc.org)

[The official GNOME Vala Project page](https://wiki.gnome.org/Projects/Vala)

[The Vala Tutorial by GNOME](https://wiki.gnome.org/Projects/Vala/Tutorial)

[The vala tutorial by Chebizarro](https://www.gitbook.com/book/chebizarro/the-vala-tutorial/details)
A gitbook with a great tutorial for vala. Can be downloaded as pdf.

[Vala for C# Programmers by GNOME](https://wiki.gnome.org/Projects/Vala/ValaForCSharpProgrammers)

[Vala for Java Programmers by GNOME](https://wiki.gnome.org/Projects/Vala/ValaForJavaProgrammers)

#### elementery OS has a nice amount of resources online

[elementary OS Developers' Reference](https://elementary.io/docs/code/reference)
It contains guidelines for coding style, reporting bugs and proposing changes. You should take a look.

[elementary OS' Getting Started guide](https://elementary.io/docs/code/getting-started)
A nice guide with little code examples, guides to set up your environment. Guides
to Bazaar (another source version control software similar to git). Guides to
Launchpad (a repositories for code and binaries used in many Ubuntu derivatives
and by Canonical for Ubuntu). How to create deb packages and more.

[elementary OS' Human Interfaces Guidelines](https://elementary.io/docs/human-interface-guidelines)
A great resource to learn a little about design the GUI for your app.

#### Videos

[Gtk+ Kick-Start Tutorial for Vala by Alberto Ruiz](https://vimeo.com/9617309)

[Vala Language Introduction by Andre Masella](https://www.youtube.com/watch?v=Eqa38B0GV6U)

## Other Notes
A tutorial to further explain the use of each widget may be written in the future, possibly when GTK+ 4 is released. ;)

## Authors
#### Original Author

[Andrew Steele](https://github.com/steeleyuk)

#### Contributors

[Geronimo Bareiro](https://github.com/gerito1)

## To contribute

Just submit a pull request, or open an issue.
