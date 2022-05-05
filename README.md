# Init
1. git init --bare $HOME/.cfg
2. alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
3. echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
4. dotfiles config --local status.showUntrackedFiles no
5. dotfiles remote add origin <remote-url>
6. dotfiles push -u origin master

# Installation or Migration
1. echo ".cfg" >> .gitignore
2. git clone --bare <remote-git-repo-url> $HOME/.cfg
3. alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
4. dotfiles config --local status.showUntrackedFiles no
5. config checkout
