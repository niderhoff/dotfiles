if [ $(id -u) -ne 0 ]; then

    echo "This script must be run as root";
    exit 1;

else

    #grep PATH /etc/environment > /tmp/env.tmp;
    unset http_proxy;
    unset ftp_proxy;
    unset https_proxy;
    unset HTTP_PROXY;
    unset FTP_PROXY;
    unset SFTP_PROXY;
    #cat /tmp/env.tmp > /etc/environment;
    rm $HOME/.dotfiles/profile_proxy;

    cp /dev/null /etc/apt/apt.conf.d/95proxies;

    cp /dev/null $HOME/.dotfiles/aliases_proxy;

    #git config --global --unset http.proxy;

    # cp /dev/null $HOME/.wgetrc;
    #cp $HOME/.wgetrc.bak $HOME/.wgetrc;

    echo "Removed all system wide proxy settings.\nYou need to re-login to the shell now.";

fi
