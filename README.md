# docker-bungeecord

Use the BungeeCord Proxy as a Docker App.

Docker | Travis (master) | Travis (develop)
--- | --- | ---
![Docker Stars](https://img.shields.io/docker/stars/d3strukt0r/bungeecord.svg)<br />![Docker Pulls](https://img.shields.io/docker/pulls/d3strukt0r/bungeecord.svg) | ![Travis (.com) branch](https://img.shields.io/travis/com/D3strukt0r/docker-bungeecord/master) | ![Travis (.com) branch](https://img.shields.io/travis/com/D3strukt0r/docker-bungeecord/develop)

## Getting Started

These instructions will cover usage information and for the docker container

### Prerequisities

In order to run this container you'll need docker installed.

*   [Windows](https://docs.docker.com/windows/started)
*   [OS X](https://docs.docker.com/mac/started/)
*   [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Docker CLI

To start the server use the following command:
```shell script
docker run -i -t -p 25565:25577 -v $(pwd)/data:/data d3strukt0r/bungeecord -Xms512M -Xmx512M
```

##### `-i -t`
To be able to type commands directly in your terminal `-i -t` or `-it`. However, this won't allow you detach from it with `Ctrl + C`. To start it detached from the beginning use `-d`

##### `-p 25565:25577`
BungeeCord uses `25577` as a default port, however, you should use `25565`, which is Minecraft's default port (`-p 25565:25577`).

##### `-v $(pwd)/data:/data`
It is not necessary to add any volumes, but if you do add it (`-v <host_dir>:/data`), your data will be saved. If you don't add it, it is impossible to change any config file, or add plugins.

##### `d3strukt0r/docker-bungeecord`
This is the repository on Docker Hub.

##### `-Xms512M -Xmx512M`
To add arguments, like memory limit, simply add them after the repo inside the command. Or when using a `docker-compose.yml` file, put it inside `command: ...`.

```shell script
docker run -d -p 25565:25577 -v $(pwd)/data:/data --name bungeecord d3strukt0r/bungeecord -Xms512M -Xmx512M
```

##### `-d`
Run detached (in the background)

##### `--name bungeecord`
Give this container a name for easier reference later on.

#### Docker CLI (with `screen`)

However there is no way to attach back to it, so instead use a library in linux which is known as "screen":

```shell script
screen -d -m -S "bungeecord" docker run -i -t -p 25565:25577 -v $(pwd)/data:/data d3strukt0r/bungeecord -Xms512M -Xmx512M
```

##### `screen -d -m -S "bungeecord"`
Creates like a window in the terminal which you can easily leave and enter.

You can detach from the window using `CTRL` + `a` and then `d`.

To reattach first find your screen with `screen -r`. And if you gave it a name, you can skip this.

Then enter `screen -r bungeecord` or `screen -r 00000.pts-0.office` (or whatever was shown with `screen -r`)

#### Docker Compose

Example `docker-compose.yml` file:
```yml
version: '2'

services:
  bungeecord:
    image: d3strukt0r/bungeecord
    command: -Xms512M -Xmx512M
    ports:
      - 25565:25577
    volumes:
      - ./data:/data
```

And then use `docker-compose up` or `docker-compose up -d` for detached. Again using the experience with linux's `screen` library

#### Volumes

* `/data` - (Optional)

    Here go all data files, like: configs, plugins, logs, icons

## Built With

* [Java](https://www.java.com/de/) - Programming Language
* [OpenJDK](https://hub.docker.com/_/openjdk) - The Java conatainer in Docker
* [BungeeCord](https://ci.md-5.net/job/BungeeCord/) - The main software
* [Travis CI](https://travis-ci.com/) - Automatic CI (Testing) / CD (Deployment)
* [Docker](https://www.docker.com/) - Building a Container for the Server

## Find Us

*   [GitHub](https://github.com/D3strukt0r/docker-bungeecord)
*   [Docker Hub](https://hub.docker.com/r/d3strukt0r/bungeecord)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the
[tags on this repository](https://github.com/D3strukt0r/docker-bungeecord/tags).

## Authors

* **Manuele Vaccari** - [D3strukt0r](https://github.com/D3strukt0r) - *Initial work*

See also the list of [contributors](https://github.com/D3strukt0r/docker-bungeecord/contributors) who
participated in this project.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.txt](LICENSE.txt) file for details

## Acknowledgments

* Geoff Bourne with [itzg/docker-bungeecord](https://github.com/itzg/docker-bungeecord)
* James Rehfeld with [rehf27/docker-bungeecord](https://github.com/rehf27/docker-bungeecord)
* Leopere with [Leopere/docker-bungeecord](https://github.com/Leopere/docker-bungeecord)
* Hat tip to anyone whose code was used
* Inspiration
* etc
