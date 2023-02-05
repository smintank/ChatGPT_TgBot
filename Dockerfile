FROM python:3.9

WORKDIR /home

ENV OPENAI_API=""
ENV TG_BOT_TOKEN=""
ENV TELEGRAM_ACCESS_ID=''
# ENV TELEGRAM_ACCESS_ID2=''


ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip install -U aiogram && pip install openai
COPY *.py ./

ENTRYPOINT ["python", "main.py"]