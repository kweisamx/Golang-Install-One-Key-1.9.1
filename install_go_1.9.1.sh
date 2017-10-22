#!/bin/bash

echo "INSTALL GO NOW........"
# install dependent package
sudo apt update -y && sudo apt install -y wget 

if [ ! -f go1.9.1.linux-amd64.tar.gz ]; then 
    echo "download go package"
    wget https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
fi


# tar the go package and move  to /usr/local ,
sudo tar -C /usr/local -xzf go1.9.1.linux-amd64.tar.gz

# export the PATH to add go binary
export PATH=$PATH:/usr/local/go/bin
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc

# go to user directory and set GOPATH
export GOPATH=$HOME/go
echo "export GOPATH=$HOME/go" >>$HOME/.bashrc


cd $HOME
if [ ! -d $HOME/go/ ]; then
    mkdir -p $HOME/go/src
fi

# test go work

if [ ! -d $HOME/go/src/hello ]; then
    mkdir -p $HOME/go/src/hello
fi

#make go hello.go
cat <<EOF >  $HOME/go/src/hello/hello.go
package main

import "fmt"

func main() {
    fmt.Printf("\n\n\nhello, world, the script is finish\nplease type to check \"go version\"\nGood Luck!\n")
    }
EOF
# test 
go run  $HOME/go/src/hello/hello.go


