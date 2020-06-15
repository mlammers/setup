# Init rbenv
eval "$(rbenv init -)"

export ANDROID_HOME=~/Library/Android/sdk
export GRADLE_OPTS="-Dorg.gradle.daemon=true"
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export GITHUB_ACCESS_TOKEN="13c32c53711c60c789b193bd7e5b10a253667570"
export SOURCE_ACCESS_TOKEN="2d7c70afe9d4209d90b470add6e32e65422d1858"
export PATH="${PATH}:/Applications/sonar-scanner/bin"

export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/Users/maikel.lammers/"

 #Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


#Aliases

alias x='exit'
alias be='bundle exec'
alias co='git checkout'
alias pf='git push --force-with-lease'
alias rb='git rebase origin/master'
alias st='git status'
alias lint='./node_modules/.bin/eslint'
alias ll='ls -l'
alias tag='ctags -R'
alias ca='git commit --amend'
alias drm='docker rm -vf $(docker ps -a -q)'
alias drmi='docker rmi -f $(docker images -a -q)'

# Switch project
alias sp='cd $(find ~/projects -maxdepth 1 -type d | selecta)'

# Switch git branch
alias br='git branch | cut -c 3- | selecta | xargs git checkout'

# Show repo history visually
alias repo_history='gource -1280x720 -a 1 --seconds-per-day 1'

# find and replace
# find . -name \*.rb -exec sed -i '' -e "s/fetch_additional_payload/fetch_additional_information/g" {} \;

export PATH="$HOME/.exenv/bin:$PATH"

# added by Anaconda3 5.1.0 installer
export PATH="/Users/maikel.lammers/anaconda3/bin:$PATH"
