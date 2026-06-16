Applications:
- xclip

Aliases:
alias configbashrc="nvim ~/.bashrc"
alias confignvim="nvim ~/.config/nvim/init.lua"
alias heroic="flatpak run com.heroicgameslauncher.hgl"
alias btop="sudo btop"
alias gs-="git status"
alias gd-="git diff --ignore-all-space"
alias ga-="git add"
alias gco-="git commit"
alias gps-="git push"
alias gpl-="git pull"
alias gl-="git log"
alias start-ai="(docker rm -f open-webui 2>/dev/null; docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -e OLLAMA_BASE_URL='http://host.docker.internal:11434' -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main && export OLLAMA_HOST='0.0.0.0' && export OLLAMA_ORIGINS='*' && ollama run gemma4:31b-cloud </dev/null >/dev/null 2>&1) >/dev/null 2>&1 & echo 'AI is on 🤖⚡'"
alias stop-ai="sudo pkill ollama ; docker stop open-webui ; docker rm open-webui ; echo 'AI is off 🪦🥀'"

Configs:
- Remove light-locker to prevent screen from automatically turning off and locking
    sudo apt purge light-locker
    - also, disable with this system-level command

    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

- Add these to /etc/environment to prevent cedilla bug:
    `GTK_IM_MODULE=cedilla
    QT_IM_MODULE=cedilla`

- Running gammastep at startup
    Session and Startup -> Application Autostart
    Add: sh -c 'sleep 1 && gammastep -P -O 3000'
        (this has to sleep because if it doesnt, it will be overwritten by something in startup)

- installing waterfox:
    download .tar.bz2, extract, move extracted `/waterfox` folder to `/opt/`
    create a symbolic link so the system can locate the executable from anywhere
        `sudo ln -s /opt/waterfox/waterfox /usr/local/bin/waterfox`

- setting <Super>p shortcut:
    add command `bash /home/{user}/scripts/toggle-displays.sh`

