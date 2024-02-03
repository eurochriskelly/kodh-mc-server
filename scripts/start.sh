#!/bin/bash

java -Xmx3048M -Xms3048M -jar paper.jar nogui

main() {
    # Minecraft server command
    MC_COMMAND="java -Xmx3048M -Xms3048M -jar paper.jar nogui"
    PID_FILE="minecraft_server.pid"

    # Function to kill the existing Minecraft server
    kill_minecraft_server() {
        if [ -f "$PID_FILE" ]; then
            PID=$(cat "$PID_FILE")
            echo "Killing existing Minecraft server with PID $PID"
            kill "$PID"
            rm "$PID_FILE"
        else
            echo "No existing Minecraft server found."
        fi
    }

    # Main script logic
    echo "Checking for existing Minecraft server..."
    if [ -f "$PID_FILE" ]; then
        read -p "Minecraft server is already running. Do you want to kill it? (y/n): " yn
        case $yn in
            [Yy]* ) kill_minecraft_server;;
            [Nn]* ) echo "Exiting..."; exit;;
            * ) echo "Invalid response. Exiting..."; exit;;
        esac
    fi

    echo "Starting Minecraft server..."
    nohup "$MC_COMMAND" > minecraft_server.log 2>&1 &
    echo $! > "$PID_FILE"
    echo "Minecraft server started with PID $!"
}

#main "$@"