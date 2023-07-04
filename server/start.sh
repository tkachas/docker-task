#!/bin/bash

gcc mini-server.c -lfcgi -o mini-server
spawn-fcgi -p 8080 ./mini-server
service nginx start
/bin/bash
