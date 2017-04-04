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
- (NSArray *)reverse;
- (NSString *)join:(NSString *)string;

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

@end
