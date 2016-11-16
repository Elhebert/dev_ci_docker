IMAGES = $(docker images -q --filter="dangling=true")
PWD = $(pwd)

build:
	@docker-compose build

run:
	@docker-compose up -d

stop:
	@docker-compose stop

clean: stop
	@docker-compose rm imperius auriel itherael

clean-data:
	@docker-compose rm -v tyrael

clean-images:
	@docker rmi $(IMAGES)

backup-data:
	@docker run --rm --volumes-from=tyrael -v $(PWD)/data:/backup debian tar cvf /backup/jenkins-home.tar /var/jenkins_home
	@docker run --rm --volumes-from=tyrael -v $(PWD)/data:/backup debian tar cvf /backup/gitlab-conf.tar /etc/gitlab
	@docker run --rm --volumes-from=tyrael -v $(PWD)/data:/backup debian tar cvf /backup/gitlab-appdata.tar /var/opt/gitlab

restore-data:
	@docker run --rm --volumes-from=tyrael -v $(PWD)/data:/backup debian bash -c "cd /var/jenkins_home && tar xvf /backup/jenkins-home.tar --strip 1"
	@docker run --rm --volumes-from=tyrael -v $(PWD)/data:/backup debian bash -c "cd /var/opt/gitlab && tar xvf /backup/gitlab-appdata.tar --strip 1"
	@docker run --rm --volumes-from=tyrael -v $(PWD)/data:/backup debian bash -c "cd /etc/gitlab && tar xvf /backup/gitlab-conf.tar --strip 1"
