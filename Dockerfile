FROM node:22-slim AS builder

WORKDIR /app

COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM node:22-slim AS production

WORKDIR /app

COPY ./package*.json ./
RUN npm install --production

COPY ./public ./public
COPY --from=builder /app/dist ./dist
ENV TOKEN= PORT=3000

EXPOSE $PORT

CMD [ "node", "./dist/app.js" ]