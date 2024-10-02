ARG POSTGRES_VERSION="17-alpine"
ARG PGTAP_VERSION="v1.3.3"

FROM postgres:${POSTGRES_VERSION}

# The postgres container will run all scripts within the initdb.d directory on launch
COPY create-extension.sql /docker-entrypoint-initdb.d/

RUN set -ex && \
    apk add --no-cache make \
    git \
    patch \
    perl && \
    git clone https://github.com/theory/pgtap.git && \
        cd pgtap/ && \
        git checkout ${PGTAP_VERSION} && \
        make && \
        make install
