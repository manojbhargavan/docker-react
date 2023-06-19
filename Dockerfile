# Base Build
FROM node:16-alpine as builder

# Working Dir
WORKDIR /usr/reactbuild

# Copy 
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# Base Container
FROM nginx
EXPOSE 80
COPY --from=builder /usr/reactbuild/build /usr/share/nginx/html