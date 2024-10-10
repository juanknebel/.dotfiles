function nv
  echo "1. Rust"
  echo "2. Go"
  echo "3. Python"
  echo "4. Java"
  echo "5. default"
  echo "6. Quit"

  set choice (read -P "Select the nvim configuration to use: "; echo $REPLY)

  if math "$choice" > /dev/null
    switch $choice
      case 1
        echo "Nvim for Rust selected"
        NVIM_APPNAME=nvim-rust nvim
      case 2
        echo "Nvim for Go selected"
        NVIM_APPNAME=nvim-go nvim
      case 3
        echo "Nvim for Python selected"
        NVIM_APPNAME=nvim-python nvim
      case 4
        echo "Nvim for Java selected"
        NVIM_APPNAME=nvim-java nvim
      case 5
        echo "Nvim default selected"
        nvim
      case 6
        echo "Bye"
      case '*'
        echo "Invalid option"
    end
  else
    echo "Invalid input. Please enter a number."
  end
end
