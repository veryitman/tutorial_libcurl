//
//  HTTPPOSTJSONHelper.m
//  tutorial_libcurl_iOS
//
//  Created by mark.zhang on 2019/3/8.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "HTTPPOSTJSONHelper.h"
#import "curl/curl.h"

@implementation HTTPPOSTJSONHelper

struct StreamObject {
    const char *rsp_datas;
    size_t rsp_datas_size;
};

static size_t write_callback(void *ptr, size_t size, size_t nmemb, void *stream)
{
    size_t realsize = size * nmemb;
    
    // ptr 是 HTTP 响应返回的数据
    printf("ptr: %s\n", ptr);
    
    struct StreamObject *ws = (struct StreamObject *)(stream);
    
    printf("ws->data: %s, ws->size: %ld\n", ws->rsp_datas, ws->rsp_datas_size);
    
    return realsize;
}

int http_post_callback(const char *url, const char *data)
{
    CURL *curl;
    CURLcode res;
    
    struct StreamObject wt;
    
    wt.rsp_datas = data;
    wt.rsp_datas_size = strlen(data) + 1;
    
    curl = curl_easy_init();
    
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        
        /* 指定为 POST 请求 */
        curl_easy_setopt(curl, CURLOPT_POST, 1L);
        
        /* 请求数据 */
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);
        
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
        
        /* 这里给定的 wt 数据，是write_callback函数中的最后一个参数值.*/
        /* 注意这里一定是结构体，不能是对象(Class)。*/
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &wt);
        
        /* 输出多一些信息 */
        curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
        
        /* Set the expected POST size. */
        /* If you want to POST large amounts of data, consider CURLOPT_POSTFIELDSIZE_LARGE */
        curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, strlen(data));
        
        res = curl_easy_perform(curl);
        
        if (CURLE_OK != res) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        }
        
        curl_easy_cleanup(curl);
    }
    
    return 0;
}

@end
