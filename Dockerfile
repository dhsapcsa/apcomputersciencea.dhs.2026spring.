FROM jupyter/minimal-notebook:latest

# Install Java (for iJava)
USER root
RUN apt-get update && apt-get install -y default-jdk git

# Install the iJava kernel (lets us run Java inside Jupyter)
USER ${NB_USER}
RUN git clone https://github.com/SpencerPark/IJava.git && \
    cd IJava && \
    ./gradlew installKernel && \
    jupyter kernelspec list
