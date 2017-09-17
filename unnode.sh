# filename:  install-nvm-npm-node
# author:    Lex Sheehan
# purpose:   To cleanly install NVM, NODE and NPM
# dependencies:  brew
echo "$REV""$CR""Uninstalling node...$CR$OFF"
echo "Enter your password to remove user some node-related /usr/local directories"
set -x
sudo rm -rf /usr/local/lib/node_modules
rm -rf /usr/local/lib/node
rm -rf /usr/local/include/node
rm -rf /usr/local/include/node_modules
rm /usr/local/bin/npm
rm /usr/local/lib/dtrace/node.d
rm -rf $HOME/.node
rm -rf $HOME/.node-gyp
rm /opt/local/bin/node
rm /opt/local/include/node
rm -rf /opt/local/lib/node_modules
rm -rf /usr/local/Cellar/nvm
brew uninstall node 2>/dev/null
{ set +x; } &>/dev/null
