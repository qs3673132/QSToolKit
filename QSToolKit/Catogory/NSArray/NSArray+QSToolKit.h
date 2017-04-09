//
//  NSArray+QSToolKit.h
//  QSToolKit
//
//  Created by qs on 16/10/30.
//  Copyright © 2016年 齐嵩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (QSToolKit)

- (id)sample;
- (NSArray *)sampleSize:(NSUInteger)size;
- (NSArray *)shuffle;
- (NSArray *)reverse;
- (NSString *)join:(NSString *)separator;

- (void)each:(void(^)())block;
- (NSArray *)map:(id(^)())block;
- (NSArray *)filter:(BOOL(^)())block;
- (BOOL)some:(BOOL(^)())block;
- (BOOL)every:(BOOL(^)())block;
- (id)find:(BOOL(^)())block;
- (NSUInteger)findIndex:(BOOL (^)())block;
- (id)reduce:(id(^)())block :(id)value;

- (NSArray *)sort:(NSComparator)comparator;

- (NSArray *)chunk:(NSUInteger)size;

- (NSArray *)concat:(NSArray *)array;
+ (NSArray *)concat:(id)obj, ...;

- (NSArray *)difference:(NSArray *)values;

- (NSArray *)drop:(NSUInteger)index;
- (NSArray *)dropRight:(NSUInteger)index;

- (NSArray *)initial;
- (NSArray *)tail;

- (NSArray *)compact;
- (NSArray *)uniq;


- (NSArray *)flatten;
- (NSArray *)flattenDeep;
- (NSArray *)flattenDepth:(NSUInteger)index;

@end
