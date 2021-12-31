```sh
#PBS -N test			 # test：作业名
#PBS -l nodes=1:ppn=8	  # 申请资源列表：2个节点和8个核
#PBS -j oe				 # j:表示合并标准输出和标准错误输出到同一个文件，默认在当前文件夹
						# o：标准输出文件路径；e：标准错误输出路径
#PBS -l walltime=1000:00:00 # 估计最大运算时间，超时中断
```

```sh
# 计算计算系统可用的cpu核数，然后赋值
nodecpu = `cat /proc/cpuinfo | grep processor | wc -l`
# 计算申请的cpu核数，然后赋值
procs=$(cat $PBS_NODEFILE | wc -l)
```

