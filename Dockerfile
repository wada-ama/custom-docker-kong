FROM kong:2.0

# switch to root to install rocks in /usr/local
USER root

# the list of plugins to install
COPY plugins.txt /

# install all plugins
RUN cut -f 1-2 plugins.txt | xargs -n 2 luarocks install

# back to kong user
USER kong