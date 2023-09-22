FROM intersystemsdc/iris-community

EXPOSE 8000

COPY ./requirements.txt /home/irisowner/django-todo/

ENV PATH=/home/irisowner/.local/bin:${PATH}

RUN \
  cd /home/irisowner/django-todo && \
  pip3 install -r requirements.txt

COPY ./ /home/irisowner/django-todo/

ENTRYPOINT [ "/tini", "--", "/home/irisowner/django-todo/entrypoint.sh" ]
