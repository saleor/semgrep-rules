set -eu -o pipefail

usage() {
  local prog
  prog=$(basename "$0")
  {
    echo "USAGE: $prog <INSTALL_PATH>"
    echo ""
    echo "INSTALLATION OPTIONS"
    echo "    INSTALL_PATH  The directory where install the binary, e.g., '/usr/local/bin'"
    echo "                  The directory MUST exist."
  } >&2
}

install_dir="${1-}"
if [[ -z "$install_dir" ]]; then
  usage
  exit 2
fi

# Where the executable will be installed
bin_path="$install_dir"/opengrep

case "$(uname -m)" in
x86_64 | amd64)
  arch=x86
  ;;
aarch64 | arm64)
  arch=aarch64
  ;;
*)
  echo "[FATAL] Unknown arch: %s" "$(uname -m)"
  return 1
  ;;
esac

version="v1.19.0"
download_url="https://github.com/opengrep/opengrep/releases/download/$version/opengrep_manylinux_${arch}"

declare -A checksums
checksums[x86]=1d69a41beb88e8e7917f26cc6a16c1edf298f31402807e6d1afbb5d8684c3590
checksums[aarch64]=7141748e929292e2b672f12515035a01643705010f28970c66ae43612162213e

echo "[INFO] Downloading opengrep..." >&2
curl -Lsf -o "$bin_path" "$download_url"

echo "[INFO] Checking integrity..." >&2
if ! (echo "${checksums[$arch]} $bin_path" | sha256sum -c); then
  error "Failed checksum check"
  exit 1
fi

echo "[INFO] Downloading signature & certificate..." >&2
curl -Lsfo "${bin_path}.sig" "$download_url".sig
curl -Lsfo "${bin_path}.cert" "$download_url".cert

echo "[INFO] Checking signature..." >&2
if cosign verify-blob \
  --cert "${bin_path}.cert" \
  --signature "${bin_path}.sig" \
  --certificate-identity "https://github.com/opengrep/opengrep/.github/workflows/rolling-release.yml@refs/heads/main" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  "$bin_path"; then
  echo "[INFO] Signature is signature" >&2
else
  echo "[ERROR] Invalid signature" >&2
  exit 2
fi

echo "[INFO] Installling opengrep..." >&2
chmod +x "$bin_path"
