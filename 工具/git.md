学习网站：[廖雪峰的git讲解](https://www.liaoxuefeng.com/wiki/896043488029600)

# 配置工作 & 本质

```shell
git config --global user.name "chengrong"
git config --global user.email "chengrong@tju.edu.cn" 
git config --global core.editor vim
git config --global color.ui true 
git config --global core.quotepath false # 解决git log中文乱码
```

- 一些与Hash码等价的指针：
  - HEAD：当前版本(本质是指向一个分支，然后分支再指向commit)
  - HEAD^：上一个版本
  - HEAD^：上上个版本
  - HEAD~100：往上100个版本

- 版本回退的本质：修改HEAD指针指向新的地方

- 工作区和暂存区：

  `git add`是把文件修改 添加到 暂存区

  `git commit`是把暂存区 提交到 当前分支

- 分支的本质

  - 新建分支 <==> 新建一个指针
  - 切换分支 <==> 修改HEAD
  - 合并分支 <==> 把master指向当前commit

# 基础操作

-   创建本地仓库

    ```shell
    git init
    ```

-   查看信息

    ```shell
    git status #查看当前状态 包括add和commit和冲突的
    git diff #比较工作区和暂存区（没有跟踪的不管）
    git diff 一个commit 另一个commit #比较两个commit
    ```

-   添加文件

    ```shell
    git add 文件or目录 #加入文件
    # 编辑.gitignore：给出git忽略的文件和文件类型
    git add -a #一次性加入all未被跟踪的文件
    ```

-   删除文件

    ```shell
    #两种方法：
    git rm 文件
    git commit ……
    ```

-   提交

    ```sh
    git commit #提交文件到版本库
    ```

    会弹出文本编辑器，在第一行添加存档的注释

    选项：

    -   -m：如果注释比较简单，直接`git commit -m "注释"`
    -   --allow-empty：允许没有改动的提交
    
-   删除历史文件

    ```shell
    git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch 文件路径' --prune-empty --tag-name-filter cat -- --all
    git push origin master --force --all
    ```

    

# 版本控制

-   查看提交log

    每一个 commit 有一个hash码

    ```shell
    git log
    ```

    选项：

    -   --pretty=oneline：简洁显示
    -   --graph

-   版本回退

    -   回到某个提交（比这个存档新的记录都会被删除）

      ```shell
      git reset --hard X
      ```

      X：HEAD等 or hash码的前几位

    -   回退错了，需要回来

      ```shell
      git reflog #查看命令历史（reset后可以在这里看Hash码）
      git reset --hard Hash码
      ```

# 分支管理

-   查看分支

    ```shell
    git branch
    ```

-   新建和切换

    ```shell
    git branch 新分支 #创建
    git checkout 分支 #切换
    git checkout -b 新分支 #创建+切换
    ```

    ```shell
    git switch 分支 #切换分支
    git switch -c 新分支 #创建+切换
    ```

-   合并分支

    ```shell
    git merge 新分支 #新分支 合并到 当前分支
    ```

    -   提示信息：Fast-forward：这次合并仅仅是修改指针（删除新分支后log就没了）

        如果不能ff，merge会尽力合并修改，但是可能两个都修改了同一行，此时冲突，需要手动修改

    -   选项

        - --no--ff：一定会创建新commit
        - -m：注释

-   整理分支

    ```shell
    git rebase #把本地未push的分叉提交历史整理成直线
    ```

-   删除分支

    ```shell
    git branch -d 分支
    git branch -D 分支 #允许分支还没merge就删除
    ```

# 远程仓库

-   克隆

    ```shell
    git clone 库的https或ssh # clone所有分支，但本地默认只有1个master
    git clone -b 分支名 库的ssh # clone某个分支
    git branch -a #查看all分支，包括远程库
    git checkout -t origin/分支 # 在本地建立一个和远程分支一样的分支
    git checkout -b 分支 origin/分支 # 把远程分支取到本地
    ```

-   绑定远程库

    ```shell
    # 远程库默认叫origin
    git remote -v
    git remote add <远程库名> 库的https或ssh
    git remote rename 远程库名 新名
    git remote rm origin
    ```

-   分支

    ```shell
    git branch --set-upstream-to=origin/dev dev #分支绑定
    git push 仓库 --delete 分支名 #删除远程分支
    git fetch gitee dev:dev #拉去某个分支
    ```

-   传输

    ```shell
    git pull 仓库名 分支名
    ```

    当远程分支和本地分支更新不同步而导致无法`git push`时：

    ```shell
    git remote add origin 仓库 # 绑定远程仓库
    git fetch origin # 获取远程更新
    git merge origin/master #把更新的内容合并到本地分支
    ```

    `fatal:拒绝合并无关的历史`：

    ```sh
    git branch --set-upstream-to=origin/master master # 先关联
    git pull --allow-unrelated-histories #拉取
    ```

# 恢复

## 基础操作

-   撤销修改

    -   丢弃工作区的修改

      ```shell
      git checkout -- 文件 #回到最近一次commit or add时的状态
      ```

    -   丢弃暂存区的修改

      ```shell
      git reset HEAD 文件 #重新放回工作区
      ```

-   恢复文件

    文件删除了，但版本库还有

    ```shell
    git checkout -- 文件 #丢弃工作区的修改
    ```

## 暂存工作区

eg：有文件已经修改，但没提交的时候，突然要解决另一个bug

1.  存储工作区

    ```shell
    git stash #之后再git status，工作区就是干净的了
    ```

2.  修复bug

    1.  确定再哪个分支上修复bug，切换过去
    2.  创建临时分支：`git checkout -b 新分支`
    3.  解决bug
    4.  回去修复bug的分支 并merge

3.  回去原来工作区

    ```shell
    git stash list #查看原来工作现场
    ```

    ```shell
    git stash pop #恢复的同时删除stash的内容
    # 等价于：
    git stash apply #恢复。多次stash的时候可以加参数：stash@{0}
    git stash drop #删除备份的工作区
    ```

4.  把原来工作的分支bug也修复

    ```shell
    git cherry-pick 临时分支hash #复制临时分支的修改
    ```

# 标签管理

本质：指向commit的指针

-   查看

    ```shell
    git tag #查看all标签
    git show <tagname> #查看tag信息
    ```

-   创建

    ```shell
    #切换到要打标签的分支
    git checkout master
    #3种方法打标签
    git tag <name> #指向最新的commit
    git tag <name> <要指向的commit的hash>
    git tag -a <name> -m "注释" <hash>
    ```

-   推送到远程

    ```shell
    git push origin <name>
    git push origin --tags
    ```

-   删除

    ```shell
    git tag -d <name> #在本地删除
    git push origin :ref/tags/<name> #然后在远程删除
    ```
