FROM            redhat/ubi9
RUN             dnf install python3-pip gcc python3-devel -y
RUN             useradd -u 1001 roboshop && mkdir /app && chown roboshop:roboshop /app
USER            roboshop
WORKDIR         /app
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN             pip3 install -r requirements.txt
ENTRYPOINT      [ ".local/bin/uwsgi", "--ini", "payment.ini" ]
