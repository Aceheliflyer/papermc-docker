FROM openjdk:11-jre-slim

# Set Environment Variables
ENV \
  PAPER_BUILD="latest" \
  MINECRAFT_VERSION="latest" \
  MIN_MEMORY="512M" \
  MAX_MEMORY="1G" \
  JAVA_ARGS=" \
    -XX:+UseG1GC \
    -XX:+ParallelRefProcEnabled \
    -XX:MaxGCPauseMillis=200 \
    -XX:+UnlockExperimentalVMOptions \
    -XX:+DisableExplicitGC \
    -XX:+AlwaysPreTouch \
    -XX:G1NewSizePercent=30 \
    -XX:G1MaxNewSizePercent=40 \
    -XX:G1HeapRegionSize=8M \
    -XX:G1ReservePercent=20 \
    -XX:G1HeapWastePercent=5 \
    -XX:G1MixedGCCountTarget=4 \
    -XX:InitiatingHeapOccupancyPercent=15 \
    -XX:G1MixedGCLiveThresholdPercent=90 \
    -XX:G1RSetUpdatingPauseTimePercent=5 \
    -XX:SurvivorRatio=32 \
    -XX:+PerfDisableSharedMem \
    -XX:MaxTenuringThreshold=1 \
    -Dusing.aikars.flags=https://mcflags.emc.gs \
    -Daikars.new.flags=true"

# Upgrade system and install dependencies.
RUN apt update && apt upgrade -y && apt autoremove -y \
  && apt install wget jq -y --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Move to directory and copy files.
WORKDIR /home/papermc
RUN mkdir /minecraft
COPY index.sh .

# Start Script
CMD ["sh", "index.sh"]

# Container setup
VOLUME /home/papermc/minecraft
EXPOSE 25565
EXPOSE 25575