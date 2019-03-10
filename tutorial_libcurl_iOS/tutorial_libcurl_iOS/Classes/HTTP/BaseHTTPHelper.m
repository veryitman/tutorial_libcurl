//
//  BaseHTTPHelper.m
//  tutorial_libcurl_iOS
//
//  Created by mark.zhang on 2019/3/8.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "BaseHTTPHelper.h"

@implementation BaseHTTPHelper

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

@end
