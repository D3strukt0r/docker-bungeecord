==========================
Using Docker Compose
==========================

Configuring
==========================

Create a file called :code:`docker-compose.yml` under e. g. :code:`/opt/mc-server` and add:

.. code-block:: yaml

    version: '2'

    services:
      bungeecord_1:
        image: d3strukt0r/bungeecord
        ports:
          - 25565:25577
        volumes:
          - ./data:/data
        environment:
          - JAVA_MAX_MEMORY=1G

Starting the server
==========================

.. code-block:: bash

    docker-compose up -d

Reading the logs
==========================

.. code-block:: bash

   docker-compose logs -f

Sending commands
==========================

.. code-block:: bash

    docker-compose exec bungeecord_1 console "<command>"

Stopping the server
==========================

.. code-block:: bash

   docker-compose down
