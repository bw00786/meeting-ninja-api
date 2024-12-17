FROM python:3.9-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_HOME=/app

WORKDIR $APP_HOME

COPY requirements.txt .

RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

COPY . .

RUN mkdir -p $APP_HOME/upload $APP_HOME/output \
    && chown -R nobody:nogroup $APP_HOME

EXPOSE 32000

USER nobody



CMD ["python", "MeetingNotesGeneratorAPI.py"]
