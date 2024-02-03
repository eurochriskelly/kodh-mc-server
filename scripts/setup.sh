#!/bin/bash

# TODO: get latest paper
#       update links       



main() {
    clear
    setup_folders
    get_latest_paper
    setup_minecraft_service
}

setup_minecraft_service() {
    cp scripts/start.sh /opt/minecraft/start.sh
    cp resources/eula.txt /opt/minecraft/eula.txt
    cp resources/server.properties /opt/minecraft/server.properties
}

setup_folders() {
    sudo mkdir /opt/minecraft
    sudo chmod -R 777 /opt/minecraft
}

get_latest_paper() {

    api=https://api.papermc.io/v2

    # Get the build number of the most recent build
    latest="$(
        curl -s -X 'GET' \
        "${api}/projects/paper" \
        -H 'accept: application/json' \
        | node scripts/parseJson.js --latest \
    )"
    echo "Latest Version: $latest"

    echo "Getting build number for version $latest"
    build="$(
        curl -s -X 'GET' \
        "${api}/projects/paper/versions/${latest}" \
        -H 'accept: application/json' \
        | node scripts/parseJson.js --build \
    )"

    echo "Build: $build"

    # Construct & download URL
    echo "Downloading Paper $latest build $build"
    wget "${api}/projects/paper/versions/${latest}/builds/${build}/downloads/paper-${latest}-${build}.jar"
    mv "paper-${latest}-${build}.jar" /opt/minecraft/paper.jar
}

main "$@"