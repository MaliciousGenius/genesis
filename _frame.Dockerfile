FROM maliciousgenius/doer

# apt conf
ENV DEBIAN_FRONTEND=noninteractive

# apt update & upgrade
RUN apt-get update --quiet ; \
    apt-get upgrade --quiet --yes ;

# clearnup apt
RUN apt-get autoremove --yes ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ;

# подпись
LABEL MAINTAINER="Dmitriy Detkov"
LABEL MAIL="maliciousgenius@gmail.com"
LABEL TEL="+79604565686"
