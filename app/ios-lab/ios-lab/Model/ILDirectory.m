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

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *path;
@property (strong, nonatomic, readwrite) NSArray *tree;

@end

@implementation ILDirectory

#pragma mark - Contructors 

+ (instancetype)directoryFromPath:(NSString *)path {
    return [[ILDirectory alloc] initFromPath:path];
}

- (id)initFromPath:(NSString *)path {
    self = [super init];
    if (self) {
        self.path = path;
    }
    return self;
}

#pragma mark - Getters & Setters

- (void)setPath:(NSString *)path {
    _path = path;
    self.name = [self extractNameFromPath:path];
    self.tree = [self readTreeFromPath:path];
}

#pragma mark - Helpers

+ (BOOL)isDirectory:(NSString *)path {
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    return isDirectory;
}

- (NSString *)extractNameFromPath:(NSString *)path {
    return [[path lastPathComponent] stringByDeletingPathExtension];
}

- (NSArray *)readTreeFromPath:(NSString *)path {
    
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
    }
    
    NSMutableArray *tree = [[NSMutableArray alloc] init];
    NSString *fullPath = nil;
    NSLog(@"%@", path);
    for (NSString *file in files) {
        fullPath = [self.path stringByAppendingPathComponent:file];
        if ([ILImageFile isImageFile:fullPath]) {
            NSLog(@"%@", file);
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
