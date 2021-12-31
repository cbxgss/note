# g++

## 重要参数

-   -g: 产生带调试信息的可执行文件

    ```shell
    g++ -g test.cpp -o test
    ```

-   -O[n]: 优化源代码

    ```shell
    g++ -O2 test.cpp
        # -O0: 不优化
        # -O1: 默认优化
        # -O2: 有额外调整，如指令调整
        # -O3: 包括循环展开等
    ```

-   -l和-L: 指定库文件 | 指定库文件路径

    ```shell
    g++ -lglog test.cpp		# 链接glog库，/lib, /usr/lib, /usr/local/lib中
    g++ -L/home/chengrong/lib -lglog test.cpp	# 链接glog.so
    ```

-   -I: 制定头文件搜索目录

    ```shell
    g++ -I/home/chengrong/qwq test.cpp		# qwq/下有.h
    ```

-   -Wall: 打印警告信息

    ```shell
    g++ -Wall test.cpp
    ```

-   -w: 关闭警告信息

    ```shell
    g++ -w test.cpp
    ```

-   -std=c++11

    ```shell
    g++ -std=c++11 test.cpp
    ```

-   -o: 指定文件输出名

-   -D: 定义宏

    ```shell
    g++ -DDEBUG test.cpp		# 定义宏DEBUG
    ```

## 编译

### 静态库生成可执行文件

```bash
# 生成swap.o文件
g++ swap.cpp -c -I../include

# 生成静态库libswap.a
ar rs libswap.a swap.o

# 链接，生成可执行文件
g++ main.cpp -Iinclude -Lsrc -lswap -o main
```

### 动态库生成可执行文件

```bash
# 生成动态库libswap.so
g++ swap.cpp -I../include -fPIC -shared -o libswap.so
# 上面等价于下面两条命令
g++ swap.cpp -I../include -c -fPIC
g++ -shared -o libswap.so swap.o

# 链接，生成可执行文件
g++ main.cpp -Iinclude -Lsrc -lswap -o main

# 运行可执行文件时需要指定动态链接库的路径
LD_LIBRARY_PATH=src ./main
```

