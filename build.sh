#!/bin/bash

sudo docker build . --tag arleyschrock/dock-n-dock:latest
# sudo docker push arleyschrock/dock-n-dock:latest 
sudo ./dnd docker ps
