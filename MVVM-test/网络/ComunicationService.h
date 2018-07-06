//
//  ComunicationService.h
//  MVVM-test
//
//  Created by biostime on 2018/7/2.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^SuccessFunction)(id data);
typedef void (^FailFunction)(id data);

@interface ComunicationService : NSObject

+ (ComunicationService *)defaultService;


-(void) get:(NSString *) method params:(NSDictionary *) params success:(SuccessFunction) success fail:(FailFunction)fail;

-(void) post:(NSString *) method params:(NSDictionary *) params success:(SuccessFunction) success fail:(FailFunction)fail;


@end
