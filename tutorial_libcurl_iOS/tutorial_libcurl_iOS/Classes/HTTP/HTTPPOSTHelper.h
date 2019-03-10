//
//  HTTPPOSTHelper.h
//  tutorial_libcurl_iOS
//
//  Created by mark.zhang on 2019/3/8.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHTTPHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTTPPOSTHelper : BaseHTTPHelper

void http_post_req(const char *url, const char *req_data);

@end

NS_ASSUME_NONNULL_END
