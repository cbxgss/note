# 创建对象

```javascript
variable=new XMLHttpRequest();
```

# 请求

```javascript
xmlhttp.open("GET","ajax_info.txt",true);
// 参数：请求类型GET/POST, url：文件在服务器上的位置, async: true异步/false同步
xmlhttp.send(string);
// 参数：string：仅用于POST请求
```

-   GET请求

    ```javascript
    xmlhttp.open("GET","/try/ajax/demo_get.php?参数",true);
    xmlhttp.send();
    ```

-   POST请求

    ```javascript
    xmlhttp.open("POST","/try/ajax/demo_post.php",true);
    xmlhttp.send();
    ```

    ```javascript
    xmlhttp.open("POST","/try/ajax/demo_post2.php",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send("fname=Henry&lname=Ford");
    ```

    ```javascript
    setRequestHeader(header,value) // 向请求添加HTTP头
    // header：头的名称，value：头的值
    ```

# 服务器响应

-   response Text

    ```javascript
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    ```

-   response XML：响应的是XML，而且要解析

    ```javascript
    xmlDoc=xmlhttp.responseXML;
    txt="";
    x=xmlDoc.getElementsByTagName("ARTIST");
    for (i=0;i<x.length;i++)
    {
        txt=txt + x[i].childNodes[0].nodeValue + "<br>";
    }
    document.getElementById("myDiv").innerHTML=txt;
    ```

    