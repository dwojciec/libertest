#!/bin/bash
su -c "ltpconfigure.sh" -s /bin/bash tester
su -c "ltp start" -s /bin/bash tester
