//
//  NSString+QSToolKit.h
//  QSToolKit
//
//  Created by QS on 16/11/1.
//  Copyright © 2016年 齐嵩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QSToolKit)

#pragma mark - API Extension
- (NSString *)firstChar;
- (NSString *)lastChar;
- (BOOL)isInteger;
- (NSInteger)getInteger;


#pragma mark - URL
- (BOOL)isURL;
- (NSString *)URLAppendPath:(NSString *)path;
- (NSString *)URLAppendExt:(NSString *)ext;


#pragma mark - Base64
- (NSString *)base64Encoding;
- (NSString *)base64Decoding;


#pragma mark - MD5
- (NSString *)MD5Hash;
+ (NSString *)MD5HashOfData:(NSData *)data;
+ (NSString *)MD5HashOfFile:(NSString *)path;


+ (NSString *)fitConvertSize:(NSInteger)size;

@end
