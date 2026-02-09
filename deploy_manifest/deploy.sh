#unzip manifestbuild.zip
#cd manifestbuild/templates/
#chmod +x ./*
#kubectl apply -f config.yaml
#kubectl apply -f secret.yaml
#kubectl apply -f deployment.yaml

#echo "Deployment Sucessfull"

#kubectl get deployment
#kubectl get pods
#kubectl get service


###this is to deploy via helm ####
helm pull oci://trialcpnyac.jfrog.io/cat-service-helm/manifestbuild --version 0.1.0
helm upgrade --install --history-max=1 --namespace default -f cat-sit/values_cat-sit.yaml .
