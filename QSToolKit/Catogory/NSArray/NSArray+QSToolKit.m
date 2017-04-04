//
//  NSArray+QSToolKit.m
//  QSToolKit
//
//  Created by qs on 16/10/30.
//  Copyright © 2016年 齐嵩. All rights reserved.
//

#import "NSArray+QSToolKit.h"

@implementation NSArray (QSToolKit)

- (id)sample {
    return self[arc4random() % self.count];
}

- (NSArray *)reverse {
    return self.reverseObjectEnumerator.allObjects;
}

- (NSString *)join:(NSString *)string {
    return [self componentsJoinedByString:string];
}

- (void)each:(void (^)())block {
    for (id obj in self) {
        block(obj, [self indexOfObject:obj], self);
    }
}

- (NSArray *)map:(id (^)())block {
    NSMutableArray *array = [NSMutableArray array];
    [self each:^(id obj, NSUInteger index, NSArray *list) {
        [array addObject:block(obj, index, list)];
    }];
    return array;
}

- (NSArray *)filter:(BOOL (^)())block {
    NSMutableArray *array = [NSMutableArray array];
    [self each:^(id obj, NSUInteger index, NSArray *list) {
        if (block(obj, index, list)) {
            [array addObject:obj];
        }
    }];
    return array;
}

- (BOOL)some:(BOOL (^)())block {
    for (id obj in self) {
        if (block(obj, [self indexOfObject:obj], self)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)every:(BOOL (^)())block {
    for (id obj in self) {
        if (!block(obj, [self indexOfObject:obj], self)) {
            return NO;
        }
    }
    return YES;
}

- (id)find:(BOOL (^)())block {
    for (id obj in self) {
        if (block(obj, [self indexOfObject:obj], self)) {
            return obj;
        }
    }
    return nil;
}

- (NSUInteger)findIndex:(BOOL (^)())block {
    id obj = [self find:block];
    return [self indexOfObject:obj];
}

- (id)reduce:(id (^)())block :(id)value {
    __block id _value = value;
    [self each:^(id obj, NSUInteger index, NSArray *list) {
        _value = block(_value, obj, index, list);
    }];
    return _value;
}


- (NSArray *)sort:(NSComparator)comparator {
    return [self sortedArrayUsingComparator:comparator];
}

- (NSArray *)chunk:(NSUInteger)size {
    NSMutableArray *sections = [NSMutableArray array];
    [self each:^(id value, NSUInteger index){
        NSMutableArray *section = sections.lastObject;
        if (!section || section.count >= size) {
            section = [NSMutableArray array];
            [sections addObject:section];
        }
        [section addObject:value];
    }];
    return sections;
}

@end
