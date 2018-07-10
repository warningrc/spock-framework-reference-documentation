#!/bin/bash

gitbook build

scp -r ./_book//* aliyun:/data/webroot/gitbook/spock/
