# Dockerfile
FROM ubuntu:22.04

# Install all needed packages, software and dependencies
RUN apt-get update
RUN apt-get install -y python3-pip 
RUN yes | apt-get install software-properties-common
RUN apt-add-repository ppa:swi-prolog/stable
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-tk
RUN yes | apt-get install swi-prolog
RUN printf "1\ny\ny" | swipl pack install prosqlite
RUN python3 -m pip install --user virtualenv
RUN yes | apt-get install python3-venv
RUN python3 -m venv home/env
RUN . home/env/bin/activate && pip install setuptools --upgrade && pip install janus_swi && pip install flask

# Copy program into the container
COPY . /home

# Set working directory
WORKDIR /home

# Default command to run
ENTRYPOINT ["bash", "-c", ". /home/env/bin/activate && python3 server.py"]

EXPOSE 8000