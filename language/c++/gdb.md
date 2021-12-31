# gdb

## 常用调试参数

```bash
# 括号中为简写
quit(q)	# 退出
help(h) <命令>

run(r)	# 重新开始运行
start	# 单步执行程序并停在第一行语句

set		# 设置变量的值

next(n)	# 单步调式，函数直接执行
step(s)	# 单步执行，函数进入执行
finish		# 结束当前函数，返回到函数调用点
continue(c)	# 继续运行

list(l)	# 查看源代码 list-n: 从第n行查看代码，list+函数名: 查看具体函数
backtrace(bt)	# 查看函数调用的栈帧和层级关系
frame(f)	# 切换函数的栈帧
info(i)		# 查看函数内部局部变量的数值
print(p)	# 打印值及地址
```

## 反汇编对应区域

```shell
disass fun
disass 开始地址 结束地址
```

## 断点

```shell
break+num(b)		# 在第num行设置断点
b *addr
b *fun

info breakpoints	# 查看当前设置的所有断点
```

### 删除

```shell
delete 删除all断点
delete 1
delete 1-3
```

## 打印内存

### p

```shell
p/x 名	#16进制
p/d 名	#10
p/t 名	#2
p/s 名	#字符串格式
p $eax
p/x *(int *) 地址
p/x (char *) 地址
```

### x

```shell
x/nfu 起始地址
```

- n：整数，显示几个
- f：显示格式
  - x：16进制	d：10	o：8    t：2
  - a：16进制    u：16进制显示无符号    
  - c：字符
  - f：浮点数
- u：一个有几个字节（默认4）
  - b：1	h：2	w：4	g：8