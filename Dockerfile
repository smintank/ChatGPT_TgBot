FROM python:3.9

WORKDIR /home

ENV OPENAI_API="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"
ENV TG_BOT_TOKEN="6087247347:AAEmaczMH3xKT7BK_ZwwskwxOSKQrNSoP1c"
ENV TELEGRAM_ACCESS_ID='220697264'
# ENV TELEGRAM_ACCESS_ID2='501372585'


ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip install -U aiogram && pip install openai
COPY *.py ./

ENTRYPOINT ["python", "main.py"]