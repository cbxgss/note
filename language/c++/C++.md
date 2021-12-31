# 变量

volatile阻止编译器优化：

```c++
volatile int a
```

## 作用域

- 全局变量

- `static`：整个程序结束后结束

- 类：退出作用域后析构

  - `new`

    1. 分配内存：

       ```c++
       void * mem = operator new(sizeof(类)); //调用malloc;
       ```

    2. 转型：

       ```c++
       qwq = static_cast<complex *>(mem);
       ```

    3. 构造函数：

       ```c++
       qwq->complex::complex(1, 2);
       ```

  - `delete`

    1. 析构函数：

       ```c++
       string::~string(qwq);
       ```

    2. 释放内存：

       ```c++
       operator delete(qwq); //调用free(qwq)
       ```

# 字符串

## string

- ```c++
  a.empty();
  a.erase(index, n); //删除index开始n个字符
  a.clear();
  a.length() & a.size();
  a.capacity();
  a.c_str() 或 a.data(); //返回a的cstring型
  ```

- 子串

  ```c++
  a.substr(index, n);
  a.substr(index);
  ```

- 查找

  ```c++
  a.find('l');	//查找'l'第一次出现的位置
  // 没有返回npos, string::npos + 1 == 0
  a.find('l', index);
  a.find("lxy");
  a.find("lxy", index);
  ```

- 插入

  ```c++
  a.insert(index, "lxy");
  a.insert(index, n, 'x');	//n个'x'插入
  ```

- 替换

  ```c++
  a.replace(index, n, "lxy")
  ```

## stringstream

数字->字符串：

```c++
int a(123456);
stringstream s;
s << a;
string b = s.str();
cout<<b;
```

字符串分割：

```c++
stringstream s;
string text("Programming is fun");
s << text;
string word;
while(!s.eof()){//当s流完后，eof返回1
	s >> word;	cout<<word<<endl;
}
```

# 输入输出

## 缓冲区

`fflush()`：刷新缓冲区

```c++
fflush(stdout); //输出缓冲区的内容
fflush(stdin); 	//相当于 while(getchar()!='/n');
```

# 指针和数组

## 内存读取

```c++
int a = *(int *)&b;
```

## 数组

```c++
int *min = min_element(list, list + 6);
int *max = max_element(list, list + 6);
```

```c++
random_shuffle(list, list + 6);
sort(list, list + 6);
```

```c++
int *p = find(list, list + 6, key);
```

## 函数指针

- 函数名是函数的地址

- ```c++
  函数返回值类型 (*指针变量名)(参数列表);
  int (*add)(a, b);
  add = f;
  ```

- ```c++
  typedef 返回类型(*新类型)(参数表)
  typedef int(*qwq)(a, b)
  qwq add;
  ```

# 内存操作

## 申请和释放空间`stdlib.h`

```c++
void *malloc(size_t size);
// 运行成功返回分配到内存空间的首地址，失败返回NULL
```

```c++
void *valloc(size_t size);
// 同malloc，但分配的内存是跟内存页对齐的
```

```c++
void *calloc(size_t nmemb, size_t size);
// 运行成功返回分配到内存空间的首地址，失败返回NULL
```

```c++
void *realloc(void *ptr, size_t size)
// 调整malloc或calloc分配的大小
// 参数：
//	ptr：原来内存的指针
//	size：新的大小（当为0时，相当于free，返回NULL）
```

```c++
void free(void *ptr);
```

## 内存映射`unistd.h`

```c++
void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset);
// 建立内存映射，将文件映射到内存，通过内存操作完成对文件的操作
// 返回值：
// 映射成功则返回映射区的内存起始地址，否则返回MAP_FAILED(-1)
// 参数：
//	start：映射的目标地址，通常是NULL，表示系统自动选择
//	length：映射长度
//	prot：保护模式（PROT_EXEC可执行,	PROT_READ可读, PROT_WRITE 可写,PROT_NONE无读写权限)
//	flags：分配内存特性标志位
//	fd：文件描述词
//	offset：映射文件的偏移量（表示从文件的第几个字节开始影射，必须为页大小的整数倍）
```

- `flags`：

  可以是宏的运算组合

  - MAP_FIXED	若start所指地址无法建立影射，则放弃操作
  - MAP_SHARED	对映射区域的写操作会反映到文件，且允许其他进程使用之
  - MAP_PRIVATE	对映射区域的写操作会反映到一个文件的副本
  - MAP_ANONYMOUS	建立的内存映射不针对文件，此时忽略参数fd
  - MAP_DENYWRITE	只允许通过映射区域对文件进行写操作，其他方式对文件写操作被拒绝

```c++
size_t getpagesize(void)； //获取内存页面大小
```

## 内存操作`string.h`

### 复制和查找

```c++
void bcopy(const void *src, void *dest, int n); //等价于
void memcpy(void *dest, const void *src, size_t n);
```

```c++
void memmove(void *dest, const void *src, size_t n);
// 可以保证当源地址和目标地址有重叠时正确拷贝，但效率稍低
```

```c++
void *memccpy(void *dest, const void *src, int c, size_t n)
// 内存拷贝并查找字符
// c：待查找的字符
// 返回：c地址的下一个地址，若不存在返回NULL
```

```c++
void *memchr(const void *s, int c, size_t count);
// 查找字符
// 返回第一次出现字节c的地址，若不存在则返回NULL
```

### 比较

```c++
int bcmp(const void *s1, const void *s2, int n);
int memcmp(const void *s1, const void *s2, size_t n);
// 返回 s1 - s2
```

### 赋值

```c++
void bzero(void *s, int n); //将指定内存区域用0填充
void *memset(void *s, int c, size_t n);
```

# 文件操作

## stdio.h

### 文件的打开和关闭

```c++
FILE *fopen(char *filename, char *mode); //打开文件
// 参数：
//	filename：文件名(包含路径)
//	mode：打开方式 r w a(追加写) r+(读写，文件必须存在) w+ a+
// 返回：FILE结构体(文件)的指针 （文件流指针）（不存在，返回NULL）
```

```c++
int fclose(FILE *fp);	//关闭文件
// 返回：正常关闭时为0, 失败返回EOF
```

### 文件流指针

```c++
long ftell(FILE *stream);	//获取文件流指针当前的读写位置
// 成功返回当前读写位置，失败返回 -1
```

```c++
int fseek(FILE *stream, long offset, int whence); //设置文件流指针的读写位置
//offset：指定的读写位置，
//whence：设置读写位置的基准：SEEK_SET开始，SEEK_CUR当前读写指针处，SEEK_END末尾
// 返回：成功0，失败-1
```

```c++
int feof(FILE *stream);	//判断文件流指针是否已经到达文件尾
// 返回值：没到达返回0
```

### 文件内容

```c++
int fgetc(FILE *stream);	//读取一个字符，返回字符/EOF
int fputc(int c, FILE *stream);	//写入c，返回c/EOF
```

```c++
char *fgets(char *s, int size, FILE *stream); //读取一个字符串,返回s/NULL
int fputs(char *s, FILE *stream);	//写入字符串(不会写入'\0')，返回写入字符数/EOF
```

```c++
size_t fread(void *ptr, size_t size, size_t nmenb, FILE *stream);
// ptr：存放地址；size：一个数据单元的字节数；nmenb：数据单元个数
// 返回值：实际的读取数据单元个数
size_t fwrite(void *ptr, size_t size, size_t nmenb, FILE *stream);
```

## fstream

### 写入

```c++
ofstream output;
output.open("a.txt");	//打开一个名位a的txt，如果没有就创建一个
output<<95<<" "<<56<<" "<<34;	//写内容
output.close();//关闭文件
```

### 读取

```c++
ifstream input;
input.open("a.txt");//打开文件
int x, y, z;
input >>x; input >>y; input >>z;
cout<<x + y + z<<endl;
input.close();
cout<<"Done"<<endl;
```

```c++
// 读取all数据
ifstream input("a.txt");
double sum(0);
double number;
while(!input.eof()){//如果还有就返回0，没有返回1
	input >> number;
	cout<<number<<" ";
	sum += number;
}
input.close();
cout<<sum<<endl;
```

# 宏

```c++
#define <宏名> <宏体>
#define Pi 3.14
#define <宏名>(<参数表>) <宏体>
#define F(a, b) a + b
```

```c++
#define DEBUG
#ifdef DEBUG
	// DEBUG代码
#endif
#if 0
	//注释
#endif
```

# 模板

```c++
template <typename T>
T f(T a, T b){...}
template <class T>
class 名{...};
```

# 命名空间

定义：

```c++
namespace 名 { // 可以在不同的地方写，最后编译器会结合
    ……
}
```

使用：

```c++
using namespace 名 //可以直接用命名空间内的all
using namespace 名:名
std::cin
```

# 多线程编程

## 创建

```c++
#include <pthread.h>
int pthread_create (pthread_t * &新创建的线程ID,		// 该函数来赋值
                    __const pthread_attr_t * &线程属性	//NULL
                   void * 新线程从这里开始执行
                   void * 执行函数的参数				//参数的地址或NULL
)
```

- 返回
	- 成功：0
	- 失败：错误编号，可以用`strerror(errno)`函数得到错误信息

## 等待执行线程结束

```c++
int pthread_join(pthread_t ID, void **value_ptr)	//(long)tret, tret是void *
```

- 参数
	- `thread`：一个有效的线程`id`
	- `value_ptr`：接受线程返回值的指针

## 线程的终止

```c++
pthread_exit(0); //线程调用该函数
pthread_cancle(线程的pid); //一个线程终止另一个线程
// 从启动例程中返回，返回值是线程的退出码
```



## 线程同步

- 互斥量

	- 数据类型：`pthread_mutex_t`

	- 初始化：

		- 法一：赋值为常量：`PTHREAD_MUTEX_INITIALIZER`

		- 法二：动态分配

			```c++
			int pthread_mutex_init (pthread_mutex_t *__mutex,
			                       __const pthread_mutexattr_t *__mutexattr);
			int pthread_mutex_destroy (pthread_mutex_t *__mutex);	//销毁
			// 返回：成功0，失败错误编号
			```

	- 加解锁：

		```c++
		int pthread_mutex_lock (pthread_mutex * &互斥量);
		int pthread_mutex_unlock (pthread_mutex_t * &互斥量);
		```

- 读写锁

	- 允许多个线程同时读，只能有一个线程同时写，适合于读的次数远大于写的情况

	- 初始化：

		```c++
		int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock
		                        __const pthread_rwlockattr_t *__restrict
		                        __attr);
		int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock);
		// 成功返回0
		```

	- 加解锁

		```c++
		int pthread_rwlock_rdlock (pthread_rwlock_t *rwlock);	//读锁
		int pthread_rwlock_wrlock (pthread_rwlock_t *rwlock);	//写锁
		int pthread_rwlock_unlock(pthread_rwlock_t *rwlock);	//解锁
		```

- 条件变量

	- 数据类型：`pthread_cond_t`

	- 本身由互斥量保护，所以在改变条件前必须锁住互斥量

	- 初始化

		- 赋值常数：`PTHREAD_COND_INITIALIZER`

		- 使用`pthread_cond_init`：

			```c++
			int pthread_cond_init (pthread_cond_t * &条件变量,
			                       _const pthread_condattr_t * restrict
			                       _cond_attr);
			int pthread_cond_destroy (pthread_cond_t* cond);
			```

	- 条件等待

		```c++
		int pthread_cond_wait (pthread_cond_t * &条件变量,
		                   pthread_mutex_t * 互斥锁)
		//将调用线程放入等待条件的线程列表, 然后解锁互斥量
		//在 pthread_cond_wait 返回时, 再次锁定互斥量
		//成功返回0
		```

		注意：这里传递的互斥量已经锁定

	- 唤醒线程

		```c++
		//唤醒等待该条件的某个线程
		int pthread_cond_signal (pthread_cond_t * &条件变量);
		//唤醒等待该条件的所有线程
		int pthread_cond_broadcast (pthread_cond_t * &条件变量);
		```









# 编译运行程序

```shell
CC xxx.c
a.out
echo $?		# 运行完程序后，查看返回值
```

-   文件重定向

    ```shell
    elf文件 <输入文件>输出文件
    ```

# 变量

-   定义和声明

    -   定义：让名字被程序知道
    -   声明：创建与名字关联的实体
    -   如果想声明而不定义：`extern` + 不显示地初始化变量
    -   一个变量一个多次声明，但只能定义一次

-   作用域：用`{}`分割

-   const变量

    -   由于只在文件内有效，可以在 不管定义还是声明 都用`extern`，从而共享
    -   顶层const：指针是个常量
    -   底层const：指针指向的对象是
    -   常量表达式
        -   值不会变，在编译的时候就能得到结果的表达式
        -   constexpr类型：让编译器来验证变量是否是常量表达式

-   类型

    -   类型别名

        -   传统方法

            ```c++
            typedef double qwq;
            ```

        -   别名声明

            ```c++
            using qwq = double;
            ```

    -   `aotu`类型：`auto a = b + c`

    -   `decltype`类型：用一个变量的类型推断出定义的变量的类型，但是不用他的值初始化变量

        ```c++
        decltype(a) b = c;		# b的类型就是a的类型
        ```

# 字符串、向量、数组

