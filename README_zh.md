<!-- metadata start --><!--
% Cloud Lab v0.6 中文手册
% [泰晓科技 | Tinylab.org](http://tinylab.org)
% \today
--><!-- metadata end -->

**订阅公众号，关注项目状态：**

![Wechat Public](images/tinylab-wechat.jpg)

## 1. 产品简介

[Cloud Lab](http://tinylab.org/cloud-lab) 是一套基于 Docker 的计算机软件云端实验管理平台。

## 2. 产品安装

### 2.1 安装 Docker

Cloud Lab 基于 Docker，所以必须先安装 [Docker CE](https://store.docker.com/search?type=edition&offering=community)。

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
    cs630-qemu-lab  lep-lab  linux-0.11-lab  linux-lab
    markdown-lab  rtthread-lab  tinylab.org

这里将以 `linux-0.11-lab` 为例，它是一套 Linux 0.11 内核的实验环境和材料，相关信息为：

* [Linux 0.11 Lab 首页](https://tinylab.org/linux-0.11-lab)
* [Linux 0.11 Lab 仓库](https://gitee.com/tinylab/linux-0.11-lab)

### 3.2 选择并下载某种计算机软件实验

通过 `choose` 命令选择下载某种实验环境和材料：

    $ tools/docker/choose

    Current Lab is: linux-lab

    Available Labs:

         1	cs630-qemu-lab
         2	linux-0.11-lab
         3	linux-lab
         4	markdown-lab
         5	qing-lab
         6	tinylab.org

    Choose the lab number: 2
         2	linux-0.11-lab


    Download the lab...

### 3.3 运行目标实验环境

接下来运行目标实验环境，运行完成以后，可以选择某种方式登陆。

以上面选择的 `linux-0.11-lab` 为例，可以这样运行：

    $ tools/docker/run linux-0.11-lab
    Please choose one of the login methods:

     1	bash
     2	vnc
     3	ssh
     4	webssh
     5	webvnc

    LOG: Choose the login method:

以 `bash` 为例，登陆效果如下：

    $ tools/docker/bash linux-0.11-lab
    ubuntu@linux-0:/labs/linux-0.11-lab$ ls
    0.11       examples      Makefile.head  src
    book       images        Makefile.help  TODO.md
    callgraph  Makefile      Makefile.tags  tools
    COPYING    Makefile.cg   README.md      VERSION
    doc        Makefile.emu  rootfs

具体实现的开展方式因实验种类而异，这里不做介绍，可参考 [Linux 0.11 Lab](http://tinylab.org/linux-0.11-lab)。

其中的 `webssh`, `webvnc` 适合访问远程的云端实验环境。

### 3.4 删除目标实验环境

在实验开展完成并保存完实验结果后，可以通过如下命令删除实验环境，同样以 `linux-0.11-lab` 为例：

    $ tools/docker/rm linux-0.11-lab

### 3.5 新增实验材料

以 `linux-0.11-lab` 为例，实验材料存放在 `labs/linux-0.11-lab` 目录下。

把相关的实验代码、实验文档等存放在该目录下即可，运行时会自动装载。

为了方便管理，保持一致性，新增材料建议添加到 `examples/` 或者 `src/examples/` 目录下。

## 4. 新增新的实验类型

Cloud Lab 允许灵活添加并管理各种计算机软件实验，可以参照现有实现类型添加。

这部分如有需求，可添加微信号 `tinylab` 联系商业支持。
