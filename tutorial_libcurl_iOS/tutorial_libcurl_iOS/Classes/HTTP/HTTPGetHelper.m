//
//  HTTPGetHelper.m
//  tutorial_libcurl_iOS
//
//  Created by mark.zhang on 2019/3/8.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "HTTPGetHelper.h"
#import "curl/curl.h"

@implementation HTTPGetHelper

void http_get_req(const char *url)
{
    CURL *curl;
    
    const char *fpath = rspDataPath(@"http_get_rsp_data.log");
    
    FILE *fp;
    fp = fopen(fpath, "wt+");
    
    struct curl_slist *headers = NULL;
    //增加HTTP header
    headers = curl_slist_append(headers, "Accept:application/json");
    headers = curl_slist_append(headers, "Content-Type:application/json");
    headers = curl_slist_append(headers, "charset:utf-8");
    
    //初始化
    curl = curl_easy_init();
    
    if (curl) {
        //改协议头
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_URL, url);
        
        curl_easy_setopt(curl, CURLOPT_POST, url);
        
        //wt+：读写打开或着建立一个文本文件；允许读写
        if (NULL != fp) {
            // 请求结果写入到文件当中
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
        }
        
        CURLcode rsp_code = curl_easy_perform(curl);
        if (CURLE_OK == rsp_code) {
            NSLog(@"请求返回成功");
        } else {
            NSLog(@"请求返回失败，返回码是 %i", rsp_code);
        }
        
        curl_slist_free_all(headers);
        
        curl_easy_cleanup(curl);
    }
    
    fclose(fp);
}

@end
