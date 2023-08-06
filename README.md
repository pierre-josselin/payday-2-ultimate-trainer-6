This document is also available in: [Chinese](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/README.zh.md)

# PAYDAY 2 - Ultimate Trainer 6

<img src="https://i.imgur.com/DSVL8hU.png" width="650">

Do you like Ultimate Trainer 6? It's free and open source software!<br>The best way to support us is to give us a free GitHub star!

<img src="https://i.imgur.com/AxeJvo8.gif">

## About The Project

Ultimate Trainer 6 is a revolutionary mod for PAYDAY 2. It includes a complete collection of cheats and tools controlled by an application accessible from any web browser, such as the Steam browser, or any other device like a phone or tablet.

<img src="https://i.imgur.com/ljpoyo4.gif" width="650">

### Built with

[![Vue.js](https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)](https://vuejs.org)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com)
[![Font Awesome](https://img.shields.io/badge/Font_Awesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white)](https://fontawesome.com)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/en)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org)<br>
[Bootswatch](https://bootswatch.com)

## Getting started

### Prerequisites

- Windows 10/11
- PAYDAY 2 on Steam (not tested on Epic)
- [SuperBLT](https://superblt.znix.xyz)
- [Node.js](https://nodejs.org/en) 18 (with npm)

> :information_source: Please note that this mod might not work with a different version of Node.js.

### Installation

> :exclamation: Installing Ultimate Trainer 6 is different from other mods.<br>**Please follow the instructions carefully otherwise it will not work!**

[<img src="https://i.imgur.com/i0nsDqD.jpg" width="650">](https://www.youtube.com/watch?v=8BbnMmW9Hmg)

> The game folder location is usually:<br>
> C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2

> The game mods folder location is usually:<br>
> C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2\mods

- Install [**SuperBLT**](https://superblt.znix.xyz) (you can skip this step if it's already installed)
    - Download and install **Microsoft Visual C++ 2017 Redistributable Package (x86)** ([direct download](https://aka.ms/vs/15/release/VC_redist.x86.exe))
    - Download [**SuperBLT**](https://superblt.znix.xyz) ([direct download](https://sblt-update.znix.xyz/pd2update/download/get.php?src=homepage&id=payday2bltwsockdll))
    - Open the archive and extract the `WSOCK32.dll` file to your game folder
    - Start the game
    - Press *yes* when prompted to download the basemod
- Install [**Node.js**](https://nodejs.org/en) 18
    - Download [**Node.js**](https://nodejs.org/en) 18 ([direct download](https://nodejs.org/dist/v18.17.0/node-v18.17.0-x64.msi))
    - Install it leaving all default options
    - **Restart your computer**
    > :warning: Restarting your computer is required for the Node.js path to be properly configured in Windows. Until you restart, the mod probably won't work.
- Install [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6)
    - Remove any previous version Ultimate Trainer
    - Download the latest version of [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6) ([direct download](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/archive/refs/heads/main.zip))
    - Open the `payday-2-ultimate-trainer-6-main.zip` archive and extract the `payday-2-ultimate-trainer-6-main` folder to the game mods folder
    - Open `payday-2-ultimate-trainer-6-main` from your game mods folder
    - Run the `install` file

### Usage

- Start the game
- Click on *Ultimate Trainer* in the game menu to open the app

> :information_source: If something doesn't work, see the [troubleshooting section](#troubleshooting).

#### Access the app from another device (laptop, phone, tablet...)

You can access the application from any web browser on the same network.

<img src="https://i.imgur.com/mQTnyQk.png" width="650"><br>
*Icons by [Freepik](https://www.freepik.com)*

- Start the game
- Locate the local network application URL in the console
- Make sure you are on the same network as the computer where the game is running
- Access the URL in the device's web browser

### Update

- Close the game and the console
- Follow the [installation instructions](#installation) again (you can skip **SuperBLT** and **Node.js** installation)

### Troubleshooting

This mod is used by many people without any problem.<br>If it doesn't work for you, most likely you didn't follow the installation instructions properly.

- Have you installed Node.js 18?
- Did you restart your computer after installing Node.js?
- Did you install the project by running the `install` script?
- No error occurred while running the `install` script?

If you can answer *yes* to all the previous points, here are solutions to the most frequently encountered problems:

- **The application page shows an error**

    Run a test:

    - Close the game and any open console
    - Create an empty `test.txt` file (lowercase) inside of `payday-2-ultimate-trainer-6-main`
    - Run the game (it will probably get stuck on a black screen)
    - A console will open in the background after a while, use *ALT* + *TAB* to access it

    Once the test is complete, copy the entire contents of the console and paste it somewhere we can see it, for example by creating a [GitHub issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues), by commenting this [YouTube video](https://www.youtube.com/watch?v=8BbnMmW9Hmg) or by replying the [UnknownCheats thread](https://www.unknowncheats.me/forum/payday-2-a/588542-payday-2-ultimate-trainer-6-a.html).

    > :warning: Remember to close the console after saving the test results.

- **The *Ultimate Trainer* button does not appear in the game's main menu**

    You've probably not extracted the project in the right place.

    You need to extract the `payday-2-ultimate-trainer-6-main` folder to the game `mods` folder.<br>
    The `payday-2-ultimate-trainer-6-main` folder must directly contain the project files such as `README` or `LICENSE` without going through subfolders.<br>
    Also, if the `mods` folder does not exist in the game folder, you probably did not install **SuperBLT** correctly.

If you still can't solve your problem, don't hesitate to create an [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues) by detailing your problem as much as possible, with screenshots it's even better.

## Supported languages

- **English** (Pierre Josselin)
- **German** (Alexander100305)
- **Spanish** (uziel2021)
- **French** (Pierre Josselin)
- **Portuguese (Brasil)** (Webzsz)
- **Romanian** (GamingResources)
- **Russian** (thejuves)
- **Ukrainian** (S0ya13)
- **Chinese** (Art3misFowl, ppt)
- **Japanese** (nattsuiy)
- **Korean** (LOUIS522)

#### Add a language

If you wish to contribute to the project by adding a new language, you can do so by translating the following English files into your native language:

- [payday-2-ultimate-trainer-6-app/src/locales/en/main.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-app/src/locales/en/main.json)
- [payday-2-ultimate-trainer-6-app/src/locales/en/dialogs.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-app/src/locales/en/dialogs.json)
- [payday-2-ultimate-trainer-6-mod/locales/en.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-mod/locales/en.json)

> :warning: Please only translate values, not keys, and keep capitals.<br>

Example:

```json
{
    "hello": "Hola"
}
```

You can then publish the updated files via a pull request or more simply by creating an [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues).

## Contributing

> :warning: If you would like to contribute to the project, we strongly recommend you to first create an [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues) to discuss what you would like to do.

1. Fork this repository
2. **Switch to development branch (6.X.X)**
3. Commit your changes
4. Push the commits
5. Open a pull request

## Change Log

[Access the change log](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/CHANGELOG.md)

## Credits

[Access the credits](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/CREDITS.md)

## License

Distributed under the GNU General Public License v3.0. This means, but is not limited to, that you can redistribute this project, but you must do so under the same license and with disclosure of the source. See [LICENSE](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/LICENSE) for more information.

Ultimate Trainer is not affiliated in any way with PAYDAY 2.
