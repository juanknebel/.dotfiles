#!/usr/bin/fish

function install_software
    echo "**** SOFTWARE ****"
    echo "Installing essentials"

    switch (uname)
        case Linux
            # Ubuntu Essentials
            if [ "Ubuntu" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Ubuntu"
                essentials_ubuntu
            end
            if [ "EndeavourOS" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "EndevourOS"
                essentials_arch
            end
        case '*'
            # Do nothing
    end
    echo "Done."
end

function essentials_ubuntu
    sudo apt install -y git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm lldb libncurses-dev xz-utils tk-dev libffi-dev liblzma-dev python3 openssl xclip clang libpq-dev sqlite3 libmysqlcppconn-dev libmysqlclient-dev fish eza wget curl gnupg protobuf-compiler;
    sudo apt install ca-certificates curl; 
    sudo install -m 0755 -d /etc/apt/keyrings;
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg;
    sudo chmod a+r /etc/apt/keyrings/docker.gpg;
		echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
    sudo apt-get update;
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;
    sudo usermod -a -G docker $USER;
		sudo systemctl start docker.service;
		sudo systemctl enable docker.service;
end

function essentials_arch
    sudo pacman -S peco openssh noto-fonts-emoji unzip zip xclip zsh cmake wget curl llvm openssl zlib lzlib readline sqlite ncurses xz tk libffi python-pyopenssl clang libpqxx eza;
    sudo pacman -S docker;
    sudo usermod -a -G docker $USER;
    sudo systemctl start docker.service;
    sudo systemctl enable docker.service;
    sudo systemctl start bluetooth;
    sudo systemctl enable bluetooth;
    #sudo systemctl start sshd.service
    #sudo systemctl enable sshd.service


end

install_software

