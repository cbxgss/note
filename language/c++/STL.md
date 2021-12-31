# 迭代器

```c++
容器类名::iterator 名;	//正向
容器类名::const_iterator 名;	//常量正向
容器类名::reverse_iterator 名;	//反向
容器类名::const_reverse_iterator 名;	//常量反向
```

```c++
//algorithm
advance(i, n);	//让i向前或后移动n个元素
distance(p, q);	//计算p经过几次++后等于q
iter_swap(p, q);	//交换*q, *p
```

# 容器

```c++
// 通用函数
.size() 和 .empty()
```

```c++
// 顺序容器和关联容器通用
.begin()
.end()
.rbegin()	//返回最后一个元素的反向迭代器
.rend()	//返回第一个元素前面位置的反向迭代器
.clear()	//删除all元素
.erase(……) //具体说
```

## 关联容器

### map和multimap

按first从小到大排序

### set和multiset

```c++
multiset<T> 名;
multiset <int, greater<int> >名;
multiset <int, 排序规则名 >名;
```

```c++
名.upper_bound(13)
名.lower_bound(13)
名.erase(i)	//i是迭代器
名.insert(值)
名.find(值)	//返回迭代器，没有返回end()
```

## 顺序容器

特点：不排序

```c++
// 通用函数
.front()	//返回第一个元素的引用
.back()	//返回容器最后一个元素的引用
.push_back(x)	//在容器末尾添加新元素
.pop_back()	//删除容器末尾元素
.insert(……)具体说
```

### vector

迭代器可加减

```c++
vector<数据类型>名;
vector<vector<int> > 名;	//二维的
```

```c++
//访问
名[i]；	//只有这里i不是迭代器
```

```c++
// 插入
名.insert(i, 值);	//在i前插入 值
名.insert(i, n, 值);	//在i前插入n个 值
名.insert(i, first, last);	//在i前插入 由迭代器first, second决定的[first, last)
```

```c++
// 删除
名.erase(i);
名.erase(first, last);
```

```c++
// 整体操作
名.swap(另一vector);	//交换两个的内容
名.assign(first, last);	//把序列替换为迭代器first, last 所指定序列[first, last)，且不能是原序列的一部分
```

```c++
// 存储空间
名.reserve(n);	//预分配缓冲空间，至少可以储存n个元素
名.resize(n, 值);	//改变长度，超出的元素被删除，如果变长了以 值 补充
```

### bit_vector

```c++
#include<vector>
```

构造函数：

```c++
bit_vector()
bit_vector(size_type n)
bit_vector(size_type n, bool value)
bit_vector(const bit_vector& )
bit_vector(InputIterator first, InputIterator last)
```

赋值

```c++
bit_vector bv;
bv.pushback(true);
bv.pushback(false);

bit_vector bv(3);
bv[0]=1;
bv[1]=0;
bv[2]=1;
bit_vector::iterator i;
i=bv.begin();
bv.insert(i,0);
```

删除方法

```c++
pop_back();
void erase(iterator pos);
void erase(iterator first, iterator last);
void clear();
```

反向遍历：

```c++
reverse_iterator rbegin() //返回作为容器反向遍历的第一个元素的位置
reverse_iterator rend() //返回作为容器反向遍历的尾端元素的位置
```

其他方法：

```c++
bool empty()
size_type size()
size_type capacity()
```

### list双向链表

### deque双端队列

迭代器可加减

## 容器适配器

### stack

```c++
.empty()
.size()
.top()
.pop()
.push()
```

### queue

```c++
.push()
.front()
.back()
.pop()
```

### 优先队列

```c++
priority_queue<数据类型>名;
priority_queue<数据类型, vector<int>, 排序规则名>名
//排序规则如果是greater<int>后面要有空格
```

```c++
.top()
.pop()
.push()
```

# 算法

- sort

  ```c++
  sort(数组名 + n1, 数组名 + n2);
  sort(数组名 + n1, 数组名 + n2, greater<T>());
  sort(数组名 + n1, 数组名 + n2, 排序规则结构名);
  ```

- 二分查找

  ```c++
  //binary_search（找值）
  binary_search(数组名 + n1, 数组名 + n2, 值);
  binary_search(数组名 + n1, 数组名 + n2, 值, 排序规则结构名());	//不一定相等，只要按排序规则相等即可
  ```

  ```c++
  //lower_bound(找下界)
  //upper_bound(找上界)
  ```

  