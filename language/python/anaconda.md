# anaconda

## 环境

-   查看所有环境

    ```shell
    conda info --envs
    ```

-   创建环境

    ```shell
    conda create -n <新环境名> python=3.8 --clone <旧环境名>
    ```

-   切换环境

    ```shell
    source activate <环境名>
    source deactivate
    ```

-   删除环境

    ```shell
    conda remove --name 环境名 --all
    ```

## 包

-   查看已经安装的包

    ```shell
    conda list				  # 查看当前环境下的包
    conda list -n 环境名		# 查看指定环境下的包
    ```

-   搜索源中的包

    ```shell
    conda search 包名
    ```

-   安装包

    ```shell
    conda install -n 环境名 包名
    # -n: 选择环境，默认为当前环境
    # -c: 通过哪个channel安装
    ```

-   更新包

    ```shell
    conda update -n 环境名 包名
    ```

-   删除包

    ```shell
    conda remove -n 环境名 包名
    ```

-   更新conda, anaconda, python

    ```shell
    conda update ...
    ```

    
