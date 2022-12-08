# docker run parameters vs docker-compose comparison

## DESCRIPTION
```
This documentation aims to show the corresponding parameters between docker run and docker-compose
```

## Differences
- Stay in terminal:
    + docker run : -t
    + docker-compose : "tty: true"
- Open in standard input (aka Interactive Mode):
    + docker run : -i
    + docker-compose : "stdin_open: true"
