#!/bin/sh
echo "Starting"
java -Xmx2G -Xms2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:+UnlockExperimentalVMOptions -Dcom.mojang.eula.agree=true -jar paper-1.12.2.jar
