# Zsh configuration for dev container
# Sourced from ~/.zshrc — same pattern as iac/Helm/.devcontainer/zsh-config.zsh:
# load colors, then source repo-root .p10k.zsh so POWERLEVEL9K_* exist before the first
# precmd (otherwise powerlevel10k runs the configuration wizard).

source ${PROJECT_ROOT}/scripts/functions.sh

export_terminal_colors
source ${PROJECT_ROOT}/.p10k.zsh

if [ -d "${PROJECT_ROOT}/scripts" ]; then
  chmod +x ${PROJECT_ROOT}/scripts/*.sh 2>/dev/null || true
fi
