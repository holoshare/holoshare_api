FROM elixir:1.6

RUN mix local.hex --force
RUN mix local.rebar --force


RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new-1.3.2.ez --force

# install node
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs

RUN apt-get install -y inotify-tools

COPY . /app

WORKDIR /app

RUN mix do deps.get, compile

WORKDIR /app/assets

RUN npm install
RUN node node_modules/brunch/bin/brunch build

WORKDIR /app

CMD mix phx.server
