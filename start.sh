`# get oh my zsh`
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

touch ~/.zshrc

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

. ~/.zshrc

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev


`#need to change version`
rbenv install 2.3.0
rbenv global 2.3.0

gem install bundler
gem install rails
