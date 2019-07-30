#!/usr/bin/env bash
# Prevents "Warning: apt-key output should not be parsed (stdout is not a terminal)".
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo -E apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo updating package information
sudo apt -y update >/dev/null 2>&1

sudo apt -y install git build-essential libreadline-dev zlib1g-dev libssl1.0-dev libsqlite3-dev  libxml2-dev
#sudo apt -y install libcurl4-openssl-dev

# Install Node.js(stable)
sudo apt install -y nodejs npm
sudo npm install n -g
sudo n stable

# Install rbenv
RBENV_DIR=/home/vagrant/.rbenv
git clone https://github.com/rbenv/rbenv.git ${RBENV_DIR}
echo "export RBENV_ROOT=${RBENV_DIR}" >> ~/.bash_profile
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ${RBENV_DIR}/plugins/ruby-build

# Install ruby 2.3.7
rbenv install 2.3.7
rbenv rehash
rbenv global 2.3.7

# Install Rails 5.0.2
gem install rails -v 5.0.2
gem install spring -v 1.7.2
cd /vagrant/fileupload-demo && bundle install