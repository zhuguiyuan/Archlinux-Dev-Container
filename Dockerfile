FROM archlinux
RUN pacman -Syu --noconfirm --needed git base-devel

RUN echo "zhugy ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && useradd --create-home zhugy

USER zhugy
ENV GOPROXY https://goproxy.cn
RUN git clone https://aur.archlinux.org/yay /tmp/yay \
    && cd /tmp/yay \
    && makepkg -si --noconfirm \
    && rm -rf /tmp/yay

WORKDIR /home/zhugy
