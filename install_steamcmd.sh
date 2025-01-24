#!/bin/bash

# Update and install dependencies
sudo apt update
sudo apt install -y cmake build-essential git wget tar

# Install box86
git clone https://github.com/ptitSeb/box86
cd box86
mkdir build
cd build
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make
sudo make install
cd ../..

# Create a directory for SteamCMD
mkdir ~/steamcmd
cd ~/steamcmd

# Download and extract SteamCMD
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz

# Create a script to run SteamCMD with box86
echo '#!/bin/bash' > run_steamcmd.sh
echo 'box86 ~/steamcmd/steamcmd.sh "$@"' >> run_steamcmd.sh
chmod +x run_steamcmd.sh

echo "Installation complete. Use ~/steamcmd/run_steamcmd.sh to run SteamCMD."