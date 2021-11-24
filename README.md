# Examples for Vala Gtk

This repository contains some basic examples for using Vala and GTK+ 3.
Each example tries to showcase some use of the widget in an easy-to-understand form.

## Usage

The examples are distributed as source code, if you want to run the examples you
need to build them.

You can build them using a build system, or manually.

## Using a buildsystem

With meson and ninja you can automatically build all the examples.

In the directory of the repo run

```
meson build
ninja -C build
```

If built succesfully, every executable should be inside of the `./build`
directory

```
./build/box
./build/sourceview
```

You can modify each example and play around for testing purposes.
Just run ninja again in the repo directory, and ninja will rebuild only
the examples that were modified.

```
ninja -C build
```


Make sure you have installed the vala compiler, meson and ninja.


In Debian/Ubuntu or derivatives
```
sudo apt-get install valac meson ninja
```

In Arch, or Arch based systems
```
sudo pacman -S vala meson ninja
```


## Manually build each example


### Install the vala compiler

In Debian/Ubuntu or derivatives

```
sudo apt-get install valac
```

In Arch, or Arch based systems

```
sudo pacman -S vala
```

### To check the version installed in your system

```
vala --version
```

### Compile the example

Every example is a standalone file `filename.vala`, you can compile a file like this

```
valac filename.vala --pkg gtk+-3.0
```

This will generate an executable `filename` in the directory of the repo
You can then run the example

```
./filename
```

Keep in mind that some examples could need other packages besides gtk. Every additional
package can be included in the compiler with directive `--pkg` in the form
`--pkg package-name` for example:

```
valac webkit2.vala --pkg gtk+-3.0 --pkg webkit2gtk-4.0
```

Also it is posible that you will need to install said package in your system.
Check your system documentation.

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

[Douglas Chidester](https://github.com/objectDisorientedProgrammer)

[Alberto Fanjul](https://github.com/albfan)

## To contribute

Just submit a pull request, or open an issue.
