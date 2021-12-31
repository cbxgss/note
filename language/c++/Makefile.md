# 编译过程

## 预处理

- 生成.i文件
  - 把.c .h展开形成一个文件
  - 宏定义直接替换
  - 头文件，库文件展开 
- 命令：`gcc -E hello.c -o hello.i`

## 编译

- 生成.S文件
- 命令：`gcc -S hello.i -o hello.S`

## 汇编

- 生成.o文件
- 命令：`gcc -c hello.S -o hello.o`

## 链接

- windows生成.exe，linux生成.elf
- 命令：gcc hello.o -o hello

# Makefile

## 基础规则

```makefile
目标文件:依赖文件
	命令
#使用：make
```

- 最终目标放在 第一个文件，make会生成第一个文件

伪目标（没有依赖文件，也不生成目标文件）

```makefile
.PHONY
clear:
rm -rf hello.o hello.S hello.i hello
#使用：make clean
```

## 通配符

### 目标:依赖 / 命令中

```shell
%.c		#任意的.c文件
%.o		#任意的.o文件
*.c		#所有的.c文件
*.o		#所有的.o文件
```

### 命令中

```makefile
$@	#all目标文件
$^	#all依赖文件
$<	#第一个依赖文件
$?	#所有时间戳比目标文件晚的依赖文件
```

## 变量

- 定义

  ```makefile
  a = test		#延迟赋值
  b := a			#展开赋值
  a += test1		#追加
  ```

- 使用

  ```makefile
  $(a)
  ```

# 反汇编

```shell
objdump -S -d 可执行文件名
```

- 选项
  - -S：显示C代码