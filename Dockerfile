FROM reg.notartificial.xyz:1443/development/python-runtime:0.1.1 as test

### Only for development
ARG builduser
ARG buildtoken
RUN git config --global url."https://$builduser:$buildtoken@github.com/artificialinc".insteadOf "https://github.com/artificialinc"
###

ADD Pipfile* /root/
RUN cd /root && pipenv install --dev --system --deploy && cd -

COPY . /app/

WORKDIR /app

RUN pyright
RUN flake8
RUN mypy
RUN python -m unittest discover -s adapter -v -b -f
RUN touch /force-preflight

FROM reg.notartificial.xyz:1443/development/python-runtime:0.1.1 as base

### Only for development
ARG builduser
ARG buildtoken
RUN git config --global url."https://$builduser:$buildtoken@github.com/artificialinc".insteadOf "https://github.com/artificialinc"
###

ADD Pipfile* /root/
RUN cd /root && pipenv install --system --deploy && cd -

COPY --from=test /force-preflight /dev/null
COPY adapter /app/adapter

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/python"]

FROM base as adapter

CMD ["/app/adapter/example_adapter.py"]
