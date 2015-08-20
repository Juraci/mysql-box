#!/bin/bash
dir=${0%/*}

red=`tput setaf 1`
green=`tput setaf 2`

# Description: sends the message to the standard output
# parameters: $@ string to be appended in the log file
logger.log_it() { echo "$@"; }

# Description: logs the message in the standard output and returns 0
# parameters: $@ whatever is passed to be logged
success() { logger.log_it "$@"; return 0; }

# Description: logs the message in the standard output and returns 1
# parameters: $@ whatever is passed to be logged
failure() { logger.log_it "$@"; return 1; }

# Description: verifies if the command passed as argument exists in 0
# parameters: $@ shell commands to be called
assertions.verify_command() {
  eval "$@" > /dev/null
  if [ $? -eq 0 ]; then
    success "${green}[Command OK] ------: $@"
  else
    failure "${red}[Command FAIL] ----: $@"
  fi
}

assertions.verify_command vagrant --version
if [ $? -ne 0 ]; then
  printf "${red} looks like you don't have Vagrant available, please follow this instructions: \n http://docs.vagrantup.com/v2/installation/index.html"
  exit 1
fi

assertions.verify_command ansible --version
if [ $? -ne 0 ]; then
  printf "${red} looks like you don't have Ansible available, please follow this instructions: \n http://docs.ansible.com/ansible/intro_installation.html"
  exit 1
fi

assertions.verify_command bundle --version
if [ $? -ne 0 ]; then
  printf "${green} looks like you don't have Bundler available \n it's optional, but without it you will not be able to run 'rake specs'\n"
fi

printf "${green} looks like you are good to go, just a few more steps: \n 1. check the variables inside roles/database/vars/main.yml \n 2. add your own mysql dump file (.slq) inside roles/database/files/ \n 3. run 'vagrant up db'"
