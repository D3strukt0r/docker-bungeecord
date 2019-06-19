# docker-bungeecord

Use the BungeeCord Proxy as a Docker App.

![Docker Stars](https://img.shields.io/docker/stars/d3strukt0r/docker-bungeecord.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/d3strukt0r/docker-bungeecord.svg)

## Getting Started

These instructions will cover usage information and for the docker container

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

To start the server use the command given below. To be able to type commands directly in your terminal `-i -t` or `-it`. However, this won't allow you detach from it with `Ctrl + C`. To start it detached from the beginning use `-d`

BungeeCord uses `25577` as a default port, however, you should use `25565`, which is Minecraft's default port (`-p 25565:25577`).

Important to know, is the the `/plugins` and `/config` volumes are mandatory (`-v <host_dir>:/plugins`, `-v <host_dir>:/config`), for this setup. The icon volume is optional if you want to use an icon (`-v <host_dir>:/icon`)

```shell
docker run -i -t -p 25565:25577 -v D:\bungeecord_plugins:/plugins -v D:\bungeecord_config:/config d3strukt0r/docker-bungeecord
```

In addition, use the environment variables from the next paragraphs to your desire with e. g. `-e JAVA_MEMORY=1G`.

#### Environment Variables

* `BUNGEECORD_BASE_URL` - (Default: [https://ci.md-5.net/job/BungeeCord]())

  The base URL from where to get the file

* `BUNGEECORD_VERSION` - (Default: `lastStableBuild`)

  The build version to download (the default is set to take the last stable one)

* `BUNGEECORD_FILE_URL` - (Default: `/artifact/bootstrap/target/BungeeCord.jar`)

  The end part of the URL

* `BUNGEECORD_URL` - (Default: `${BUNGEECORD_BASE_URL}${BUNGEECORD_VERSION}${BUNGEECORD_FILE_URL}`)

  Can be set to something completely custom

* `JAVA_MEMORY` - (Default: `512M`)

  The Java memory heap size to specify to the JVM.

* `JAVA_BASE_MEMORY` - (Default: `${JAVA_MEMORY}`)

  Can be set to use a different initial heap size.

* `JAVA_MAX_MEMORY` - (Default: `${JAVA_MEMORY}`)

  Can be set to use a different max heap size.

* `JAVA_OPTIONS` - (No default value)

  Additional -X options to pass to the JVM.

#### Volumes

* `/plugins` - (Required)

  Put all the `.jar` plugins in here

* `/config` - (Required)

  Put the `config.yml` in here

* `/icon` - (Optional)

  Put the `server-icon.png`

#### Useful File Locations

* `/app/start.sh` - This is the start script, which gets all the files and starts the server.

* `/app` - This is directory created in the Docker environment, and where all files will be put.

## Built With

* [OpenJDK v12](https://hub.docker.com/_/openjdk)
* [BungeeCord](https://ci.md-5.net/job/BungeeCord/)

## Find Us

* [GitHub](https://github.com/D3strukt0r/docker-bungeecord)
* [Docker Hub](https://hub.docker.com/r/d3strukt0r/bungeecord)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the
[tags on this repository](https://github.com/D3strukt0r/docker-bungeecord/tags).

## Authors

* **Manuele Vaccari** - *Initial work* - [D3strukt0r](https://github.com/D3strukt0r)

See also the list of [contributors](https://github.com/D3strukt0r/docker-bungeecord/contributors) who
participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* Geoff Bourne with [itzg/docker-bungeecord](https://github.com/itzg/docker-bungeecord)
* James Rehfeld with [rehf27/docker-bungeecord](https://github.com/rehf27/docker-bungeecord)
* Leopere with [Leopere/docker-bungeecord](https://github.com/Leopere/docker-bungeecord)
