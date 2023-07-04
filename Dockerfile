FROM python:3.10

#RUN apt-get update -qq
#RUN apt-get install python3.10 python3-pip -y --no-install-recommends && rm -rf /var/lib/apt/lists_/*

RUN /usr/local/bin/python -m pip install --upgrade pip

WORKDIR /chroma

COPY ./requirements.txt requirements.txt

RUN apt-get update && apt-get install -y gcc libpq-dev build-essential python3-dev python3-pip python3-venv python3-wheel 

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./bin/docker_entrypoint.sh /docker_entrypoint.sh
COPY ./ /chroma

EXPOSE 8000

CMD ["/docker_entrypoint.sh"]
