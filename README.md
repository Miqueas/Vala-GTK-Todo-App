# Vala GTK Todo App

A simple Todo app built with Vala and GTK 4 + Adwaita. Similar to [this other project I did recently](https://github.com/Miqueas/Java-Swing-Todo-App)

# Building

You will need the following dependencies:

 - libadwaita-1
 - gtk-4
 - gee-0.8

And of course the following tools:

 - vala
 - meson
 - ninja

Once you have all the dependencies and tools installed, clone this repository and then you can build the project with:

```bash
meson setup . _BUILD
ninja -C _BUILD
```

And then run the app with:

```bash
./_BUILD/io.github.iqueas.Vala-GTK-Todo-App
```