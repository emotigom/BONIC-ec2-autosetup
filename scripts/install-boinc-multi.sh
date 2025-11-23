#!/usr/bin/env bash
set -euo pipefail

# --- BOINC project account keys (must be provided as env vars) ---
: "${ROSETTA_KEY:?ROSETTA_KEY is not set}"
: "${EINSTEIN_KEY:?EINSTEIN_KEY is not set}"
: "${WCG_KEY:?WCG_KEY is not set}"
: "${DENIS_KEY:?DENIS_KEY is not set}"
: "${CPDN_KEY:?CPDN_KEY is not set}"

echo "[1/6] apt 업데이트 + boinc-client 설치"
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y boinc-client

echo "[2/6] boinc-client 서비스 잠시 중지"
sudo systemctl stop boinc-client || true

# 서비스가 완전히 멈췄는지 잠깐 체크
sleep 2

echo "[3/6] /var/lib/boinc-client 권한 정리"
sudo chown -R boinc:boinc /var/lib/boinc-client
sudo chmod 750 /var/lib/boinc-client

# gui_rpc_auth.cfg가 아직 없을 수 있으니 존재하면만 chmod
if [ -f /var/lib/boinc-client/gui_rpc_auth.cfg ]; then
  sudo chmod 640 /var/lib/boinc-client/gui_rpc_auth.cfg
fi

echo "[4/6] gui_rpc_auth.cfg 내용 'passwd'로 설정"
sudo bash -c 'echo "passwd" > /var/lib/boinc-client/gui_rpc_auth.cfg'

# 위 echo 때문에 파일 소유자가 root로 바뀌었으니 다시 boinc로
sudo chown boinc:boinc /var/lib/boinc-client/gui_rpc_auth.cfg
sudo chmod 640 /var/lib/boinc-client/gui_rpc_auth.cfg

echo "[5/6] boinc-client 서비스 활성화 + 시작"
sudo systemctl enable --now boinc-client

echo "  - boinc-client 올라올 때까지 대기 중..."
# systemd 관점에서 active 될 때까지 기다림
until systemctl is-active --quiet boinc-client; do
  sleep 1
done

# boinc 내부 RPC 서버가 준비될 때까지 한 번 더 기다림
echo "  - RPC 준비될 때까지 boinccmd --get_state 테스트"
READY=0
for i in {1..10}; do
  if sudo -u boinc boinccmd --passwd passwd --get_state >/dev/null 2>&1; then
    echo "    ✔ RPC 준비됨"
    READY=1
    break
  else
    echo "    아직 준비 안 됨, 3초 후 재시도... ($i/10)"
    sleep 3
  fi
done

if [ "${READY}" -ne 1 ]; then
  echo "❌ boinc-client RPC가 준비되지 않았습니다. 로그를 확인하세요: sudo journalctl -u boinc-client"
  exit 1
fi

# ---------- 각 프로젝트 attach ----------
echo "[6/6-1/5] Rosetta@home 프로젝트 attach 시도"
sudo -u boinc timeout 60 boinccmd \
  --passwd passwd \
  --project_attach https://boinc.bakerlab.org/rosetta \
  "${ROSETTA_KEY}" || {
    echo "❌ Rosetta@home attach 실패 (네트워크 또는 계정 키 문제일 수 있음)"
    exit 1
  }
sleep 0.2

echo "[6/6-2/5] Einstein@Home 프로젝트 attach 시도"
sudo -u boinc timeout 60 boinccmd \
  --passwd passwd \
  --project_attach https://einsteinathome.org/ \
  "${EINSTEIN_KEY}" || {
    echo "❌ Einstein@Home attach 실패 (네트워크 또는 계정 키 문제일 수 있음)"
    exit 1
  }
sleep 0.2

echo "[6/6-3/5] World Community Grid 프로젝트 attach 시도"
sudo -u boinc timeout 60 boinccmd \
  --passwd passwd \
  --project_attach https://www.worldcommunitygrid.org/ \
  "${WCG_KEY}" || {
    echo "❌ World Community Grid attach 실패 (네트워크 또는 계정 키 문제일 수 있음)"
    exit 1
  }
sleep 0.2

echo "[6/6-4/5] DENIS 프로젝트 attach 시도"
sudo -u boinc timeout 60 boinccmd \
  --passwd passwd \
  --project_attach https://denis.usj.es/denisathome/ \
  "${DENIS_KEY}" || {
    echo "❌ DENIS attach 실패 (네트워크 또는 계정 키 문제일 수 있음)"
    exit 1
  }
sleep 0.2

echo "[6/6-5/5] CPDN 프로젝트 attach 시도"
sudo -u boinc timeout 60 boinccmd \
  --passwd passwd \
  --project_attach https://cpdn.org/ \
  "${CPDN_KEY}" || {
    echo "❌ CPDN attach 실패 (네트워크 또는 계정 키 문제일 수 있음)"
    exit 1
  }

echo "✅ 모든 작업 완료!"
