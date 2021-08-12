FROM python:3 as app_dependencies

COPY requirements.txt .
RUN pip3 install -U pip
RUN pip3 install -r ./requirements.txt

FROM app_dependencies

WORKDIR /.

ENV PROJECT_PATH="/."

COPY . .

ENTRYPOINT ["python","./gdax_bot.py"]
