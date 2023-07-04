## Part 1

- `docker pull`

  - ![](./img/1-1.png)

- `docker images`

  - ![](./img/1-2.png)

- `docker run -d nginx` and `docker ps`

  - ![](./img/1-3.png)

- `docker inspect $(docker ps | grep nginx | awk '{print $1}')`

  - ![](./img/1-4.png)
  - Container size: `docker inspect` **does not provide** size info. To find out container size we can use `docker ps -s`
  - List of mapped ports: `"Ports": { "80/tcp": null }`
  - Container IP: `"IPAddress": "172.17.0.2"`

- `docker stop $(docker ps | grep nginx | awk '{print $1}')` and `docker ps`:

  - ![](./img/1-5.png)

- `docker run` on ports 80 andd 443:

  - ![](./img/1-6.png)

- `localhost:80`:

  - ![](./img/1-7.png)

- `docker restart $(docker ps | grep nginx | awk '{print $1}')`:

  - ![](./img/1-8.png)

- `docker ps`

  - ![](./img/1-9.png)

## Part 2

- Read _nginx.conf_ using `docker exec -it $(docker ps | grep nginx | awk '{print $1}') cat /etc/nginx/nginx.conf`:

  - ![](./img/2-1.png)

- Created _nginx.conf_ using `vim nginx.conf` and _/status_ path configuration:

  - ![](./img/2-2.png)

- `docker cp` - Copy the created _nginx.conf_ file inside the docker image:

  - ![](./img/2-3.png)

- Restart **nginx** inside the docker image with _exec_:

  - ![](./img/2-4.png)

- _localhost:80/status_ using `curl`:

  - ![](./img/2-5.png)

- `docker export ID > container.tar` + `docker stop ID` + `docker ps` (the last one to check if it stopped):

  - ![](./img/2-6.png)

- `docker rmi nginx -f`:

  - ![](./img/2-7.png)

- `docker rm CONTAINER_ID`:

  - ![](./img/2-8.png)

- import container.tar:

  - ![](./img/2-9.png)

- `curl localhost:80/status`:

  - ![](./img/2-10.png)
