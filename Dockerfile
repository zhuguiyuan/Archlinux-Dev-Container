FROM archlinux
RUN pacman -Syu --noconfirm \
    --needed git base-devel vi vim wget tree tmux

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
