FROM archlinux
RUN echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm \
    --needed base-devel git go vi vim wget tree tmux tldr

RUN echo "zhugy ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && useradd --create-home zhugy

USER zhugy
ENV GOPROXY https://goproxy.cn
RUN git clone https://aur.archlinux.org/yay /tmp/yay \
    && cd /tmp/yay \
    && makepkg -si --noconfirm \
    && rm -rf /tmp/yay

WORKDIR /home/zhugy

RUN sudo pacman -Syu --noconfirm jdk17-openjdk sbt
