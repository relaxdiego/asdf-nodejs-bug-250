#!/usr/bin/env bash

set -e

ASDF_VERSION="v0.8.1"
ASDF_INSTALL_DIR="${HOME}/.asdf"

if [[ ! -d ${ASDF_INSTALL_DIR} ]]; then
  git clone https://github.com/asdf-vm/asdf.git ${ASDF_INSTALL_DIR} --branch ${ASDF_VERSION}
fi

source $ASDF_INSTALL_DIR/asdf.sh

if ! asdf plugin-list | grep nodejs; then
  asdf plugin add nodejs
fi

asdf install nodejs

# Pull known bad commit
cd ~/.asdf/plugins/nodejs
git reset --hard
git checkout 54113a909bcc7325eae6a1824e87d5e8cfe0a0c3

asdf reshim
