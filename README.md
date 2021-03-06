# Dock-n-Dock

Docker in Docker container.

I use it to push to a custom registry from within VSTS hosted builds when insecure-registries needs to be updated in /etc/docker/daemon.json. The command is passed through an entrypoint script which builds out the JSON array that insecure-registries gets set to, writes daemon.json, and restarts the container local docker service. The registries that get added are specified by REGISTRY(n) environment variables that are passed when launching the container.


    docker run -d --rm \
        --name junk
        -e REGISTRY1=abc.foo.com:2929 \
        -e REGISTRY2=def.foo.com:8393 \
        arleyschrock/dock-n-dock \
        tail -f /dev/null

    docker exec junk service docker start
    docker exec junk docker <command>

Assuming you wish to push an image that was built outside of the launched container:
    
    # Example:
    docker build . --tag abc.foo.com/foocontainer:latest

    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock
        -e REGISTRY1=abc.foo.com:2929 \
        -e REGISTRY2=def.foo.com:8393 \
        arleyschrock/dock-n-dock \
        docker push abc.foo.com:2929/foocontainer:latest