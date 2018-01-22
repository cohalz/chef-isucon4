if [ -f /etc/bashrc ]; then
      . /etc/bashrc
  fi

  export PATH=/usr/local/bin:$PATH
  export PATH=/usr/local/go/bin:$PATH
  export PATH=/home/ec2-user/.local/ruby/bin:$PATH
  export PATH=/home/ec2-user/.local/node/bin:$PATH
  export PATH=/home/ec2-user/.local/python/bin:$PATH
  export PATH=/home/ec2-user/.local/perl/bin:$PATH
  export PATH=/home/ec2-user/.local/php/bin:$PATH
  export PATH=/home/ec2-user/.local/php/sbin:$PATH
  export GOPATH=/home/ec2-user/gocode
  
