# Fiddling with deployment of game prototypes

## Testing locally

The game in [client/game/](./client/game/) will run on [localhost:1337](http://localhost:1337)

```console
docker compose up
```

## With Analytics

```console
docker compose --profile analytics up
```

> Is your elastic search exiting with `code 78`? Then you need to increase the `max_map_count` on (ref [official documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-prerequisites)).

If you are using WSL 2, run this

```console
wsl -d docker-desktop
sysctl -w vm.max_map_count=262144
```

TODO: Try logging on the server, triggering some actions and watch it through Kibana. Continue from [here](https://www.youtube.com/watch?v=0acSdHJfk64&t=337s)

TODO: Maybe set up an account: https://github.com/deviantony/docker-elk/blob/main/.env
