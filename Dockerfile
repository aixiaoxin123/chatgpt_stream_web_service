# build front-end
FROM node:lts-alpine

RUN npm install pnpm -g

WORKDIR /app
COPY . /app


RUN pnpm install


RUN pnpm run build


EXPOSE 3002

CMD ["pnpm", "run", "prod"]
