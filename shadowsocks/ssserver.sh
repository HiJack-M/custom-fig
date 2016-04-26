#!/bin/bash

ulimit -n 51200
ssserver -c /root/fig/shadowsocks/config.json
