# simple-jetty-docker

Just a quick example on how to push a hawt-app artifact into a docker build, which could be run independant of openshift.

```
oc new-project fis1

export REGISTRY_IP=$(oc get svc/docker-registry -n default -o json | jq -r .spec.clusterIP)

docker build -t $REGISTRY_IP:5000/fis1/jetty-docker:latest . 
docker login -u admin -p `oc whoami -t` $REGISTRY_IP:5000
docker push $REGISTRY_IP:5000/fis1/jetty-docker:latest

# Please note the IP is fixed in this YAML file
oc create -f jetty-docker-dc.yaml

```