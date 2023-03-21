# Comparison of 'docker run' vs docker-compose

* Benefits of using this docker image using `docker run` vs docker-compose

## Pros and Cons
- docker-compose
    - Pros
        - is better used with handling/managing multiple services in a single 'docker-compose' environment
            + with the ability to start up, teardown multiple services in a single file as well as communicating with each other
    - Cons
        - Using docker-compose with a service that stops on completion is difficult to manage
- `docker run` 
    - Pros
        - is better used with services that are not running 100% of the time, and will stop on completion.
            - i.e. 
                1. Using rust to compile via `cargo build {--release}` and stop.
    - Cons
        - Using this with multiple services will take a bit of work

