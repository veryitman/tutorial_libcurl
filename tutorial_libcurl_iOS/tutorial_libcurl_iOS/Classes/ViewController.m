//
//  ViewController.m
//  tutorial_libcurl_iOS
//
//  Created by itman on 2019/3/2.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "ViewController.h"
#import "curl/curl.h"
#import "HTTPPOSTJSONHelper.h"
#import "HTTPGETHelper.h"
#import "HTTPPOSTHelper.h"

#define HOST_URL     @"http://10.4.16.204:8080/"
#define URL_USER     [NSString stringWithFormat:@"%@user", HOST_URL]
#define URL_USERINFO [NSString stringWithFormat:@"%@userInfo", HOST_URL]

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSources = [@[@"GET", @"POST", @"POST-JSON"] mutableCopy];
}

#pragma mark - UITableViewDatasource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataSources[indexPath.row]];

    return cell;
}

#pragma mark - UITableViewDelegate.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *cText = [self.dataSources objectAtIndex:indexPath.row];
    if ([@"GET" isEqualToString:cText]) {
        [self doHTTPGETToFileAction];
    } else if ([@"POST" isEqualToString:cText]) {
        [self doHTTPPOSTToFileAction];
    } else if ([@"POST-JSON" isEqualToString:cText]) {
        [self doHTTPPOSTJSONAction];
    } else {
        NSLog(@"Nothing to do...");
    }
}

#pragma mark - Action.

- (void)doHTTPGETToFileAction
{
    NSString *reqUrl = [NSString stringWithFormat:@"%@%@", URL_USER, @"?id=1&name=veryitman"];
    NSLog(@"Req url: %@", reqUrl);
    const char *url = [reqUrl cStringUsingEncoding:NSUTF8StringEncoding];
    http_get_req(url);
}

- (void)doHTTPPOSTToFileAction
{
    NSLog(@"Req url: %@", URL_USER);
    const char *url = [URL_USERINFO cStringUsingEncoding:NSUTF8StringEncoding];
    const char *data = "id=2&name=veryitman";
    http_post_req(url, data);
}

- (void)doHTTPPOSTJSONAction
{
    NSLog(@"Req url: %@", URL_USERINFO);
    const char *url = [URL_USERINFO cStringUsingEncoding:NSUTF8StringEncoding];
    const char *data = "uid=25";
    http_post_callback(url, data);
}

- (NSMutableArray *)dataSources
{
    if (nil == _dataSources) {
        _dataSources = [[NSMutableArray alloc] init];
    }
    return _dataSources;
}

@end
