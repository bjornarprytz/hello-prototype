# Fiddling with deployment of game prototypes

## Testing locally

The game in [client/example/](client/example/) will run on [localhost:1337](http://localhost:1337)

```console
docker compose up
```

> Is your elastic search exiting with `code 78`? Then you need to increase the `max_map_count` on (ref [official documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-prerequisites)).

If you are using WSL 2, run this

```console
wsl -d docker-desktop
sysctl -w vm.max_map_count=262144
```
