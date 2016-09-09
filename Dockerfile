FROM centos:7

RUN yum update -y

COPY installation/ /root/

WORKDIR /root

RUN sh install_loris.sh

RUN sh run_user_commands.sh

RUN echo "/opt/local/loris/lib" >> /etc/ld.so.conf.d/loris-imageserver.conf && ldconfig

WORKDIR /opt/local/loris
USER loris

EXPOSE 5004
CMD ["python", "loris/launcher.py"]
