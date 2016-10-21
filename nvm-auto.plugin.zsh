# Switch node version using nvm if the need arises
function nvm_auto_switch {
  unset NVM_RC_VERSION
  CUR_VERSION=$(node -v |cut -c 2-)
  nvm_rc_version > /dev/null 2>&1

  if [ -z "${NVM_RC_VERSION}" ]
  then
      export NVM_RC_VERSION=$(nvm_version default | cut -c 2-)
  fi

  if [ "v${NVM_RC_VERSION}" != "v${CUR_VERSION}" ]
  then
    nvm use || nvm use default
  fi
}

function nvm_auto_version {
  echo v1.0.0
}


autoload -U add-zsh-hook
add-zsh-hook chpwd nvm_auto_switch
