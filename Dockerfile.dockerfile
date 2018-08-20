FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt

# install node
RUN mkdir /home/node ;\
    cd /home/node ;\
    curl -sL https://deb.nodesource.com/setup_10.x | bash ;\
    apt-get install -y nodejs ;\
    node -v ;\
    npm -v

#install yarn
RUN cd /opt \
    && curl -Lo /opt/latest.tar.gz "https://yarnpkg.com/latest.tar.gz" \
    && wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --import \
    && curl -Lo /opt/latest.tar.gz.asc "https://yarnpkg.com/latest.tar.gz.asc" \
    && gpg --verify /opt/latest.tar.gz.asc \
    && mkdir /opt/yarn \
    && tar zvxf /opt/latest.tar.gz \
    && mv /opt/yarn-*/* /opt/yarn/ \
    && ls -al /opt/yarn \
    && ln -s /opt/yarn/bin/yarn /usr/bin/yarn

#install Manifold
RUN curl -o- https://raw.githubusercontent.com/manifoldco/manifold-cli/master/install.sh | MANIFOLD_DIR=/usr/local sh

ADD . /code/