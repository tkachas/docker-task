FROM nginx
WORKDIR /home/
COPY ./server.c /home/
COPY ./nginx.conf /etc/nginx/
RUN ls -la /etc/nginx
COPY ./start.sh /home/
RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    apt clean && rm -rf /var/lib/apt/lists/*; \
    useradd server; \
    chown -R server:server /etc/nginx/nginx.conf; \
    chown -R server:server /var/cache/nginx; \
    chown -R server:server /home/; \
    touch /var/run/nginx.pid && chown -R server:server /var/run/nginx.pid; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/chfn; \
    chmod g-s /usr/bin/expiry; \
    chmod u-s /usr/bin/passwd; \
    chmod g-s /sbin/unix_chkpwd; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /usr/bin/wall; \
    chmod u-s /bin/umount; \
    chmod u-s /bin/mount; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/chsh;
USER server
HEALTHCHECK CMD curl http://localhost:81/ || exit 1
CMD ["sh", "./start.sh"]
