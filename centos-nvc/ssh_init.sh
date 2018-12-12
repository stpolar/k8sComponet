#!/bin/bash
DEFAULT_ROOTPASSWORD=changeme
if [ ${ROOTPASSWORD} ]; then
  echo "root:$ROOTPASSWORD" | chpasswd
else
  echo "root:$DEFAULT_ROOTPASSWORD" | chpasswd
fi
