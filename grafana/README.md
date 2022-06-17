# Configuring Grafana Docker Image

[link](https://grafana.com/docs/grafana/latest/administration/configure-docker/)

[Good tutorial](https://riamf.github.io/posts/dockerized_grafana_setup/)

## Add a data source



## Add a dashboard

1. `docker compose up`
2. Point your browser to Grafana and navigate to dashboards (default localhost:3000/dashboards)
3. Create a dashboard
4. Export it to JSON
5. Paste into `privisioning/dashboards/*.json`
6. Make sure you have a dashboard config file (e.g. `privisioning/dashboards/dashboard.yaml`)
7. (../docker-compose.yaml should push `provisioning/` to the container volume)
