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
- 在Steam购买的PAYDAY 2 (也许会在epic端可用)
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

ℹ️ 对于某些（Windows 11？）用户，服务器不会自动启动。如果启动游戏时没有打开任何控制台，请在`mods`文件夹中创建一个名为`developer`的空文本文件。

> :information_source:如果出现问题，请参阅 [troubleshooting section](#troubleshooting).

#### 从其他设备（笔记本电脑、手机、平板电脑...）访问Ultimate Trainer 6

你可以在本地网络的任何设备来访问该修改器！

<img src="https://i.imgur.com/mQTnyQk.png" width="650"><br>
*Icons by [Freepik](https://www.freepik.com)*

- 开始游戏
- 在控制台中找到本地网络应用程序URL
- 确保您与运行游戏的计算机在同一网络上
- 访问web浏览器中的URL

> :information_source: 如果不起作用，请确保防火墙没有阻止计算机上的传入连接<br>请注意，这可能不适用于公共、学校或企业网络<br>此外，使用VPN可能会导致问题。

### 如何升级？

- 关闭游戏及控制台
- 备份 `settings.json` 和 `addons.json` 这两个文件如果你想保存你的配置。
- 跟随 [installation instructions](#installation)  (你可以跳过 **SuperBLT** 和 **Node.js** 安装步骤)
- 保存 `settings.json` 和 `addons.json` 文件

> :information_source: 如果升级后仍出现 "Update available" 消息 (通常出现在Steam内部浏览器), 关闭所有标签页并重试。 如果问题仍然存在, 删除浏览器缓存 (对于Steam 浏览器, 去 *设置*, *游戏中*, 定位到 *删除网页浏览器数据* 点击 *删除* 按钮).

### Troubleshooting

这个mod使用的人相当多，并没有任何问题。<br>如果对你不起作用，请检查以下内容:

1.你有没有安装Node.js 18时使用默认选项？
2.安装Node.js后，您是否重新启动了计算机？
3.你是通过运行`install`文件来安装mod的吗？
4.运行`install`文件时是否出现任何错误？

以下是遇到的最常见问题:

- <a name="troubleshooting-node-not-found">**A message like "Windows cannot find node" appears when starting the game**</a>

    跟随 [this YouTube tutorial](https://www.youtube.com/watch?v=sQXWVrb52kw)<br>*Mpemba Inc.*

    > :警告：在完成教程后，您可能需要**重新启动计算机**。

- <a name="troubleshooting-server-not-running">**应用程序页面显示错误 (e.g. "Unable to connect to server")**</a>

    - 关闭游戏和任何打开的控制台
    - 创建一个空白的`test.txt` 文件 (注意小写) 在 `payday-2-ultimate-trainer-6-main`里
    - 启动游戏 (可能会卡在黑屏上)
    - 一段时间后，控制台将在后台打开，使用*ALT*+*TAB*访问它

    这将测试mod的不同部分。测试完成后，通过在 [official Discord server](https://discord.gg/2ZnyNuQRr9), 通过创建一个 [GitHub issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues), 在这里讨论 [YouTube video](https://www.youtube.com/watch?v=8BbnMmW9Hmg) 或者在这里回应 [UnknownCheats thread](https://www.unknowncheats.me/forum/payday-2-a/588542-payday-2-ultimate-trainer-6-a.html).

- <a name="troubleshooting-missing-button">**此 *Ultimate Trainer* 按钮不在主菜单中出现**</a>

    您可能没有将项目解压到正确的位置。

    你需要解压 `payday-2-ultimate-trainer-6-main` 文件夹到游戏 `mods` 文件夹.<br>
    此 `payday-2-ultimate-trainer-6-main` 文件夹必须直接包含项目文件，例如 `README` 或 `LICENSE` 而无需浏览子文件夹。<br>
    相同，如果 `mods` 文件夹在游戏文件夹中不存在，您可能没有安装 **SuperBLT** correctly.

如果您仍然无法解决问题，请毫不犹豫地创建 [issue](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues) 通过屏幕截图尽可能详细地描述你的问题，效果会更好。

## 和我们交流

- [Discord](https://discord.gg/2ZnyNuQRr9)
- [GitHub](https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues)
- [UnknownCheats](https://www.unknowncheats.me/forum/payday-2-a/588542-payday-2-ultimate-trainer-6-a.html)

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
