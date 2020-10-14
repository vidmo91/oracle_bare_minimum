# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8


# select work directory
ADD . /app
WORKDIR /app

# instal libaio and instant client 
RUN apt-get update && apt-get -y install libaio-dev

#### automatic download
#RUN apt-get -y install wget
#RUN apt-get -y install unzip
#RUN wget https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip 
#RUN unzip instantclient-basic-linux.x64-19.8.0.0.0dbru.zip -d /app/lib 
#RUN rm instantclient*
#RUN cd /app

#select approperiate instant client version
#RUN echo /app/lib/instantclient_11_2 > /etc/ld.so.conf.d/oracle.config && ldconfig
#ENV LD_LIBRARY_PATH=/app/lib/instantclient_11_2:$LD_LIBRARY_PATH
RUN echo /app/lib/instantclient_19_8 > /etc/ld.so.conf.d/oracle.config && ldconfig
ENV LD_LIBRARY_PATH=/app/lib/instantclient_19_8:$LD_LIBRARY_PATH



# uncomment for instantclient_11_2
#RUN ln -s /app/lib/instantclient_11_2/libocci.so.11.1 /app/lib/instantclient_11_2/libocci.so
#RUN ln -s /app/lib/instantclient_11_2/libclntsh.so.11.1 /app/lib/instantclient_11_2/libclntsh.so




# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install pip requirements
ADD requirements.txt .
RUN python -m pip install -r requirements.txt



# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
#RUN useradd appuser && chown -R appuser /app
#USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "main.py"]
