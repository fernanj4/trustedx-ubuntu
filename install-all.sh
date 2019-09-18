#!/bin/bash

everything() {
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  set -e

  # Currently Xenial local repositories are slow (?). 
  # Pass to U.S. servers for faster install
  # Remove this if not needed anymore
  # printf "${BLUE}Switching to U.S. archive servers...${NORMAL}\n"
  # sudo sed -i "s@/es.@/us.@" /etc/apt/sources.list

  # Install begins
  BRANCH="master"
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-distroupdate.sh -O -)"
  
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-basepackages.sh -O -)"

  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-vmguest.sh -O -)"
  
  # git+minimal config
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-git.sh -O -)"

  # Byobu+ZSH
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-byobu.sh -O -)"
  
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-powerlinefonts.sh -O -)"
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-golang.sh -O -)"
  
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-visualstudiocode.sh -O -)"

  # Docker, Docker Compose, Docker Machine
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-docker.sh -O -)"
  
  # Java
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-java.sh -O -)"
  
  # Google Chrome
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-chrome.sh -O -)"
  
  # ZSH+Oh-my-ZSH
  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-zsh.sh -O -)"

  bash -c "$(wget https://raw.githubusercontent.com/juancarlosfernandez/trustedx-ubuntu/$BRANCH/install-eclipse.sh -O -)"

  # Final recommendations
  printf "${YELLOW}Installation finished. A REBOOT is recommended now.${NORMAL}\n"
}

everything
