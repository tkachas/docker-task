FROM nginx
USER root
WORKDIR /home/
ARG USERNAME=nginx

COPY /server.c /home/
COPY /nginx.conf /etc/nginx/
COPY /start.sh /home/
RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/*
RUN chmod 777 start.sh; \
    chmod 777 server; \
    chown 755 /bin/su; \
    chown 755 /usr/bin/chfn; \
    chown 755 /usr/bin/chage; \
    chown 755 /sbin/unix_chkpwd; \
    chown 755 /bin/umount; \ 
    chown 755 /usr/bin/gpasswd; \
    chown 755 /usr/bin/wall; \
    chown 755 /usr/bin/expiry; \
    chown 755 /usr/bin/newgrp; \
    chown 755 /usr/bin/passwd; \
    chown 755 /bin/mount; \
    chown 755 /usr/bin/chsh; \
    touch /var/run/nginx.pid

#USER $USERNAME

RUN chown -R nginx:nginx /var/run/nginx.pid; \
    chown -R nginx:nginx /var/log/nginx; \
    chown -R nginx:nginx /var/cache/nginx

HEALTHCHECK --interval=10s --timeout=30s --start-period=5s --retries=3 CMD curl -sS 127.0.0.1 || exit 1
CMD ["sh","./start.sh"]
