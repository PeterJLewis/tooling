#! /bin/bash
# For Kali
# plc-utils installation
sudo apt install plc-utils
sudo apt install plc-utils-extra
sudo apt install plc-utils-doc
# V2GInjector git clone
git clone https://github.com/FlUxIuS/V2GInjector
# Dependency Installation
sudo apt install python3.11-venv
python -m venv V2GInjector
source V2GInjector/bin/activate
pip install -r requirments.txt
cd V2GInjector
git submodule update --init --recursive
# Python3 Scapy Downgrade
pip uninstall scapy
pip install "scapy==2.4.4"
# pip2 Installation
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
sudo python2 get-pip.py
# Scapy for python2
sudo pip2 install setuptools
sudo pip2 install "scapy==2.4.4"
# V2GDecoder Setup
wget https://github.com/FlUxIuS/V2Gdecoder/releases/download/v1/V2Gdecoder.jar --directory-prefix=bin
rm V2GDecoder_default_run.sh
tee -a V2GDecoder_default_run.sh << END
#!/usr/bin/bash

java -jar bin/V2Gdecoder.jar -w
END
chmod +x V2GDecoder_default_run.sh
ln -s thirdparty/V2Gdecoder/schemas schemas
