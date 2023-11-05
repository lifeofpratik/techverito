FROM node:14

WORKDIR /app

COPY ./frontend/package.json /app/

COPY ./frontend .

RUN npm install 

EXPOSE 3000

CMD npm start