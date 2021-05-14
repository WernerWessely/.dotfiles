# Load Antigen:
source ~/antigen.zsh

# Spaceship theme config:

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  rust          # Rust section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_GIT_PREFIX=""

# Autosuggestions config:

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

# Load Antigen configurations:
antigen init ~/.antigenrc

