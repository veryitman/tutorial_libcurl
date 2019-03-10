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


## json

json-c-0.13.1-20180305

[All Release](https://github.com/json-c/json-c/releases)

