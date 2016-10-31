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

- (void)each:(void (^)(id))block {
    [self eachWithIndex:^(id obj, NSUInteger index) {
        block(obj);
    }];
}

- (void)eachWithIndex:(void (^)(id, NSUInteger))block {
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)map:(id (^)(id))block {
    return [self mapWithIndex:^id(id obj, NSUInteger index) {
        return block(obj);
    }];
}

- (NSArray *)mapWithIndex:(id (^)(id, NSUInteger))block {
    NSMutableArray *array = [NSMutableArray array];
    [self eachWithIndex:^(id obj, NSUInteger index) {
        [array addObject:block(obj, index)];
    }];
    return array;
}

- (NSArray *)filter:(BOOL (^)(id))block {
    return [self filterWithIndex:^BOOL(id obj, NSUInteger index) {
        return block(obj);
    }];
}

- (NSArray *)filterWithIndex:(BOOL (^)(id, NSUInteger))block {
    NSMutableArray *array = [NSMutableArray array];
    [self eachWithIndex:^(id obj, NSUInteger index) {
        if (block(obj, index)) {
            [array addObject:obj];
        }
    }];
    return array;
}

- (BOOL)some:(BOOL (^)(id))block {
    return [self someWithIndex:^BOOL(id obj, NSUInteger index) {
        return block(obj);
    }];
}

- (BOOL)someWithIndex:(BOOL (^)(id, NSUInteger))block {
    for (id obj in self) {
        if (block(obj, [self indexOfObject:obj])) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)every:(BOOL (^)(id))block {
    return [self everyWithIndex:^BOOL(id obj, NSUInteger index) {
        return block(obj);
    }];
}

- (BOOL)everyWithIndex:(BOOL (^)(id, NSUInteger))block {
    for (id obj in self) {
        if (!block(obj, [self indexOfObject:obj])) {
            return NO;
        }
    }
    return YES;
}

- (id)find:(BOOL (^)(id))block {
    return [self findWithIndex:^BOOL(id obj, NSUInteger index) {
        return block(obj);
    }];
}

- (id)findWithIndex:(BOOL (^)(id, NSUInteger))block {
    for (id obj in self) {
        if (block(obj, [self indexOfObject:obj])) {
            return obj;
        }
    }
    return nil;
}

- (BOOL)findIndex:(BOOL (^)())block {
    [self reduce:[NSMutableArray array] :^BOOL(id obj) {
        return YES;
    }];
    [self reduceWithIndex:^BOOL(id obj, NSUInteger index) {
        return YES;
    } :[NSMutableArray array]];
    return YES;
}

@end
