FROM node:slim as builder

WORKDIR /app

COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM node:slim as production

WORKDIR /app

COPY ./package*.json ./
RUN npm install --production

COPY ./public ./public
COPY --from=builder /app/dist ./dist
ENV TOKEN= PORT=3000

EXPOSE $PORT

CMD [ "node", "./dist/app.js" ]