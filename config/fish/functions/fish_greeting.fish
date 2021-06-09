function fish_greeting
  set light_blue C7E2E8
  set gray C1C1BD
  set light_gray EEE
  set dark_gray 565653
  set bronze C6973F
  set yellow FFE500
  set lime C6E80B
  set brown 8C5D05

  set host (hostname)


  # Line 0
  printf "Welcome $USER@$host!!!!"
  # Line 1
  # set_color --background white
  set_color $light_gray
  printf '\n'
  printf '  __'
  set_color $gray
  printf '      _____ ____\n'
  # Line 2
  set_color $light_gray
  printf ' /---__  '
  set_color $gray
  printf '('
  set_color white
  printf ' (O)'
  set_color $gray
  printf '|/'
  set_color white
  printf '(O) '
  set_color $gray
  printf ')\n'
  # Line 3
  set_color $light_gray
  printf '  \\ \b\\ \b\\ \b\\/'
  set_color $gray
  printf '  \\ \b___'
  printf '/'
  set_color $bronze
  printf 'U'
  set_color $gray
  printf '\\___/\n'
  # Line 4
  set_color $light_gray
  printf '    L\\       '
  set_color $bronze
  printf '||\n'
  # Line 5
  set_color $gray
  printf '     \\ \b\\ '
  set_color $gray
  printf '____'
  set_color $bronze
  printf '|||'
  set_color $gray
  printf '_____\n'
  # Line 6
  printf '      \\ \b\\ \b|'
  printf '=='
  set_color $bronze
  printf '|'
  set_color $lime
  printf '[]'
  set_color $gray
  printf '__'
  set_color $light_gray
  printf '/==|\\ \b'
  set_color $gray
  printf -- '-|\n'
  #Line 7
  printf '       \\ \b'
  set_color $yellow
  printf '|* '
  set_color $bronze
  printf '|'
  set_color $yellow
  printf '|'
  set_color $bronze
  printf '|'
  set_color $yellow
  printf '||'
  set_color $light_gray
  printf '\\==|/'
  set_color $gray
  printf -- '-|\n'
  # Line 8
  set_color $dark_gray
  printf '    ____'
  set_color $yellow
  printf '| *|[]['
  set_color $bronze
  printf ']'
  set_color $yellow
  printf -- '-- |'
  set_color $dark_gray
  printf '_\n'
  # Line 9
  printf '   ||EEE|'
  set_color $yellow
  printf '__E'
  set_color white
  printf 'E'
  set_color $yellow
  printf 'E'
  set_color white
  printf 'E'
  set_color $yellow
  printf '_['
  set_color $bronze
  printf ']_|'
  set_color $dark_gray
  printf 'EE\\ \b\n'
  # Line 10
  printf '   ||EEE|'
  set_color $gray
  printf '=O     O'
  set_color $dark_gray
  printf '|'
  set_color $gray
  printf '='
  set_color $dark_gray
  printf '|EEE|\n'
  # Line 11
  printf '   \\ \bLEEE|         \\ \b|EEE|  '
  set_color $brown
  printf '__))\n'
  # Line 12
  printf '                          ```\n'
end
