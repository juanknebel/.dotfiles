#!/usr/bin/fish

function notes
  test (count $argv) -gt 0
     and echo $argv >> "$HOME/notes.md"
      or echo "" >> "$HOME/notes.md"
end
