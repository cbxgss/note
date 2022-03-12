# 内置变量

-   `PROJECT_SOURCE_DIR`：CMakeLists.txt所在路径
-   list
    -   `CMAKE_MODULE_PATH`：模块路径

# 命令

## list

[参考网址](https://www.jianshu.com/p/89fb01752d6f)

```cmake
list (subcommand <list> [args...])
```

-   `subcommand`：具体的操作命令，下面有说
-   `<list>`：待操作的列表变量
-   `[args...]`：参数表

### 创建列表

```cmake
set(var a b c d)
```

### 读取

-   `LENGTH`：得到长度

    ```cmake
    # CMakeLists.txt
    cmake_minimum_required (VERSION 3.12.2)
    project (list_cmd_test)
    set (list_test a b c d) # 创建列表变量"a;b;c;d"
    list (LENGTH list_test length)
    message (">>> LENGTH: ${length}")	# 输出4
    ```

-   `GET`：读取元素

    ```cmake
    # CMakeLists.txt
    cmake_minimum_required (VERSION 3.12.2)
    project (list_cmd_test)
    set (list_test a b c d) # 创建列表变量"a;b;c;d"
    list (GET list_test 0 1 -1 -2 list_new)
    message (">>> GET: ${list_new}")	# 输出4
    ```

-   `JOIN`：元素拼接

-   `SUBLIST`

-   `FIND`

### 修改

-   `APPEND`：追加

    ```cmake
    # CMakeLists.txt
    cmake_minimum_required (VERSION 3.12.2)
    project (list_cmd_test)
    set (list_test a b c d) # 创建列表变量"a;b;c;d"
    list (APPEND list_test 1 2 3 4)
    message (">>> APPEND: ${list_test}")
    ```

-   `FILTER`

-   `INSERT`

-   `POP_BACK`

-   `POP_FRONT`

-   `PREPEND`：加到开头

-   `REMOVE_ITEM`

-   `REMOVE_AT`

-   `REMOVE_DUPLICATES`

-   `TRANSFORM`

### 排序

-   `REVERSE`
-   `SORT`