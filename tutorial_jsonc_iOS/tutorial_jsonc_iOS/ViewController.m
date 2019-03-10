//
//  ViewController.m
//  tutorial_jsonc_iOS
//
//  Created by mark.zhang on 2019/3/9.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "ViewController.h"
#import "json-c/json.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    json_object *jsonObj = NULL;
    
    jsonObj = json_tokener_parse("{ \"uid\": 12, \"name\": \"foobar\", \"isComer\": 1, \"age\": 21, \"extras\": [ 11, 52, 3, \"unknow\", 75 ] }");
    
    const char *jsonString = json_object_to_json_string(jsonObj);
    
    printf("obj.to_string()=%s\n", jsonString);
}

@end
