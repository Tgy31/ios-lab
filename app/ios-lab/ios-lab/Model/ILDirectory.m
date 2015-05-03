//
//  ILDirectory.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILDirectory.h"

// Models
#import "ILImageFile.h"

@interface ILDirectory()

@property (strong, nonatomic, readwrite) NSArray *tree;

@end

@implementation ILDirectory

#pragma mark - Contructors 

+ (instancetype)directoryFromPath:(NSString *)path {
    return [[ILDirectory alloc] initFromPath:path];
}

- (id)initFromPath:(NSString *)path {
    self = [super initFromPath:path];
    if (self) {
        self.tree = [self readTreeFromPath:path];
    }
    return self;
}

#pragma mark - Getters & Setters

- (BOOL)isDirectory {
    return YES;
}

#pragma mark - Helpers

+ (BOOL)isDirectory:(NSString *)path {
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    return isDirectory;
}

- (NSArray *)readTreeFromPath:(NSString *)path {
    
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
    }
    
    NSMutableArray *tree = [[NSMutableArray alloc] init];
    NSString *fullPath = nil;
    for (NSString *file in files) {
        fullPath = [self.path stringByAppendingPathComponent:file];
        if ([ILImageFile isImageFile:fullPath]) {
            ILImageFile *imageFile = [ILImageFile imageFileFromPath:fullPath];
            [tree addObject:imageFile];
        } else if ([ILDirectory isDirectory:fullPath]) {
            ILDirectory *directory = [ILDirectory directoryFromPath:fullPath];
            [tree addObject:directory];
        } else {
            NSLog(@"Failed to read : %@", file);
        }
    }
    
    return tree;
}

@end
