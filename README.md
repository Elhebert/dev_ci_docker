# dev_ci_docker

Small CI environment using Jenkins and Gitlab running in Docker containers.

inspired by [Maxfield F Stewart tutorials](http://engineering.riotgames.com/news/thinking-inside-container)

### Containers

- **Tyrael**: data container
- **imperius**: jenkins container
- **itherael**: gitlab container
- **auriel**: nginx container (proxy)

### Usage

> Makefile not working atm. But when it'll do, use the following commands

- `make build`: build containers
- `make run`: run containers
- `make stop`: stop containers
- `make clean`: stop containers and remove all but data
- `make clean-data`: remove data container
- `make clean-images`: remove all docker images
- `make backup-data`: backup all the data into data/
- `make restore-data`: restore backed up data

### Access

First, you need to add the following redirection into your host file:

```bash
127.0.0.1	imperius.archangel
127.0.0.1	itherael.archangel
```

Then simply access the diffent services with the corresponding url:

- `imperius.archangel/`: jenkins
- `itherael.archangel/`: gitlab

### TODO:

- [ ] Fix makefile (`$(<cli>)` are not interpreted or ommited)
- [x] Fix proxy (all requested ports are redirected to :80)
- [ ] Fix backup restoration path (folder is untar inside itself instead of merging with itself)
