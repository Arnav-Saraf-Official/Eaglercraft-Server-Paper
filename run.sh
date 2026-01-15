#!/bin/sh

# 1. Start the server in the background using '&'
# We use 'nohup' and redirect output to a file so it doesn't clutter your terminal
nohup java -Xmx2G -Xms2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled \
  -XX:+UnlockExperimentalVMOptions -Dcom.mojang.eula.agree=true \
  -jar paper-1.12.2.jar > server.log 2>&1 &

# 2. Wait a few seconds for the server to actually bind to the port
sleep 5

# 3. Now run your visibility commands
for port in $(gh codespace ports --json sourcePort -q '.[].sourcePort'); do
  gh codespace ports visibility "$port:public" -c "$CODESPACE_NAME"
done
