if [ $(id -u) -ne 0 ]; then
    echo "This script must be run as root";
    exit 1;
fi

if [ $# -eq 2 ]; then

#    grep PATH /etc/environment > /tmp/env.tmp;
    printf \
        "export http_proxy=\"http://$1:$2\"\n\
export https_proxy=\"https://$1:$2\"\n
export ftp_proxy=\"http://$1:$2\"\n\
export no_proxy=\"localhost,127.0.0.1,localaddress,.localdomain.com\"\n\
export HTTP_PROXY=\"http://$1:$2\"\n\
export HTTPS_PROXY=\"https://$1:$2\"\n\
export FTP_PROXY=\"http://$1:$2\"\n\
export NO_PROXY=\"localhost,127.0.0.1,localaddress,.localdomain.com\"\n" >> $HOME/.dotfiles/profile_proxy;

#    cat /tmp/env.tmp > /etc/environment;

    printf \
        "Acquire::http::proxy \"http://$1:$2\";\n\
Acquire::ftp::proxy \"ftp://$1:$2\";\n\
Acquire::https::proxy \"https://$1:$2\";\n" > /etc/apt/apt.conf.d/95proxies;

#    rm -rf /tmp/env.tmp;
    
    #git config --global http.proxy http://$1:$2;
    
    # wget
    #cp $HOME/.wgetrc $HOME/.wgetrc.bak;
    #printf \
    #    "use_proxy=yes\nhttp_proxy=http://$1:$2\nhttps_proxy=https://$1:$2" >> $HOME/.wgetrc;

    # pip
    #printf \
    #    "alias pip=\"pip --proxy http://$1:$2\" \n" >> $HOME/.dotfiles/aliases_proxy;

    printf \
        "alias curl=\"curl --proxy http://$1:$2\" $* \n" >> $HOME/.dotfiles/aliases_proxy;

    # npm
    npm config set proxy http://$1:$2
    npm config set https-proxy http://$1:$2   

else

    printf "Usage $0 <proxy_ip> <proxy_port>\n";

fi
