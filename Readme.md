# Dock-n-Dock

Docker in docker containers.


I use it to push to a custom registry from within VSTS hosted builds. Probably just because I can.


    docker run --rm arleyschrock/dock-n-dock bash -c "docker push server:port/name"
