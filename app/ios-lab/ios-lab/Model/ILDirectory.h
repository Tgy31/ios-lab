//
//  ILDirectory.h
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILDirectory : NSObject


@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *path;
@property (strong, nonatomic, readonly) NSArray *tree;

+ (instancetype)directoryFromPath:(NSString *)path;

+ (BOOL)isDirectory:(NSString *)path;

@end
