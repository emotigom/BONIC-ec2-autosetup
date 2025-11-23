#!/bin/bash
set -euo pipefail

# --- BOINC project keys (실제 값으로 교체) ---
ROSETTA_KEY="YOUR-ROSETTA-KEY"
EINSTEIN_KEY="YOUR-EINSTEIN-KEY"
WCG_KEY="YOUR-WCG-KEY"
DENIS_KEY="YOUR-DENIS-KEY"
CPDN_KEY="YOUR-CPDN-KEY"

# --- 리포지토리 클론 (또는 raw.githubusercontent으로 직접 다운로드해도 됨) ---
apt-get update -y
apt-get install -y git

git clone https://github.com/YOUR_GITHUB_USERNAME/boinc-ec2-autosetup.git /opt/boinc-ec2-autosetup

cd /opt/boinc-ec2-autosetup

chmod +x scripts/install-boinc-multi.sh

# --- 스크립트에 환경변수 전달 후 실행 ---
export ROSETTA_KEY EINSTEIN_KEY WCG_KEY DENIS_KEY CPDN_KEY

./scripts/install-boinc-multi.sh > /var/log/boinc-install.log 2>&1
