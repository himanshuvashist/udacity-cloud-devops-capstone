#### Requirements and steps to setup jenkins server specific to this project's pipeline

- create EC2
- install docker in EC2 host
- install make
- install hadolint
- create jenkins container
  - install docker inside the container and connect with docker socket to host machine
  - change docker.sock permission to 777 for anyone to use it(kind of a hack to get it work)
  - jenkins setup
    - install docker plugin
