# multi-step process
FROM node:alpine as builder 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second from terminates each block
FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx already starts it up

