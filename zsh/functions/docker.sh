#!/bin/sh
function docker.bash () {
    docker exec -it $* /bin/bash
}
