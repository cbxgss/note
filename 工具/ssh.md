# 端口号

- IP地址：找到网络上的计算机

  数字.数字.数字

- 域名：IP的别名

- 端口号：找到计算机上的应用程序

  ip:端口号 （端口号默认时可以省略）

  | 端口号 | 内容      |
  | ------ | --------- |
  | 20     | SSH服务器 |
  | 21     | FIP服务器 |
  | 80     | Web服务器 |
  | 443    | HTTPS     |

- 配置别名

  再`~/.ssh/config`加上：

  ```shell
  Host <别名>
  	HostName <ip地址>
  	User <name>
  	port 22
  ```

# 连接

```sh
ssh [-p <port>] user@remote
```

- port：端口，默认22
- user：用户名，默认当前用户
- remote：IP/域名/别名

# 传输文件

```shell
scp 要复制的文件 user@ip:复制到的地址 #本地->远程
scp user@ip:要复制的文件 复制到的地址 #远程->本地
```

选项：

- -r：文件夹
- -P：端口

# ssh密钥

-   非对称加密算法

    A加密，B来解密

    发送信息前用 A 加密，然后接受方用 B 解密

    本地用私钥加密，服务器用公钥

-   查看key

    ```sh
    ls -al ~/.ssh
    #id_rsa为私钥，id_rsa.pub为公钥
    #known_hosts已经连接的
    #authorized_keys被who连接，公钥
    ```

-   生成key

    ```shell
    ssh-keygen -t rsa -C "email address" #加三次回车
    ```

-   公钥传到服务器：能达成免密码连接

    ```shell
    ssh-copy-id -p port user@ip
    ```
