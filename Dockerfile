#FROM            redhat/ubi9
#RUN             dnf install python3-pip gcc python3-devel -y
#RUN             mkdir /app
#WORKDIR         /app
#COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
#RUN             pip3 install -r requirements.txt
#RUN             useradd -u 1001 roboshop && chown roboshop:roboshop /app
#USER            roboshop
#ENTRYPOINT      [ "uwsgi", "--ini", "payment.ini" ]

FROM            python:3.13.5
RUN             useradd -u 1001 roboshop && mkdir /app && chown roboshop:roboshop /app
WORKDIR         /app
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN             pip3 install -r requirements.txt
ENTRYPOINT      [ "uwsgi", "--ini", "payment.ini" ]
