# Task 02 on Phase 02

This repo for [Task 02](https://learningdevops.makvaz.com/phase2-task2-run-blog-in-containers).

----

You need to indicate the plugin version at build time for the Dockerimage, either by using

```
$ docker build <dockerfile_path> -t <my_tag> --build-arg PLUGIN_VERSION=8
```

or

```
$ docker compose build --build-arg PLUGIN_VERSION=8
$ docker compose up
```
---

To completely destroy the resources created by docker compose run:

```
$ docker-compose down --volumes

$ docker volume rm $(docker volume ls -q)
```
