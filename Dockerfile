#!/usr/bin/env bash

hubName=mattybee

images=(
    gcr.io/google_containers/heapster-amd64:v1.3.0-beta.1
    gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.5
    gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.5
    gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.5
    gcr.io/google_containers/kubernetes-dashboard-amd64:v1.6.1
    gcr.io/google_containers/heapster-grafana-amd64:v4.0.2
    gcr.io/google_containers/heapster-influxdb-amd64:v1.3.3
    gcr.io/kubernetes-helm/tiller:v2.3.0
)

for imageName in ${images[@]} ; do
    imgName=$(echo ${imageName} | cut -d"/" -f3)
    docker pull $imageName
    docker tag $imageName $hubName/$imgName
    docker push $hubName/$imgName
done
