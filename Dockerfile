# FROM python:2.7.16-alpine3.9

# RUN apk add --no-cache bash git curl rsync openssh-client py3-pip py3-requests py3-paramiko python3-dev libffi-dev libressl-dev libressl build-base && \
#   pip3 install -U pip && \
#   pip3 install ansible==2.8.4 && \
#   apk del --no-cache python3-dev libffi-dev libressl-dev build-base

# RUN wget -O vault.zip https://releases.hashicorp.com/vault/1.1.2/vault_1.1.2_linux_amd64.zip && unzip vault.zip -d /usr/local/bin && chmod u+x /usr/local/bin/vault && rm vault.zip
# RUN wget -O consul.zip https://releases.hashicorp.com/consul/1.5.1/consul_1.5.1_linux_amd64.zip && unzip consul.zip -d /usr/local/bin && chmod u+x /usr/local/bin/consul && rm consul.zip

# # RUN pip install ansible && pip install --upgrade pip && pip install boto && pip install openpyxl boto3 && pip install ansible-ec2-inventory
# # RUN pip install packaging 'azure==4.0.0' apache-libcloud pycrypto python-consul hvac 'hvac[parser]' 
# ADD /inc/entrypoint.sh /

# ENTRYPOINT ["/entrypoint.sh"]

FROM python:3

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

RUN wget -O consul.zip https://releases.hashicorp.com/consul/1.5.1/consul_1.5.1_linux_amd64.zip && unzip consul.zip -d /usr/local/bin && chmod u+x /usr/local/bin/consul && rm consul.zip

ADD /inc/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]