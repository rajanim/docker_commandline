# intall colima
brew install colima
​
# install docker
brew install docker
​
# install docker-compose
brew install docker-compose
​
# docker-compose is now a plugin that needs to have a symlink created for docker to find it
mkdir -p ~/.docker/cli-plugins
ln -sfn /usr/local/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
​
# Initial startup of lima is needed to get a working vm for running the docker container(s)
# The example below creates a VM with 4 cpus and 10G of memory mounting the RedisGitRepos directory
colima start --cpu 4 --memory 10 --mount $HOME/RedisGitRepos
​
# The line below now creates a docker container named redis, with the RedisGitRepos directory in the VM mouunted to the 
# /var/opt/project directory in the docker container
docker run -d --name redis -v $HOME/RedisGitRepos:/var/opt/project  -p 6379:6379 redis:latest
