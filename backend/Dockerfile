FROM node:20 AS backend-dev

WORKDIR /usr/local/app

COPY ./package.json ./package-lock.json ./
RUN --mount=type=cache,id=package,target=/usr/local/share/.cache/package \
    npm install --frozen-lockfile
COPY ./spec ./spec
COPY ./src ./src

EXPOSE 3000

CMD ["npm", "run", "dev"]


FROM backend-dev AS test
RUN npm run test