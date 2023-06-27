FROM archlinux

COPY mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm \
    --needed base-devel git vi vim wget tmux tree tldr

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
