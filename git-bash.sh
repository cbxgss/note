#########################################################################
# File Name:    git-bash.sh
# Author:       程荣
# mail:         chengrong@tju.edu.cn
# Created Time: 2022年01月22日 星期六 16时51分59秒
#########################################################################
#!/bin/bash

function commit () {  
    cd $1
    echo `pwd`
    git add -A
    echo "git commit -m $2"
    git commit -m $2
    if [ "$1" != . ]
    then
        cd ..
    fi
}

function push() {
    cd $1
    echo `pwd`
    echo "git push gitee master"
    git push gitee master
    echo "git push origin master"
    git push origin master
    if [ "$1" != . ]
    then
        cd ..
    fi
}

while getopts ":l:g:.:p" opt
do
    case $opt in
        l)
            commit linux $OPTARG
        ;;
        g)
            commit 工具 $OPTARG
        ;;
        .)
            commit . $OPTARG
        ;;
        p)
            push linux
            push 工具
            push .
        ;;
        ?)
        echo "未知参数"
        ;;
    esac
done

