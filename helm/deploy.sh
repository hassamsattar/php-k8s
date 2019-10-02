#!/bin/bash
set -ex

tag="$1"

sed -i "s/appVersion.*/appVersion: "$tag"/g" Chart.yaml

#kubectl delete secret project-env

helm upgrade api .  --wait --debug --set nginxImage.tag=$tag --set phpfpmImage.tag=$tag
