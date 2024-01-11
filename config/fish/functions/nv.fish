function nv
  echo "1. CyberNvim"
  echo "2. AstroNvim"
  echo "3. KickstarNvim"
  echo "4. default"
  echo "5. Quit"

  set choice (read -P "Select the nvim configuration to use: "; echo $REPLY)

  if math "$choice" > /dev/null
    switch $choice
      case 1
        echo "CyberNvim selected"
        NVIM_APPNAME=CyberNvim nvim
      case 2
        echo "AstroNvim selected"
        NVIM_APPNAME=AstroNvim nvim
      case 3
        echo "KickstarNvim selected"
        NVIM_APPNAME=KickstarNvim nvim
      case 4
        echo "Using the defualt nvim configuration"
        nvim
      case 5
        echo "Bye"
      case '*'
        echo "Invalid option"
    end
  else
    echo "Invalid input. Please enter a number."
  end
end
