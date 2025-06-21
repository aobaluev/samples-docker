# docker_image_info 

Image name: samples-docker/1.1.dockerfile_hello:v1.0 

Date run: Sat Jun 21 11:56:30 PM +07 2025 


## docker images 
```
REPOSITORY                            TAG       IMAGE ID       CREATED       SIZE
samples-docker/1.1.dockerfile_hello   v1.0      857d0dc1f804   11 days ago   117MB
```


## docker inspect 
```json
[
    {
        "Id": "sha256:857d0dc1f804a5b4549e92f3ba906474bbed1a6d986c0ced04747e24bd645a12",
        "RepoTags": [
            "samples-docker/1.1.dockerfile_hello:v1.0"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2025-06-10T00:00:00Z",
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "echo",
                "Hello from docker"
            ],
            "ArgsEscaped": true
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 116546602,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/e282736d399cf5d39e4b756de87d01928389e35553def5d00abed0ab876034f0/merged",
                "UpperDir": "/var/lib/docker/overlay2/e282736d399cf5d39e4b756de87d01928389e35553def5d00abed0ab876034f0/diff",
                "WorkDir": "/var/lib/docker/overlay2/e282736d399cf5d39e4b756de87d01928389e35553def5d00abed0ab876034f0/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:8f003894a7efc4178494f1e133497ed2f325ae53b6a65869e54c04d1c51d588f"
            ]
        },
        "Metadata": {
            "LastTagTime": "2025-06-21T23:35:48.534108098+07:00"
        }
    }
]
```
