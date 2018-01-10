# Arena in Alpine docker

Latest [Arena](https://github.com/bee-queue/arena) web GUI in an alpine based docker image. That's it.

Create custom `/tmp/index.json`:
```json
 {
   "__example_queues": [
     {
       "name": "my_queue",
       "port": 6381,
       "host": "127.0.0.1",
       "hostId": "AWS Server 2"
     }
   ],
   "queues": []
 }
 ```

Create an arena container.

```sh
docker run -d \
--name arena \
-p 4567:4567 \
-v /tmp/index.json:/opt/arena/src/server/config/index.json \
odlevakp/arena:latest
```
