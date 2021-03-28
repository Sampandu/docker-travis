# multi-step docker
# the default port of nginx is 80
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# privious phase is finsh before runing the next stage
FROM nginx
# from the previous phase, /usr/share/nginx/html is from the doc of nginx image
COPY --from=builder /app/build /usr/share/nginx/html
