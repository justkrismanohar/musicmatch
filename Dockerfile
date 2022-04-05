FROM python:3.9

COPY . .

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp

ENV FLASK_APP run.py
# gunicorn
CMD ["gunicorn", "flask", "run:app"]
