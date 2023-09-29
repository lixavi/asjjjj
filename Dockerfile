FROM node:14.2.0
LABEL project="angular-pro"
LABEL owner="vishant"
RUN npm install -g @angular/cli
RUN mkdir /code
ADD ./package.json /code
ADD ./package-lock.json /code
WORKDIR /code
RUN npm install
ADD . /code
EXPOSE 4200
CMD ["ng","serve","--host","0.0.0.0"]
