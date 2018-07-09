FROM ubuntu:16.04 

ENV DEBIAN_FRONTEND noninteractive

RUN rm -f /bin/sh.distrib && \
    ln -s bash /bin/sh.distrib && \
    rm -f /bin/sh && \
    ln -s bash /bin/sh && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    apt-get update && \
    apt-get install -y libxi6 libgtk2.0-0 libcanberra-gtk-module libxrender1 libxtst6 libxext6 libfreetype6 git libsecret-1-0 gnome-keyring && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
    
EXPOSE 8080
ENTRYPOINT ["/bin/bash"]