FROM node:alpine3.16 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# expose is used by ebs to allow incoming traffic
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html