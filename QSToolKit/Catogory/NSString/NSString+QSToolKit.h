//
//  NSString+QSToolKit.h
//  QSToolKit
//
//  Created by QS on 16/11/1.
//  Copyright © 2016年 齐嵩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QSToolKit)

- (NSString *)firstChar;
- (NSString *)lastChar;
- (BOOL)isIntegerNumber;




- (NSString *)MD5Hash;
+ (NSString *)MD5HashOfData:(NSData *)data;
+ (NSString *)MD5HashOfFile:(NSString *)path;

@end
