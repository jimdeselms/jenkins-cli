FROM library/openjdk

ARG HOST
ARG AUTH

ENV JENKINS_AUTH=${AUTH}
ENV JENKINS_HOST=${HOST}

ENV COMMAND=help

WORKDIR /usr/bin

ADD ${HOST}/jnlpJars/jenkins-cli.jar .
ADD jenkins .

ENTRYPOINT ["bash", "jenkins"]
