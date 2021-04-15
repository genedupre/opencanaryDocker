#edit the config to the desired behaviour
vim .conf/opencanary.conf
#build the container
docker build --rm -t opencanarycontainer .
#run it
docker run -dit -p 21:21 -p 80:80 --name opencanary-container1 opencanarycontainer
#see logs
docker exec -it opencanary-container1 bash -c 'cat /var/tmp/opencanary.log'
