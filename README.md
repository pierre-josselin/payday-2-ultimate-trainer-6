# PAYDAY 2 - Ultimate Trainer 6

<img src="https://i.imgur.com/DSVL8hU.png" width="650">

Do you like Ultimate Trainer 6? It's free and open source software!<br>The best way to support us is to give us a free GitHub star!

<img src="https://i.imgur.com/gxwIB9a.gif">

## About The Project

Ultimate Trainer 6 is a revolutionary mod for PAYDAY 2. It includes a complete collection of cheats and tools controlled by an application accessible from any web browser, such as the Steam browser, or any other device like a phone or tablet.

<img src="https://i.imgur.com/ljpoyo4.gif" width="650">

### Built with

[![Vue.js](https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)](https://vuejs.org) [![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com) [![Font Awesome](https://img.shields.io/badge/Font_Awesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white)](https://fontawesome.com) [![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/en) [![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org) [Bootswatch](https://bootswatch.com)

## Getting started

### Prerequisites

- Windows 10/11
- PAYDAY 2 on Steam (not tested on Epic)
- [SuperBLT](https://superblt.znix.xyz)
- [Node.js](https://nodejs.org/en) 18 (with npm)

### Installation

> :exclamation: Installing Ultimate Trainer 6 is different from other mods.<br>Please follow the instructions carefully otherwise it will not work!

> The game folder location is usually:<br>
> C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2
>
> The game mods folder location is usually:<br>
> C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2\mods

- Install [**SuperBLT**](https://superblt.znix.xyz)
    - Download and install **Microsoft Visual C++ 2017 Redistributable Package (x86)** ([direct download](https://aka.ms/vs/15/release/VC_redist.x86.exe))
    - Download [**SuperBLT**](https://superblt.znix.xyz) ([direct download](https://sblt-update.znix.xyz/pd2update/download/get.php?src=homepage&id=payday2bltwsockdll))
    - Open the archive and extract the `WSOCK32.dll` file to your game folder
    - Start the game
    - Press yes when prompted to download the basemod
- Install [**Node.js**](https://nodejs.org/en) 18
    - Download [**Node.js**](https://nodejs.org/en) 18 ([direct download](https://nodejs.org/dist/v18.17.0/node-v18.17.0-x64.msi))
    > :information_source: Please note that this mod might not work with a different version of Node.js.
    - Install it leaving all default options
    - Restart your computer
    > :warning: Restarting your computer is required for the Node.js path to be properly configured in Windows. Until you restart, the mod probably won't work.
- Install [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6)
    - Remove any previous version Ultimate Trainer
    - Download the latest version of [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6) ([direct download](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/archive/refs/heads/main.zip))
    - Open the `payday-2-ultimate-trainer-6-main.zip` archive and extract the `payday-2-ultimate-trainer-6-main` folder to the game mods folder
    - Open `payday-2-ultimate-trainer-6-main` from your game mods folder
    - Run `install`
    > :information_source: If the `install` file does not work, open a command prompt from the current directory and type the command `node .\index.js install`.

### Usage

- Start the game
- Click on *Ultimate Trainer* in the game menu to open the app

#### Access the app from another device (laptop, phone, tablet...)

You can access the application from any web browser on the same network.

<img src="https://i.imgur.com/mQTnyQk.png" width="650"><br>
*Icons by [Freepik](https://www.freepik.com)*

- Open the `payday-2-ultimate-trainer-6-main` from your game mods folder
- Run the `get-remote-url` file
> :information_source: If the `get-remote-url` file does not work, open a command prompt from the current directory and type the command `node .\index.js get-remote-url`.
- Make sure you are on the same network as the computer where the game is running
- Access the URL in the device's web browser

> :warning: Accessing the app from multiple devices simultaneously is not currently supported and may cause issues. Accessing the app when a heist has already been started is also not supported.

### Update

- Close the game and the console
- Remove the previous versions of **Ultimate Trainer 6**
- Download the latest version of [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6) ([direct download](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/archive/refs/heads/main.zip))
- Open the `payday-2-ultimate-trainer-6-main.zip` archive and extract the `payday-2-ultimate-trainer-6-main` folder to the game mods folder
- Open `payday-2-ultimate-trainer-6-main` from your game mods folder
- Run `install`
> :information_source: If the `install` file does not work, open a command prompt from the current directory and type the command `node .\index.js install`.

## Supported languages

- **English** (Pierre Josselin)
- **French** (Pierre Josselin)
- **Romanian** (GamingResources)
- **Chinese** (Art3misFowl, ppt)
- **Russian** (thejuves)
- **Spanish** (uziel2021)
- **German** (Alexander100305)

#### Add a language

If you wish to contribute to the project by adding a new language, you can do so by translating the following English files into your native language:

- [payday-2-ultimate-trainer-6-app/src/locales/en/main.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-app/src/locales/en/main.json)
- [payday-2-ultimate-trainer-6-app/src/locales/en/dialogs.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-app/src/locales/en/dialogs.json)
- [main/payday-2-ultimate-trainer-6-mod/locales/en.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-mod/locales/en.json)

> :warning: Please only convert values, not keys, and keep capitals.<br>

Example:

```json
{
    "hello": "Hola"
}
```

You can then publish the updated files via a pull request or more simply by creating a [new issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues/new).

## Contributing

> :warning: If you would like to contribute to the project, we strongly recommend you to first create [an issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues/new) to discuss what you would like to do.

1. Fork this repository
2. Create a branch for your feature
3. Commit your changes
4. Push commits to your branch
5. Open a pull request

## Change Log

[Access the change log](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/changelog.md)

## Credits

[Access the credits](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/credits.md)

## License

Distributed under the GNU General Public License v3.0. See [LICENSE](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/LICENSE) for more information.

Ultimate Trainer is not affiliated in any way with PAYDAY 2.
