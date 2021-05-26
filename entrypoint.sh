#!/bin/sh -l

if [ $1 == 'neo' ]
then
    # build mtar file
    mbt build --mtar -p=neo -t ui5app.mtar
    # deploy mtar file to cloud
    neo.sh deploy-mta --host $4 --account $5 --source ./ui5app.mtar --synchronous --user $2 --password $3
elif [ $1 == 'bsp' ]
then
    # deploy app as BSP
    ui5-deployer deploy --user $2 --pwd $3
else
   echo "Please provide valid deployment type. Allowed values are neo and bsp"
fi
