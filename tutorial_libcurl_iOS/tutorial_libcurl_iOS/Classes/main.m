//
//  main.m
//  tutorial_libcurl_iOS
//
//  Created by itman on 2019/3/2.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <string.h>

void func(char str[])
{
    size_t xx = sizeof(str);
    printf("xx sizeOf: %ld\n", sizeof(xx));
}

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        char *ch_name = "msldsdk";
        char ch_name_ary[] = {'m', 's', 'l', 'd', 's', 'd', 'k'};
        char ch_name_ary_end[] = {'m', 's', 'l', 'd', 's', 'd', 'k', '\0'};
        char ch_name_ary_ext[] = "msldsdk";
        
        printf("ch_name sizeOf: %ld, strlen: %ld\n", sizeof(ch_name), strlen(ch_name));
        printf("ch_name_ary sizeOf: %ld, strlen: %ld\n", sizeof(ch_name_ary), strlen(ch_name_ary));
        printf("ch_name_ary_end sizeOf: %ld, strlen: %ld\n", sizeof(ch_name_ary_end), strlen(ch_name_ary_end));
        printf("ch_name_ary_ext sizeOf: %ld, strlen: %ld\n", sizeof(ch_name_ary_ext), strlen(ch_name_ary_ext));
        
        //func("msldsdk");
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
