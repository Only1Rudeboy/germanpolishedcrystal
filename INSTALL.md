# Installationsanleitung

> **Hinweis:** Dies ist die **deutsche Übersetzung** der Installationsanleitung für diesen **Übersetzungs-Fork** ([germanpolishedcrystal](https://github.com/Only1Rudeboy/germanpolishedcrystal)).  
> Die Lokalisierung ist **WIP** (u. a. mit Grok 4.5); beim Bauen und Spielen können noch Fehler auffallen — Feedback ist willkommen.

Wenn du Polished Crystal nur spielen willst, nutze eines der **.ips-Patches** wie in der [README](README.md) beschrieben (Upstream-Releases sind **englisch**).  
Für die **deutsche Fassung** baust du die ROM idealerweise **selbst aus diesem Repository**.

> You know it's sitting back and looking at it that you realize that Gamefreak is actually really good devs.  
> Like you have Pokemon and it's a simple formula "How can you fuck it up?" and then all of these Romhacks basically go "Like this."
>
> — Anonymous, [/vp/](https://boards.4channel.org/vp/)


## Windows

Zum Bauen unter Windows [**Cygwin**](http://cygwin.com/install.html) mit den Standardeinstellungen installieren.

Im Installer folgende Pakete auswählen: `git`, `make` und `gcc-core`.

Im **Cygwin-Terminal**:

```bash
git clone https://github.com/Only1Rudeboy/germanpolishedcrystal.git
cd germanpolishedcrystal
mkdir rgbds
```

Anschließend [**rgbds 1.0.1**](https://rgbds.gbdev.io/) herunterladen. (Für ältere Polished-Crystal-Releases kann eine ältere RGBDS-Version nötig sein.) Archiv entpacken und alle `.exe`- und `.dll`-Dateien nach `germanpolishedcrystal/rgbds` legen.

**polishedcrystal.gbc** bauen:

```bash
make
```

Unter manchen Windows-Setups (z. B. MSYS2/`make` + Windows-rgbds) müssen die Tools explizit mit `.exe` angegeben werden:

```bash
make RGBASM=rgbds/rgbasm.exe RGBFIX=rgbds/rgbfix.exe RGBGFX=rgbds/rgbgfx.exe RGBLINK=rgbds/rgblink.exe
```

Andere Varianten bauen:

```bash
make [faithful] [hgss|monochrome|noir] [debug]
```

Beispiel — monochrome Faithful-Version:

```bash
make faithful monochrome
```


## Linux

```bash
sudo apt-get install make gcc git bison

git clone https://github.com/gbdev/rgbds.git
cd rgbds
sudo make install
cd ..

git clone https://github.com/Only1Rudeboy/germanpolishedcrystal.git
cd germanpolishedcrystal
```

**polishedcrystal.gbc** bauen:

```bash
make
```

Andere Varianten:

```bash
make [faithful] [hgss|monochrome|noir] [debug]
```


## macOS

Benötigt werden `md5sum`, `ghead` und `gtail`.  
Installation: `brew install coreutils`

Im **Terminal**:

```bash
xcode-select --install

brew install rgbds

git clone https://github.com/Only1Rudeboy/germanpolishedcrystal.git
cd germanpolishedcrystal
```

**polishedcrystal.gbc** bauen:

```bash
make
```

Andere Varianten:

```bash
make [faithful] [hgss|monochrome|noir] [debug]
```


## Nach dem Build

- Die fertige ROM heißt typischerweise `polishedcrystal-3.2.3.gbc` (je nach `Makefile`/Version).  
- Im Emulator öffnen (z. B. mGBA, BGB, SameBoy).  
- **Keine fertige ROM** in dieses Repo legen (Copyright) — nur Source bauen.  
- Upstream-Original (englisch): [Rangi42/polishedcrystal](https://github.com/Rangi42/polishedcrystal)
