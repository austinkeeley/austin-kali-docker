FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get -y upgrade 

# Install basic compilers and interpreters
RUN apt-get -y install build-essential \
                       binutils \
                       gdb \
                       python3 \
                       python3-virtualenv \
                       git

# Network scanning and monitoring
RUN apt-get -y install curl \
                       nmap \
                       hping3 \
                       tcpdump \
                       p0f

# Password cracking
RUN apt-get -y install john \
                       wordlists

# The hydra package requires GTK so I'm just going to compile it myself
RUN apt-get install -y libpcre3-dev
RUN git clone https://github.com/vanhauser-thc/thc-hydra.git && \
    cd thc-hydra && \
    ./configure && \
    make && \
    make install

# Web related
RUN apt-get -y install dirb \
                       nikto

# Binary exploration
RUN apt-get -y install radare2 \
                       gdb-peda \
                       binwalk \
                       bvi \
                       peepdf

# Post exploitation 
RUN apt-get -y install backdoor-factory

# Misc
RUN apt-get -y install neovim \
                       zsh \
                       silversearcher-ag \
                       ssh

# Personal dot files
RUN mkdir -p ~/.config/nvim
RUN curl https://raw.githubusercontent.com/austinkeeley/dotfiles/master/init.vim > ~/.config/nvim/init.vim

# X11 GUI applications that you might not need. 
# Wireshark running on the host can read piped data from tcpdump
# RUN apt-get -y install wireshark

# Aliases
RUN echo "alias egrep='egrep --color=auto'" >> ~/.bashrc && \
    echo "alias fgrep='fgrep --color=auto'" >> ~/.bashrc && \
    echo "alias grep='grep --color=auto'" >> ~/.bashrc && \
    echo "alias l='ls -CF'" >> ~/.bashrc && \
    echo "alias la='ls -A'" >> ~/.bashrc && \
    echo "alias ll='ls -alF'" >> ~/.bashrc && \
    echo "alias ls='ls --color=auto'" >> ~/.bashrc

CMD "/bin/bash"
