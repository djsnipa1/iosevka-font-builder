FROM gitpod/workspace-full

RUN sudo sed -i '50,$d' /etc/apt/sources.list
RUN sudo mkdir -p /scripts
COPY install.sh /scripts
WORKDIR /scripts
RUN sudo chmod +x install.sh
RUN ./install.sh