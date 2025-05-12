# Dockerfile
FROM ubuntu:22.04

# Install all needed packages, software and dependencies
RUN apt-get update
RUN apt-get install -y python3-pip 
RUN yes | apt-get install software-properties-common
RUN apt-add-repository ppa:swi-prolog/stable
RUN apt-get update
RUN yes | apt-get install swi-prolog
# RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections swipl pack install prosqlite
RUN printf "1\ny\ny" | swipl pack install prosqlite

# Copy program into the container
COPY . /home

# Set working directory
WORKDIR /home

# Default command to run
ENTRYPOINT ["swipl", "main.pl"]