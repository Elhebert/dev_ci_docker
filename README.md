# dev_ci_docker

Small CI environment using Jenkins and Gitlab running in Docker containers.

inspired by [Maxfield F Stewart tutorials](http://engineering.riotgames.com/news/thinking-inside-container)

### Containers

- **Tyrael**: data container
- **imperius**: jenkins container
- **itherael**: gitlab container
- **auriel**: nginx container (proxy)

### Usage

> Makefile not working atm. But when it'll use the following commands

- `make build`: build containers
- `make run`: run containers
- `make stop`: stop containers
- `make clean`: stop containers and remove all but data
- `make clean-data`: remove data container
- `make clean-images`: remove all docker images
- `make backup-data`: backup all the data into data/
- `make restore-data`: restore backed up data

### Access

- `localhost:80`: jenkins
- `localhost:8010`: gitlab

### TODO:

- [ ] Fix makefile (`$(<cli>)` are not interpreted or ommited)
- [ ] Fix proxy (all requested ports are redirected to :80)
- [ ] Fix backup restoration path (folder is untar inside itself instead of merging with itself)
