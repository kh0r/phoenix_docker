FROM elixir:1.4
MAINTAINER docker@mklepp.com

# Install hex
RUN mix local.hex --force

# Install phoenixframework
# A list of phoenix releases can be found here:  https://github.com/phoenixframework/archives
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.1.ez

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
  && apt-get install -y nodejs build-essential inotify-tools \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
ADD . /app

# Create a new app:
# Comment the lines below this comment block (they will not work for now)
# and run (replace #AppName# and #app_name#)
# $ docker build -t phoenix_build .
# $ docker run -it --rm -v $(pwd):/app phoenix_build mix phoenix.new . --binary-id --module #AppName# --app #app_name#
# $ docker rmi phoenix_build
# After this you can uncomment the lines below and run docker-compose up
# Don't forget to change your db settings (pw: '', hostname: 'db') in config/dev.exs
# and run docker-compose run --rm dev mix ecto.create && mix ecto.migrate

# phoenix stuff
RUN mix deps.get
RUN npm install

EXPOSE 4000
CMD ["mix", "phoenix.server"]
