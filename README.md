# QGIS-desktop-Docker

## Linux

Currently, this is linux-only.

Before running this docker-compose, 
you need to allow docker locally access to your x-server:
`xhost +local:docker`.

```bash
docker-compose pull && docker-compose up -d
```