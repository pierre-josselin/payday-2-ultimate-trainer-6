This document is also available in: [English](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/README.md)

# PAYDAY 2 - Ultimate Trainer 6

<img src="https://i.imgur.com/DSVL8hU.png" width="650">

如果你喜欢Ultimate Trainer 6的话请给它一个免费的GithubStar！

<img src="https://i.imgur.com/AxeJvo8.gif">

## 关于此项目

Ultimate Trainer 6 是 PAYDAY 2 的革命性模组。它包含一整套作弊和工具，可从任何网络浏览器（例如 Steam 浏览器）或任何其他设备（例如手机或平板电脑）访问的应用程序控制。

<img src="https://i.imgur.com/ljpoyo4.gif" width="650">

### Built with

[![Vue.js](https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D)](https://vuejs.org)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com)
[![Font Awesome](https://img.shields.io/badge/Font_Awesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white)](https://fontawesome.com)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/en)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org)<br>
[Bootswatch](https://bootswatch.com)

## 如何开始安装？

### 前置必要工作

- Windows 10/11
- PAYDAY 2 on Steam (might work with Epic)
- [SuperBLT](https://superblt.znix.xyz)
- [Node.js](https://nodejs.org/en) 18 (with npm)

> :information_source: 请注意，此 mod 可能不适用于不同版本的 Node.js。

### 正式开始安装mod（请确保前置环境已安装）

> :exclamation: 安装Ultimate Trainer 6与其他mod不同。<br>请仔细按照说明进行操作，否则将无法工作！

[<img src="https://i.imgur.com/i0nsDqD.jpg" width="650">](https://www.youtube.com/watch?v=8BbnMmW9Hmg)

> 游戏文件通常在（位置请于steam内右键游戏选择属性-浏览本地文件查看文件位置）:<br>
> C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2

> 而游戏mod的文件夹在（mod文件夹通常于游戏文件夹内，如果没有发现请在安装blt之后至少运行一次游戏即可生成）:<br>
> C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2\mods

- 安装 [**SuperBLT**](https://superblt.znix.xyz) (你如果安装过了就可跳过此步骤)
    - 下载并安装 **Microsoft Visual C++ 2017 Redistributable Package (x86)** ([direct download](https://aka.ms/vs/15/release/VC_redist.x86.exe))
    - 下载 [**SuperBLT**](https://superblt.znix.xyz) ([direct download](https://sblt-update.znix.xyz/pd2update/download/get.php?src=homepage&id=payday2bltwsockdll))
    - 解压并将 `WSOCK32.dll` 文件复制到你的游戏文件根目录
    - 打开游戏
    - 点击yes来允许blt来安装
- 安装 [**Node.js**](https://nodejs.org/en) 18
    - 下载 [**Node.js**](https://nodejs.org/en) 18 ([direct download](https://nodejs.org/dist/v18.17.0/node-v18.17.0-x64.msi))
    - 全部默认选项安装
    - **重启电脑**
    > :warning: 重启电脑来使你的Ultimate Trainer 6能成功运行
- 安装 [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6)
    - 移除所有之前的Ultimate Trainer版本
    - 下载最新版本的 [**Ultimate Trainer 6**](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6) ([direct download](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/archive/refs/heads/main.zip))
    - 打开 `payday-2-ultimate-trainer-6-main.zip` 文件并解压 `payday-2-ultimate-trainer-6-main` 到游戏的mods文件夹
    - 打开 `payday-2-ultimate-trainer-6-main` 文件夹
    - 运行 `install` 文件
    > :information_source: 如果 `install` 如果该文件不起作用，从当前目录打开命令提示符并键入命令 `node .\index.js install`.

### 正式使用

- 打开游戏
- 在游戏主界面点击最上方 *Ultimate Trainer* 来使用修改器

> :information_source: If something doesn't work, see the [troubleshooting section](#troubleshooting).

#### 从其他设备（笔记本电脑、手机、平板电脑...）访问Ultimate Trainer 6

你可以在本地网络的任何设备来访问该修改器！

<img src="https://i.imgur.com/mQTnyQk.png" width="650"><br>
*Icons by [Freepik](https://www.freepik.com)*

- Start the game
- Locate the local network application URL in the console
- Make sure you are on the same network as the computer where the game is running
- Access the URL in the device's web browser

ℹ️ For some (Windows 11?) users, the server does not start automatically. If when you launch the game, no console opens, create an empty text file named `developer`, inside the `mods` folder.

> :information_source: If it doesn't work, make sure a firewall isn't blocking incoming connections on your computer.<br>Please note that this probably won't work on public, school, or corporate networks.<br>Also, using a VPN might cause issues.

### 如何升级？

- 关闭游戏及控制台
- Backup the `settings.json` and `addons.json` files if you want to keep your configuration
- Follow the [installation instructions](#installation) again (you can skip the **SuperBLT** and **Node.js** installation)
- Restore the `settings.json` and `addons.json` files

> :information_source: If after updating you still get the "Update available" message (this happens regularly with the Steam browser), please close all tabs where the application is open and try again. If the problem persists, delete your browser cache (for Steam browser, go to *Settings*, *In Game*, locate *Delete Web Browser Data* and click on *Delete* button).

### Troubleshooting

This mod is used by many people without any problem.<br>If it doesn't work for you, please check the following:

1. Have you installed Node.js 18 leaving default options?
2. Did you restart your computer after Node.js installation?
3. Did you install the mod by running the `install` file?
4. Did any error occurred while running the `install` file?

Here are the most common problems encountered:

- <a name="troubleshooting-node-not-found">**A message like "Windows cannot find node" appears when starting the game**</a>

    Follow [this YouTube tutorial](https://www.youtube.com/watch?v=sQXWVrb52kw)<br>*Mpemba Inc.*

    > :warning: You will probably need to **restart your computer** after following the tutorial.

- <a name="troubleshooting-server-not-running">**The application page shows an error (e.g. "Unable to connect to server")**</a>

    - Close the game and any open console
    - Create an empty `test.txt` file (lowercase) inside of `payday-2-ultimate-trainer-6-main`
    - Run the game (it will probably get stuck on a black screen)
    - A console will open in the background after a while, use *ALT* + *TAB* to access it

    This will test the different parts of the mod. Once the test is complete, copy the entire contents of the console and share it with us, by creating a [GitHub issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues), by commenting this [YouTube video](https://www.youtube.com/watch?v=8BbnMmW9Hmg) or by replying the [UnknownCheats thread](https://www.unknowncheats.me/forum/payday-2-a/588542-payday-2-ultimate-trainer-6-a.html).

- <a name="troubleshooting-missing-button">**The *Ultimate Trainer* button does not appear in the game's main menu**</a>

    You've probably not extracted the project in the right place.

    You need to extract the `payday-2-ultimate-trainer-6-main` folder to the game `mods` folder.<br>
    The `payday-2-ultimate-trainer-6-main` folder must directly contain the project files such as `README` or `LICENSE` without going through subfolders.<br>
    Also, if the `mods` folder does not exist in the game folder, you probably did not install **SuperBLT** correctly.

If you still can't solve your problem, don't hesitate to create an [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues) by detailing your problem as much as possible, with screenshots it's even better.

## 感谢提供翻译的以下人员

- **English** (Pierre Josselin)
- **German** (Alexander100305)
- **Spanish** (uziel2021)
- **French** (Pierre Josselin)
- **Polish** (POLSKAGUROA)
- **Portuguese (Brasil)** (Webzsz)
- **Romanian** (GamingResources)
- **Turkish** (Berkay211)
- **Russian** (thejuves, chromKa)
- **Ukrainian** (S0ya13, SirConfusion)
- **Chinese** (Art3misFowl, ppt, PlayerBotPro)
- **Japanese** (nattsuiy)
- **Korean** (LOUIS522)

#### 添加更多本地化语言

如果你想让这个mod拥有更多的本地化语言请在以下目录添加您的语言:

- [main.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-app/src/locales/en/main.json)
- [dialogs.json](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/payday-2-ultimate-trainer-6-app/src/locales/en/dialogs.json)

> :warning: 请只翻译后面的values，不要修改前面的keys，并保留大写<br>

Example:

```json
{
    "hello": "Hola"
}
```

然后你可以通过pull request来提供您的语言 [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues/new).

## 如何贡献？

> :warning: 如果您想为该项目做出贡献，我们强烈建议您先创建 [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues/new) 来与开发者交流您想提供什么。

1. Fork this repository **(uncheck "Copy the `master` branch only")**
2. **Switch to development branch `dev`**
3. Commit your changes
4. Push the commits
5. Open a pull request

## 升级日志

[Access the change log](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/CHANGELOG.md)

## 制作人员

[Access the credits](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/CREDITS.md)

## License

Distributed under the GNU General Public License v3.0. This means, but is not limited to, that you can redistribute this project, but you must do so under the same license and with disclosure of the source. See [LICENSE](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/blob/main/LICENSE) for more information.

Ultimate Trainer is not affiliated in any way with PAYDAY 2.
