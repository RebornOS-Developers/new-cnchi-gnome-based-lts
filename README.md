# new-cnchi-gnome-based-lts (ISO creation)

Process to build the ISO:

**1.** Clone this repo:

```
git clone https://github.com/RebornOS-Developers/new-cnchi-gnome-based-lts.git && cd new-cnchi-gnome-based-lts
```

**2.** From terminal, run:

```
sudo ./fix_permissions.sh
sudo ./build.sh -v
```

The installer ISO will be in the **out** folder (folder that will be created automatically).

This installer downloads the cnchi code from the RebornOS repository.
