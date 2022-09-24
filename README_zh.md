<!-- metadata start --><!--
% Cloud Lab v0.8 中文手册
% [泰晓科技 | Tinylab.org][004]
% \today
--><!-- metadata end -->

**订阅公众号，关注项目状态：**

![Wechat Public](images/tinylab-wechat.jpg)

## 1. 产品简介

[Cloud Lab][005] 是一套基于 Docker 的计算机软件云端实验管理平台。

Cloud Lab 是一个开源软件，不提供任何保证，请自行承担使用过程中的任何风险。

## 2. 产品安装

如果确实是 Linux 新手或不喜欢无聊的安装过程，想**免安装**立马使用 Cloud Lab，那么可以从 [泰晓开源小店][006] 选购一枚即插即跑的 [Linux Lab Disk][007]。它也叫 “泰晓 Linux 实验盘”，可以在淘宝手机 APP 内搜索 “泰晓 Linux” 后购买。

### 2.1 安装 Docker

Cloud Lab 基于 Docker，所以必须先安装 [Docker CE][002]。

Docker CE 支持 Mac, Windows, Ubuntu, Debian, Fedora, CentOS, Azure and AWS，Cloud Lab 已经适配 Windows, Mac, Ubuntu 等多种系统。

由于不同操作系统的安装方式略有差异，请参考 Docker 官方手册自行安装。

### 2.2 安装 Git

Cloud Lab 通过 git 管理代码仓库，所以需要提前根据系统要求安装 git。当前各大系统都支持 git，请参考 git 官方文档自行安装。

### 2.3 下载并进入 Cloud Lab

Cloud Lab 现在托管在 github.com, gitee.com 等代码仓库管理平台上，下载方式如下：

    $ git clone https://gitee.com/tinylab/cloud-lab.git
    $ cd cloud-lab/

## 3. 开展现有实验

### 3.1 查看当前已经支持的实验类型

Cloud Lab 当前已经支持的实验种类如下：

    $ ls labs/
    cs630-qemu-lab  linux-0.11-lab  linux-lab  markdown-lab  tinylab.site

这里将以 `linux-lab` 为例，它是一套 Linux 内核的实验环境和材料，相关信息为：

* [Linux Lab 首页][003]
* [Linux Lab 仓库][001]

### 3.2 选择并下载某种计算机软件实验

通过 `choose` 命令选择下载某种实验环境和材料：

    $ tools/docker/choose

    Current Lab is: linux-lab

    Available Labs:

         1	cs630-qemu-lab
         2	linux-0.11-lab
         3	linux-lab
         4	markdown-lab
         5	tinylab.site

    Choose the lab number: 3
         3	linux-lab

    Download the lab...

### 3.3 运行目标实验环境

接下来运行目标实验环境，运行完成以后，可以选择某种方式登陆。

以上面选择的 `linux-lab` 为例，可以这样运行：

    $ tools/docker/run linux-lab
    Please choose one of the login methods:

    1	bash
    2	vnc
    3	ssh
    4	webssh
    5	webvnc

    LOG: Choose the login method:

以 `bash` 为例，登陆效果如下：

    $ tools/docker/bash linux-lab
    ubuntu@linux-lab:/labs/linux-lab$ ls

具体实现的开展方式因实验种类而异，这里不做介绍，可参考 [Linux Lab][003]。

其中的 `webssh`, `webvnc` 适合访问远程的云端实验环境。

### 3.4 删除目标实验环境

在实验开展完成并保存完实验结果后，可以通过如下命令删除实验环境，同样以 `linux-lab` 为例：

    $ tools/docker/rm linux-lab

### 3.5 新增实验材料

以 `linux-lab` 为例，实验材料存放在 `labs/linux-lab` 目录下。

把相关的实验代码、实验文档等存放在该目录下即可，运行时会自动装载。

为了方便管理，保持一致性，新增材料建议添加到 `examples/` 或者 `src/examples/` 目录下。

## 4. 新增新的实验类型

Cloud Lab 允许灵活添加并管理各种计算机软件实验，可以参照现有实现类型添加。

这部分如有需求，可添加微信号 `tinylab` 联系商业支持。

[001]: https://gitee.com/tinylab/linux-lab
[002]: https://store.docker.com/search?type=edition&offering=community
[003]: https://tinylab.org/linux-lab
[004]: https://tinylab.org
[005]: https://tinylab.org/cloud-lab
[006]: https://shop155917374.taobao.com
[007]: https://tinylab.org/linux-lab-disk
