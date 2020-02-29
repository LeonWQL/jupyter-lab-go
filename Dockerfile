FROM gopherdata/gophernotes

RUN pip3 install jupyterlab     

CMD [ "jupyter", "lab", "--no-browser", "--allow-root", "--ip=0.0.0.0" ]