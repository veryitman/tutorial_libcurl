//
//  ViewController.m
//  tutorial_libcurl_iOS
//
//  Created by itman on 2019/3/2.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "ViewController.h"
#import "curl/curl.h"

#define HOST_URL @"http://172.20.10.2:8080/user"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)doHTTPGETToFileAction:(id)sender
{
    NSString *reqUrl = [NSString stringWithFormat:@"%@%@", HOST_URL, @"?id=1&name=veryitman"];
    const char *url = [reqUrl cStringUsingEncoding:NSUTF8StringEncoding];
    http_get_req(url);
}

- (IBAction)doHTTPPOSTToFileAction:(id)sender
{
    const char *url = [HOST_URL cStringUsingEncoding:NSUTF8StringEncoding];
    const char *data = "id=2&name=veryitman";
    http_post_req(url, data);
}

#pragma mark - C

/**
 *  获取沙盒文件路径
 *
 *  @param fileName 存储响应数据的文件名称
 */
const char * rspDataPath(NSString *fileName)
{
    if (fileName.length <= 0) {
        fileName = @"tmp";
    }

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    const char *fpath = [filePath cStringUsingEncoding:NSUTF8StringEncoding];

    NSLog(@"Response data filePath : %s", fpath);

    return fpath;
}

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
