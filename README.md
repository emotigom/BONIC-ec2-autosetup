# BOINC EC2 Autosetup( cpu only )

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

[🇬🇧 English](#english) · [🇰🇷 한국어](#한국어) · [🇫🇷 Français](#français) · [🇪🇸 Español](#español) · [🇨🇳 中文](#中文)

---

#english

Automatically install **BOINC** and attach multiple science projects on a fresh **Ubuntu EC2 instance**.

### Features

- Installs `boinc-client` via `apt`
- Configures `gui_rpc_auth.cfg` with a known password (`passwd`)
- Waits until BOINC RPC is ready before attaching projects
- Attaches:
  - Rosetta@home
  - Einstein@Home
  - World Community Grid
  - DENIS@home
  - ClimatePrediction.net (CPDN)
- Can be used:
  - Manually (SSH, then run the script once)
  - Automatically on first boot (EC2 User Data)

### Quick start (manual)

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/boinc-ec2-autosetup.git
cd boinc-ec2-autosetup

export ROSETTA_KEY="your-rosetta-key"
export EINSTEIN_KEY="your-einstein-key"
export WCG_KEY="your-wcg-key"
export DENIS_KEY="your-denis-key"
export CPDN_KEY="your-cpdn-key"

chmod +x scripts/install-boinc-multi.sh
./scripts/install-boinc-multi.sh
```
---

## #한국어

새로운 Ubuntu EC2 인스턴스에서 자동으로 BOINC를 설치하고
여러 과학 프로젝트를 한 번에 연결해 주는 스크립트입니다.

### 주요 기능

apt로 boinc-client 설치

gui_rpc_auth.cfg를 고정 비밀번호(passwd)로 설정

BOINC RPC 서버 준비 완료 여부를 확인한 뒤 프로젝트 attach

다음 프로젝트 자동 연결:

Rosetta@home

Einstein@Home

World Community Grid

DENIS@home

ClimatePrediction.net (CPDN)

### 사용 방법:

수동 실행: SSH로 접속 후 스크립트 한 번 실행

자동 실행: EC2 생성 시 User Data에 넣어 처음 부팅할 때 자동 실행

### 빠른 시작 (수동 실행)

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/boinc-ec2-autosetup.git
cd boinc-ec2-autosetup

export ROSETTA_KEY="본인-Rosetta-키"
export EINSTEIN_KEY="본인-Einstein-키"
export WCG_KEY="본인-WCG-키"
export DENIS_KEY="본인-DENIS-키"
export CPDN_KEY="본인-CPDN-키"

chmod +x scripts/install-boinc-multi.sh
./scripts/install-boinc-multi.sh
```
---

## #Español

Este proyecto instala automáticamente BOINC y adjunta varios proyectos científicos
en una nueva instancia Ubuntu EC2.

### Características

Instala boinc-client con apt

Configura gui_rpc_auth.cfg con la contraseña passwd

Espera a que el servidor RPC de BOINC esté listo antes de adjuntar proyectos

Adjunta:

Rosetta@home

Einstein@Home

World Community Grid

DENIS@home

ClimatePrediction.net (CPDN)

### Inicio rápido (manual)

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/boinc-ec2-autosetup.git
cd boinc-ec2-autosetup

export ROSETTA_KEY="tu-clave-rosetta"
export EINSTEIN_KEY="tu-clave-einstein"
export WCG_KEY="tu-clave-wcg"
export DENIS_KEY="tu-clave-denis"
export CPDN_KEY="tu-clave-cpdn"

chmod +x scripts/install-boinc-multi.sh
./scripts/install-boinc-multi.sh
```
---

## #Français

Ce projet installe automatiquement BOINC et attache plusieurs projets scientifiques
sur une nouvelle instance Ubuntu EC2.

### Fonctionnalités

Installation de boinc-client via apt

Configuration de gui_rpc_auth.cfg avec le mot de passe passwd

Attente de la disponibilité du serveur RPC avant d’attacher les projets

Attache :

Rosetta@home

Einstein@Home

World Community Grid

DENIS@home

ClimatePrediction.net (CPDN)

### Démarrage rapide (manuel)

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/boinc-ec2-autosetup.git
cd boinc-ec2-autosetup

export ROSETTA_KEY="votre-clé-rosetta"
export EINSTEIN_KEY="votre-clé-einstein"
export WCG_KEY="votre-clé-wcg"
export DENIS_KEY="votre-clé-denis"
export CPDN_KEY="votre-clé-cpdn"

chmod +x scripts/install-boinc-multi.sh
./scripts/install-boinc-multi.sh
```
---

## #中文

这个项目可以在新的 Ubuntu EC2 实例 上自动安装 BOINC，
并一次性连接多个科学计算项目。

### 功能

使用 apt 安装 boinc-client

将 gui_rpc_auth.cfg 配置为固定密码 passwd

等待 BOINC RPC 服务就绪后再连接项目

自动连接：

Rosetta@home

Einstein@Home

World Community Grid

DENIS@home

ClimatePrediction.net (CPDN)

### 快速开始（手动）

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/boinc-ec2-autosetup.git
cd boinc-ec2-autosetup

export ROSETTA_KEY="你的-rosetta-密钥"
export EINSTEIN_KEY="你的-einstein-密钥"
export WCG_KEY="你的-wcg-密钥"
export DENIS_KEY="你的-denis-密钥"
export CPDN_KEY="你的-cpdn-密钥"

chmod +x scripts/install-boinc-multi.sh
./scripts/install-boinc-multi.sh
```
---

## License / 라이선스

The automation scripts and documentation in this repository are available under the [MIT License](LICENSE). Anyone may use, copy, modify, merge, publish, distribute, sublicense, and sell copies under the license terms.

BOINC, the BOINC client, and the connected scientific projects are third-party software and services governed by their respective licenses and terms.

이 저장소의 자동화 스크립트와 문서는 [MIT 라이선스](LICENSE)로 공개됩니다. 라이선스 조건에 따라 누구나 사용·복사·수정·배포하고 상업적으로 이용할 수 있습니다.

BOINC 클라이언트와 연결되는 각 과학 프로젝트에는 해당 프로젝트의 별도 라이선스 및 이용 조건이 적용됩니다.
