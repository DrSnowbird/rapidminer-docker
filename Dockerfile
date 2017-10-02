FROM openkbs/jre-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## ---- USER_NAME is defined in parent image: openkbs/jre-mvn-py3-x11 already ----
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}
        
WORKDIR ${HOME}

RUN wget -c https://s3.amazonaws.com/rapidminer.releases/rapidminer-studio/7.6.1/rapidminer-studio-7.6.1.zip && \
    unzip rapidminer-studio-7.6.1.zip 

RUN mkdir -p ${HOME}/workspace
VOLUME ${HOME}/workspace
    
USER ${USER_NAME}

CMD "${HOME}/rapidminer-studio/RapidMiner-Studio.sh"
