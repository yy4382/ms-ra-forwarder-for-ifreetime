# pnpm is only used in the build stages; the production image ships plain node + node_modules.
FROM node:22-slim AS base

WORKDIR /app
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0
RUN corepack enable
COPY ./package.json ./pnpm-lock.yaml ./

FROM base AS builder

RUN pnpm install --frozen-lockfile
COPY ./ ./
RUN pnpm run build

FROM base AS prod-deps

RUN pnpm install --frozen-lockfile --prod

FROM node:22-slim AS production

WORKDIR /app

COPY ./package.json ./
COPY --from=prod-deps /app/node_modules ./node_modules
COPY ./public ./public
COPY --from=builder /app/dist ./dist
ENV TOKEN= PORT=3000

EXPOSE $PORT

CMD [ "node", "./dist/app.js" ]
