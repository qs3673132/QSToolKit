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
- (void)each:(void(^)(id obj))block;
- (void)eachWithIndex:(void(^)(id obj, NSUInteger index))block;
- (NSArray *)map:(id(^)(id obj))block;
- (NSArray *)mapWithIndex:(id(^)(id obj, NSUInteger index))block;
- (NSArray *)filter:(BOOL(^)(id obj))block;
- (NSArray *)filterWithIndex:(BOOL(^)(id obj, NSUInteger index))block;
- (BOOL)some:(BOOL(^)(id obj))block;
- (BOOL)someWithIndex:(BOOL(^)(id obj, NSUInteger index))block;
- (BOOL)every:(BOOL(^)(id obj))block;
- (BOOL)everyWithIndex:(BOOL(^)(id obj, NSUInteger index))block;
- (id)find:(BOOL(^)(id obj))block;
- (id)findWithIndex:(BOOL(^)(id obj, NSUInteger index))block;
- (id)reduce:(id)value :(BOOL(^)(id obj))block;
- (id)reduceWithIndex:(BOOL(^)(id obj, NSUInteger index))block :(id)value;

- (BOOL)findIndex:(BOOL(^)())block;

@end
