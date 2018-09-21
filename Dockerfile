FROM python:3.7.0-alpine

# Make a place to put all of the code
RUN mkdir /code
WORKDIR /code

# Upgrade pip
RUN pip install -U pip

# Install python dependencies
ADD requirements.txt /code/

RUN pip install -r requirements.txt

RUN mkdir /html
WORKDIR /html
ADD html/index.html /html/
ADD html/image.png /html/

EXPOSE 8088
CMD [ "python3", "-m", "http.server", "8088" ]
