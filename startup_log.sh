#!/bin/bash

# empty the previous log
truncate -s 0 startup.log

# log the startup times for nvim
nvim --startuptime startup.log
