#!/bin/bash
sudo su - postgres -c "pgsvr -s pgdefault -y start"
sudo -su - tester  -c "ltpconfigure.sh" 
sudo -su - tester  -c "ltp start"
