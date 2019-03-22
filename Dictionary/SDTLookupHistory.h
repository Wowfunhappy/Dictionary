//
//  LookupHistory.h
//  Dictionary
//
//  Created by Forrest Ye on 6/25/13.
//
//

#import <Foundation/Foundation.h>


@interface SDTLookupHistory : NSObject


# pragma mark - object life cycle


+ (instancetype)sharedInstance;


# pragma mark - history management


- (NSArray *)recent;

- (void)clear;

- (void)addLookupHistoryWithTerm:(NSString *)term;

- (void)removeLookupHistoryAtIndex:(NSUInteger)idx;

@property (readonly, nonatomic) NSUInteger count;


# pragma mark - object subscripting


- (NSString *)objectAtIndexedSubscript:(NSUInteger)idx;


@end
