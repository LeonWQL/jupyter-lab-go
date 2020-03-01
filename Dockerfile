FROM jupyter/base-notebook
MAINTAINER leonwql

RUN set -x \
	# Install go
	&& conda install -y go \
	
	# Install gophernotes dependencies
	&& conda install -y -c conda-forge git \
	&& conda install -y -c anaconda zeromq \
	&& conda install -y -c kalefranz libc-musl \
	&& conda install -y -c conda-forge libgcc-ng \

	# Install gophernotes
	&& env GO111MODULE=on go get github.com/gopherdata/gophernotes

# Set GOPATH.
ENV GOPATH /go

EXPOSE 8888
CMD [ "jupyter", "lab", "--no-browser", "--allow-root", "--ip=0.0.0.0" ]