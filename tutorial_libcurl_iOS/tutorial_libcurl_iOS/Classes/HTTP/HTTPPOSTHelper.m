//
//  HTTPPOSTHelper.m
//  tutorial_libcurl_iOS
//
//  Created by mark.zhang on 2019/3/8.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "HTTPPOSTHelper.h"
#import "curl/curl.h"

@implementation HTTPPOSTHelper

void http_post_req(const char *url, const char *req_data)
{
    const char *fpath = rspDataPath(@"http_post_rsp_data.log");
    
    FILE *fp;
    fp = fopen(fpath, "wt+");
    
    CURL *curl;
    curl = curl_easy_init();
    
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        
        NSLog(@"length: %ld", strlen(req_data));
        
        /* size of the POST data */
        curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, strlen(req_data) + 1);
        
        /* pass in a pointer to the data - libcurl will not copy */
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, req_data);
        
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
        
        curl_easy_cleanup(curl);
    }
    
    fclose(fp);
}

@end
