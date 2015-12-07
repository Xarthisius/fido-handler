FROM docker.io/gentoo/stage3-amd64
MAINTAINER xarthisius.kk@gmail.com

EXPOSE 8888

RUN emerge-webrsync && emerge -1v www-servers/tornado mercurial && rm -rf /usr/portage/*
RUN useradd -m fido
RUN mkdir /srv && hg clone https://bitbucket.org/xarthisius/fido-prhandler /srv/prhandler
RUN chown fido:fido -R /srv/prhandler

USER fido
WORKDIR /srv/prhandler
CMD ["python", "main.py"]
