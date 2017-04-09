//
//  NSString+QSToolKit.m
//  QSToolKit
//
//  Created by QS on 16/11/1.
//  Copyright © 2016年 齐嵩. All rights reserved.
//

#import "NSString+QSToolKit.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (QSToolKit)

#pragma mark - API Extension

- (NSString *)first {
    if (self.length == 0) return nil;
    return [self substringToIndex:1];
}

- (NSString *)last {
    if (self.length == 0) return nil;
    if (self.length == 1) return self;
    return [self substringFromIndex:self.length - 1];
}

- (BOOL)isInteger {
    NSScanner *scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return [scan scanInteger:&val] && [scan isAtEnd];
}

- (NSInteger)getInteger {
    NSCharacterSet* nonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return [[self stringByTrimmingCharactersInSet:nonDigits] integerValue];
}



#pragma mark - URL
- (BOOL)isURL {
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    return [detector matchesInString:self options:0 range:NSMakeRange(0, self.length)].count;
}

- (NSString *)URLAppendPath:(NSString *)path {
    return [[NSURL URLWithString:self] URLByAppendingPathComponent:path].absoluteString;
}

- (NSString *)URLAppendExt:(NSString *)ext {
    return [[NSURL URLWithString:self] URLByAppendingPathExtension:ext].absoluteString;
}



#pragma mark - Base64

- (NSString *)base64Encoding {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64Decoding {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}



#pragma mark - MD5

- (NSString *)MD5Hash {
    const char *cstr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}

+ (NSString *)MD5HashOfData:(NSData *)data {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}

+ (NSString *)MD5HashOfFile:(NSString *)path {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath: path];
    if (handle == nil) {
        return nil;
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    
    BOOL done = NO;
    
    while (!done) {
        NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
        CC_MD5_Update (&md5, [fileData bytes], (float)[fileData length]);
        
        if ([fileData length] == 0) {
            done = YES;
        }
    }
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (result, &md5);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}






+ (NSString *)fitConvertSize:(NSInteger)size {
    NSInteger k = 1024, m = 1024 * k, g = 1024 * m;
    if (size / g) {
        return [NSString stringWithFormat:@"%.2fGB",(size * 1.f / g)];
    }
    if (size / m) {
        return [NSString stringWithFormat:@"%.2fMB",(size * 1.f / m)];
    }
    if (size / k) {
        return [NSString stringWithFormat:@"%.2fKB",(size * 1.f / k)];
    }
    return [NSString stringWithFormat:@"%@B",@(size)];
}

@end
