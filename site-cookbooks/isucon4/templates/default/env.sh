#!/bin/sh

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/home/ec2-user/.local/ruby/bin:$PATH
export PATH=/home/ec2-user/.local/node/bin:$PATH
export PATH=/home/ec2-user/.local/python/bin:$PATH
export PATH=/home/ec2-user/.local/perl/bin:$PATH
export PATH=/home/ec2-user/.local/php/bin:$PATH
export PATH=/home/ec2-user/.local/php/sbin:$PATH
export GOPATH=/home/ec2-user/gocode
[ ! -d $GOPATH/src ] && mkdir -p $GOPATH/src

export ISU4_SESSION_SECRET=27a4909d7cc3da7a5a07a925fbbb4d4e2b44db5b
export ISU4_USER_LOCK_THRESHOLD=3
export ISU4_IP_BAN_THRESHOLD=10
export ISU4_DB_HOST=10.0.0.30
export ISU4_DB_PORT=3306
export ISU4_DB_USER=isucon
export ISU4_DB_PASSWORD=isucon
export ISU4_DB_NAME=isu4_qualifier

export ISU4_DB_READ_PORT=3307
exec $*
