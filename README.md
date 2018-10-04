### Exercise 6.12 response outline
---
* Install & implement Redis
    * Redis implemented as comment counter
    * "set" can be found in : app/controllers/products_controller#show
    * "incr" can be found in : app/controllers/comments_controller#create
    * "get" can be found in : app/view/comments/create.js.erb
---
* Explain advantages of Redis over "normal cachinng"?
    * **Memcached** is an in-memory key/value data store which has the advantage of being multi-threaded
    * **Redis** :
        * is not just a key/value store, but a data-structure store
        * can be utiliized as a persistent NoSQL database
        * can be implemented as a message broker
        * supports snapshots, replication, namespaces, and transactions
        * offers Geospatial support...
---
* Research items for line item 2
    * [YouTube Tutorial](https://www.youtube.com/watch?v=Hbt56gFj998 "Brad Traversy Redis tutorial")
    * [Udemy Course](https://www.udemy.com/learn-redis-from-scratch/ "Eduonix Redis course")
    * [Ruby Client](https://github.com/redis/redis-rb "Redis Ruby client")
    * [Node Client](https://github.com/NodeRedis/node_redis "Redis Node client")
    * [AWS ElastiCache](https://aws.amazon.com/elasticache/redis-vs-memcached "MemcacheD versus Redis")
---
* List of *concrete* steps to application performance improvement: **un-resolved...**
    * AJAX
    * Caching
    * Indexing
    * Background processing
---
Taterz -
Jeff
