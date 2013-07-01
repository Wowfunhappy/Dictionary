//
//  LookupRequest.h
//  Dictionary
//
//  Created by Forrest Ye on 6/28/13.
//
//

#import <Foundation/Foundation.h>

@class LookupResponse;

typedef void(^DictionaryLookupProgress)(LookupResponse* response);


@interface LookupRequest : NSObject


- (void)startLookingUpDictionaryWithTerm:(NSString *)term batchCount:(NSUInteger)batchCount progressBlock:(DictionaryLookupProgress)block;


@end
