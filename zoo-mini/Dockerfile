FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-11-jdk-headless && rm -rf /var/lib/apt/lists/*;

# Install dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl rsync vim ssh python3 \
    && rm -rf /var/lib/apt/lists/*

ENV ZOO_VERSION 3.7.2
ENV ZOO_HOME /opt/apache-zookeeper-${ZOO_VERSION}
ENV ZOO_CONF_DIR ${ZOO_HOME}/conf
ENV HADOOP_VERSION 3.3.6
ENV HADOOP_HOME /opt/hadoop-${HADOOP_VERSION}
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop
ENV HADOOP_LOG_DIR ${HADOOP_HOME}/logs
ENV HADOOP_YARN_HOME ${HADOOP_HOME}

# Install Zookeeper
RUN set -x \
    && URL=https://downloads.apache.org/zookeeper/zookeeper-${ZOO_VERSION}/apache-zookeeper-${ZOO_VERSION}.tar.gz \
    && curl ${URL} | tar -xzC /opt \
    && cp ${ZOO_CONF_DIR}/zoo_sample.cfg ${ZOO_CONFIG}/zoo.cfg

# Install Hadoop
RUN set -x \
    && URL=https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
    && curl ${URL} | tar -xzC /opt

# Configure Hadoop
RUN echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" > ~/.bashrc
RUN JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac)))) \
    && sed -i "s:JAVA_HOME=.*:JAVA_HOME=${JAVA_HOME}:" ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh

# Configure ssh
RUN ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod 0600 /root/.ssh/authorized_keys \
    && echo "Host *\n  StrictHostKeyChecking no" > /root/.ssh/config

COPY files/*.xml.template ${HADOOP_CONF_DIR}/
COPY files/hadoop-start.py /root/
RUN chmod +x /root/hadoop-start.py

WORKDIR /root
ENTRYPOINT ["/root/hadoop-start.py"]