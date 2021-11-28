FROM beevelop/ionic AS ionic
WORKDIR /usr/src/spp
COPY package*.json ./
RUN npm ci
COPY . .
RUN ionic build
FROM nginx:alpine
COPY --from=ioinc /usr/src/app/www /usr/share/nginx/html
