alias docker_cleanup_untagged_images="docker rmi \$(docker images | grep \"^<none>\" | awk '{print \$3}')"
alias docker_cleanup_unused_containers="docker ps -a | grep -E '(weeks|months) ago' | awk '{print $1}' | gxargs --no-run-if-empty docker rm"
