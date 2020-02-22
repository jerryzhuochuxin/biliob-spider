FROM python:3.6

RUN mkdir /biliob-spider

COPY . /biliob-spider
COPY requirements.txt /biliob-spider
RUN pip install -r /biliob-spider/requirements.txt -i https://pypi.douban.com/simple
WORKDIR /biliob-spider
