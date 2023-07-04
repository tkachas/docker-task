FROM nginx
USER root
WORKDIR /home/
ARG USERNAME=nginx

COPY /nginx.conf /etc/nginx/
COPY /nginx_start.sh /home/

RUN chmod 777 nginx_start.sh; \
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

HEALTHCHECK NONE
CMD ["sh","./nginx_start.sh"]
