# Essentials
sudo apt install -y git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl;

# Dotfiles
git clone git@github.com:juanknebel/.dotfiles.git;

ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf;

# Git
ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global;
git config --global core.excludesfile $HOME/.gitignore_global;
git config --global init.defaultBranch main;
git config --global user.email "juanknebel@gmail.com";
git config --global user.name "Juan Knebel";

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
mkdir -p $HOME/.config/rustfmt;
ln -s $HOME/.dotfiles/config/rustfmt/rustfmt.toml $HOME/.config/rustfmt;

# Pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
pyenv install 3.11;
pyenv global system;
pyenv local 3.11;

# Poetry
curl -sSL https://install.python-poetry.org | python3 -;
poetry completions fish > ~/.config/fish/completions/poetry.fish;

# Java
curl -s "https://get.sdkman.io" | bash ;
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
fisher install reitzig/sdkman-for-fish@v1.4.0;

# SSH
#ssh-keygen -t ed25519 -b 4096 -C "juanknebel@gmail.com";
eval (ssh-agent -c);
ssh-add $HOME/.ssh/id_ed25519;
#xclip -selection clipboard < $HOME/.ssh/id_ed25519.pub;
#pbcopy < $HOME/.ssh/id_ed25519.pub; #for macos


# Fish shell
#sudo usermod --shell /bin/fish $USER
mkdir -p $HOME/.config/fish/conf.d;
mkdir -p $HOME/.config/fish/functions;

# Fish extras
rm $HOME/.config/fish/config.fish;
ln -s $HOME/.dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish;
ln -s $HOME/.dotfiles/config/fish/config-alias-abbr.fish $HOME/.config/fish/config-alias-abbr.fish;
ln -s $HOME/.dotfiles/config/fish/functions/fish_greeting.fish $HOME/.config/fish/functions/fish_greeting.fish;

# Coding
ln -s $HOME/.dotfiles/config/fish/config-dev.fish $HOME/.config/fish/config-dev.fish;

# Linux
ln -s $HOME/.dotfiles/config/fish/config-linux.fish $HOME/.config/fish/config-linux.fish;
# For some local configuration that is only for this machine
touch $HOME/.config/fish/config-local.fish;

# z fuzzy search
mkdir -p $HOME/.local/share/z;
touch $HOME/.local/share/z/data;

cd $HOME/git;
git clone https://github.com/jethrokuan/z.git;
ln -s $HOME/git/z/functions/__z_add.fish $HOME/.config/fish/functions/__z_add.fish;
ln -s $HOME/git/z/functions/__z_clean.fish $HOME/.config/fish/functions/__z_clean.fish;
ln -s $HOME/git/z/functions/__z_complete.fish $HOME/.config/fish/functions/__z_complete.fish;
ln -s $HOME/git/z/functions/__z.fish $HOME/.config/fish/functions/__z.fish;
ln -s $HOME/git/z/conf.d/z.fish $HOME/.config/fish/conf.d/;

#### Command timer not install if starship is install
#cd $HOME/git
#git clone https://github.com/jichu4n/fish-command-timer.git;
#ln -s $HOME/git/fish-command-timer/conf.d/fish_command_timer.fish $HOME/.config/fish/conf.d;

# Starship prompt
mkdir -p $HOME/.fonts;
cd $HOME;
curl -fLo firaCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip;
unzip firaCode.zip -d $HOME/.fonts;
rm firaCode.zip;
echo 'starship init fish | source'>> $HOME/.config/fish/config-local.fish;
ln -s $HOME/.dotfiles/config/starship/starship.toml $HOME/.config/starship.toml;

