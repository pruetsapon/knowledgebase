# download our image
docker pull mongo

# run docker image
docker run 

# run type detached (background)
-d 

# set default port : host port
-p 27017:27017 

# container name
--name mongodb 

# map volume for save data
-v /docker/data/db:/data/db 

# image name
mongo

# open auth
--auth 

# connect mongo shell container
docker exec -it mongodb mongo admin

# create user
db.createUser({
  user: "admin", 
  pwd: "secure", 
  roles: [ { role: "root", db: "admin" } ]
})