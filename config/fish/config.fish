# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

# SPACEFISH
set -g SPACEFISH_PROMPT_DEFAULT_PREFIX ""
set -g SPACEFISH_CHAR_SYMBOL ">"
set -g SPACEFISH_PROMPT_SEPARATE_LINE false
set -g SPACEFISH_EXIT_CODE_SHOW true
set -g SPACEFISH_TIME_SHOW true
#set -g SPACEFISH_TIME_PREFIX ""
set -g SPACEFISH_DIR_TRUNC_REPO false
set -g SPACEFISH_DIR_TRUNC 0
set -g SPACEFISH_GIT_PREFIX ""
set -g SPACEFISH_RPROMPT_ORDER exit_code node pyenv exec_time jobs time
set -g SPACEFISH_PROMPT_ORDER user dir host git package docker ruby golang php rust haskell julia aws conda line_sep battery char
