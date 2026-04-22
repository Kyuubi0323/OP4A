#!/bin/bash

CONTAINER_ID=$(docker ps --filter "name=model-zoo" --format "{{.ID}}" | head -1)

if [ -z "$CONTAINER_ID" ]; then
    echo "Error: No running model-zoo container found."
    echo "Running containers:"
    docker ps --format "  {{.ID}}  {{.Names}}  {{.Image}}"
    exit 1
fi

echo "Attaching to container: $(docker ps --filter "id=$CONTAINER_ID" --format "{{.Names}} ({{.ID}})")"
docker exec -it "$CONTAINER_ID" /bin/bash
