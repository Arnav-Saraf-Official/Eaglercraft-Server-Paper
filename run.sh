#!/bin/sh
echo "Starting"
gh codespace ports visibility 25565:public -c "$CODESPACE_NAME"
java -Xmx2G -Xms2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:+UnlockExperimentalVMOptions -Dcom.mojang.eula.agree=true -jar paper-1.12.2.jar
