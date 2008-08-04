#!/bin/sh
ssh lmcdental.lmcmc.com -L 5901:localhost:5901 -f -N
vncviewer :1
