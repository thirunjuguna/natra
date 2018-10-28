# <%= @name.camel_case %> service

## Commands
```
natra -v              # Show Natra version number
natra help [COMMAND]  # Describe available commands or one specific command
natra new APP-NAME    # Creates a new Sinatra application
natra model NAME      # Generate a model
natra controller NAME # Generate a controller
natra scaffold NAME   # Generate a model with its associated views and controllers
```
The controller generator also have an optional views flag `--no-views` to create controllers without views.

## Using Natra

To generate your app:

    natra new APP-NAME

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

