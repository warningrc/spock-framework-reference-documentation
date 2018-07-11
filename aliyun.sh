#!/bin/bash

gitbook build

rsync -artvz --delete ./_book/ aliyun:/data/webroot/gitbook/spock/
