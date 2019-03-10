# tutorial_note

## 常用函数

1、curl_easy_init() 
初始化一个licurl简单会话，这个API应该最先调用，它会返回一个handle，供其他API使用。

2、curl_easy_cleanup() 
清除CURL指针，如果前面调用了curl_easy_init()，后面就一定要调用curl_easy_cleanup()，相当于释放资源。

3、curl_easy_setopt() 
给curl的easy handle设置一个传输选项，这是一个很重要的函数，也是用的最多的一个，如果你要对curl进行什么操作，大多需要透过这个API去设定。

4、curl_easy_perform() 
执行传输任务

5、curl_easy_getinfo() 
从curl handle提取相应的信息

## curl_easy_setopt 常用设置

1、CURLOPT_URL 
设定要访问的URL

2、CURLOPT_VERBOSE 
打开一些传输过程的信息，常用于调试时，查看信息

3、CURLOPT_FOLLOWLOCATION 
打开重定向跟踪

4、CURLOPT_WRITEFUNCTION、CURLOPT_WRITEDATA 

[1]. CURLOPT_WRITEFUNCTION：设置一个回调函数，用于保存接收到的数据 
[2]. 回调函数：size_t write_callback(char *ptr, size_t size, size_t nmemb, void *userdata); 
    ptr：指向接收到的数据 
    userdata：CURLOPT_WRITEDATA设置的参数 
    写入数据的大小为size*nmemb 
    CURLOPT_WRITEDATA：用于设定上面回调函数的最后一个参数

5、CURLOPT_HEADERFUNCTION、CURLOPT_HEADERDATA 
上面两个选项主要用于保存header data，使用方法可以参考CURLOPT_WRITEFUNCTION和CURLOPT_WRITEDATA

6、CURLOPT_NOPROGRESS、CURLOPT_PROGRESSFUNCTION、CURLOPT_PROGRESSDATA
这三个选项主要用来得到当前任务的传输进度

## curl_easy_getinfo 常用设置

1、CURLINFO_REDIRECT_URL 
获取重定向的URL

2、CURLINFO_CONTENT_TYPE 
获取传输的数据类型

3、CURLINFO_SIZE_DOWNLOAD 
下载文件的大小

4、CURLINFO_TOTAL_TIME 
下载文件所花的总时间

5、CURLINFO_SPEED_DOWNLOAD 
下载文件的平均速度

## 

1.  CURLOPT_WRITEFUNCTION，CURLOPT_WRITEDATA

回调函数原型为：size_t function( void *ptr, size_t size, size_t nmemb, void *stream); 
函数将在libcurl接收到数据后被调用，因此函数多做数据保存的功能，如处理下载文件。
CURLOPT_WRITEDATA 用于表明CURLOPT_WRITEFUNCTION函数中的stream指针的来源。

2.  CURLOPT_HEADERFUNCTION，CURLOPT_HEADERDATA

回调函数原型为 size_t function( void *ptr, size_t size,size_t nmemb, void *stream); 
libcurl一旦接收到http 头部数据后将调用该函数。
CURLOPT_WRITEDATA 传递指针给libcurl，该指针表明CURLOPT_HEADERFUNCTION 函数的stream指针的来源。

3.  CURLOPT_READFUNCTION CURLOPT_READDATA

libCurl需要读取数据传递给远程主机时将调用CURLOPT_READFUNCTION指定的函数，函数原型是：size_t function(void *ptr, size_t size, size_t nmemb,void *stream). CURLOPT_READDATA 表明CURLOPT_READFUNCTION函数原型中的stream指针来源。

4.  CURLOPT_NOPROGRESS，CURLOPT_PROGRESSFUNCTION，CURLOPT_PROGRESSDATA

跟数据传输进度相关的参数。CURLOPT_PROGRESSFUNCTION 指定的函数正常情况下每秒被libcurl调用一次，为了使CURLOPT_PROGRESSFUNCTION被调用，CURLOPT_NOPROGRESS必须被设置为false，CURLOPT_PROGRESSDATA指定的参数将作为CURLOPT_PROGRESSFUNCTION指定函数的第一个参数

5.  CURLOPT_TIMEOUT，CURLOPT_CONNECTIONTIMEOUT:

CURLOPT_TIMEOUT 由于设置传输时间，CURLOPT_CONNECTIONTIMEOUT 设置连接等待时间

6.  CURLOPT_FOLLOWLOCATION

设置重定位URL

CURLOPT_RANGE: CURLOPT_RESUME_FROM:

断点续传相关设置。CURLOPT_RANGE 指定char *参数传递给libcurl，用于指明http域的RANGE头域，例如：

表示头500个字节：bytes=0-499

表示第二个500字节：bytes=500-999

表示最后500个字节：bytes=-500

表示500字节以后的范围：bytes=500-

第一个和最后一个字节：bytes=0-0,-1

同时指定几个范围：bytes=500-600,601-999

CURLOPT_RESUME_FROM 传递一个long参数给libcurl，指定你希望开始传递的偏移量。


## curl_easy_perform 函数说明（error 状态码）

1.  CURLE_OK
任务完成  

2 .  CURLE_UNSUPPORTED_PROTOCOL
不支持的协议，由URL的头部指定

3 .  CURLE_COULDNT_CONNECT
不能连接到remote 主机或者代理

4 .  CURLE_REMOTE_ACCESS_DENIED
访问被拒绝

5 .  CURLE_HTTP_RETURNED_ERROR
Http返回错误

6 .  CURLE_READ_ERROR
读本地文件错误

## json

json-c-0.13.1-20180305

[All Release](https://github.com/json-c/json-c/releases)



