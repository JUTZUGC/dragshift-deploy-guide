# DragShift 一键安装指南

> 第三方部署指南 · 非 DragShift 官方仓库。官方项目：[llamaboi55/DragShift](https://github.com/llamaboi55/DragShift)
> 内容来自官方文档（2026-10-31）。项目迭代快，请以[官方文档](https://github.com/llamaboi55/DragShift#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不打开任何窗口：拖着文件按 Shift，菜单就在光标下展开，结果存到原文件旁边，原文件不变。

⚠️ Windows 10/11、macOS 11+、Linux（Debian 12 以上或 Ubuntu 23.04 以上）。Linux 的 Shift + 拖动只在 X11 下生效，Wayland 里请用右键「打开方式」。安装包未签名：Windows 会 SmartScreen 拦一次，macOS 用 dmg 安装时要在隐私与安全性里放行（用官方脚本装可跳过）。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/dragshift-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载安装包，Windows 走当前用户安装，macOS 用官方脚本，Linux 用 deb，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## DragShift 是什么？

DragShift 是开源的拖起文件按一下 Shift，光标下弹出液体玻璃质感的径向菜单，松手就把转换或编辑做完（协议：MIT，<img src="https://img.shields.io/github/stars/llamaboi55/DragShift?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

把文件转换与常见编辑做成拖放菜单：拖动任意文件按 Shift 展开径向切片，选一个就执行，结果写在原文件旁边，原文件保持不动。

- 零窗口操作：拖起来按 Shift 就出菜单
- 结果并排保存：永远不改原文件
- 两类菜单：转换与工具，再按一次 Shift 切换
- 右键也能用：打开方式与发送到都能进
- 跨平台：Windows、macOS、Linux
- 可开机自启：Windows 与 Linux 都支持

（来源：[官方仓库](https://github.com/llamaboi55/DragShift)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 4 | 3 |
| 操 | 作 |
| 不 | 改 |
| W | i |
| 三 | 平 |
| M | I |

| 需要注意 | 说明 |
|---|---|
| L | i |
| 安 | 装 |
| 只 | 处 |
| 菜 | 单 |
| 项 | 目 |

> 以上基于官方文档与社区反馈整理（2026-10-31），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o DragShift-linux-amd64.deb https://github.com/llamaboi55/DragShift/releases/latest/download/DragShift-linux-amd64.deb
sudo apt install ./DragShift-linux-amd64.deb
echo "安装完成：从应用菜单打开 DragShift，之后拖文件按 Shift 即可"
```

安装包来源：[https://github.com/llamaboi55/DragShift#download](https://github.com/llamaboi55/DragShift#download)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认三平台安装包、Shift + 拖动用法与 Wayland 限制 | 已核对 2026-10-31 |
| Release 资产名与大小已核对 | 已核对 2026-10-31 |
| 未实测安装与转换 | 说明 2026-10-31 |
| Release 未提供校验文件，仅核对了资产名与大小 | 说明 2026-10-31 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-10-31 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-31 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装步骤、平台限制与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-31）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\dragshift-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照

| 平台 | 文件 | 大小 |
|---|---|---|
| Windows 安装版 | DragShift-Setup.exe | 61.8 MB |
| Windows 免安装 | DragShift.exe | 95.4 MB |
| macOS Apple Silicon | DragShift-mac-apple-silicon.dmg | 102.2 MB |
| macOS Intel | DragShift-mac-intel.dmg | 88.1 MB |
| Debian / Ubuntu | DragShift-linux-amd64.deb | 92.2 MB |

macOS 也可以一行命令装好并自动更新：

```bash
curl -fsSL https://raw.githubusercontent.com/llamaboi55/DragShift/main/install-mac.sh | bash
```

## 用法

1. 在资源管理器 / Finder / 文件管理器里拖起一个文件
2. 按下 **Shift**，菜单在光标下展开
3. 松手落在某个切片上，结果存到原文件旁边
4. 想切到「工具」类，再按一次 **Shift**

## 系统限制

- **Linux Wayland**：读不到全局 Shift 与鼠标状态，只能用右键「打开方式」进入
- **macOS**：想让玻璃折射后面的窗口，要在系统设置里授予屏幕录制权限；不授权只显示壁纸
- **Windows**：首次运行会被 SmartScreen 拦，选「更多信息 → 仍要运行」

## 注意

- 安装包未签名，安装前请自行确认来源
- 只处理拖进去的那一个文件，不批量改目录
- 结果写在原文件旁边，磁盘空间要留够
- MIT 协议，可自改可分发

## 常见坑

- 按 Shift 没反应：确认是 X11 会话，Wayland 请改用右键打开方式
- Windows 被拦：选「更多信息 → 仍要运行」
- macOS 提示无法验证：系统设置 → 隐私与安全性 → 仍要打开
- 玻璃不折射：授予屏幕录制权限
- 右键菜单里没有 DragShift：重新注销登录，或在设置里重新注册
- deb 装不上：用 apt install ./文件名.deb，不要用 dpkg -i

## 免责声明

本仓库为第三方指南，与 DragShift 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-31），项目迭代快，请以[官方文档](https://github.com/llamaboi55/DragShift#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
