# <%= @name.camel_case %> service

## Development

This project is configured to run in Docker containers facilitated by `docker-compose`. [nib](https://github.com/technekes/nib) is our tool of choice for interacting with `docker-compose` in development.


### Running the app

Use [nib](https://github.com/technekes/nib) to build and start up the web app.

```sh
nib build --pull
nib up
```

### Running Tests

The app is configured to use [guard](https://github.com/guard/guard) facilitate running the tests as files change. To start up guard run:

```sh
nib guard web
```

Alternatively the specs can be run as a one-off with:

```sh
nib rspec web
```

