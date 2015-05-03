//
//  ILTreeItem.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILTreeItem.h"

@interface ILTreeItem()

@property (strong, nonatomic, readwrite) NSString *path;

@end

@implementation ILTreeItem

#pragma mark - Constructors


- (id)initFromPath:(NSString *)path {
    self = [super init];
    if (self) {
        self.path = path;
    }
    return self;
}

#pragma mark - Getters

- (NSString *)nameWithExtension:(BOOL)extension {
    return extension ? [self.path lastPathComponent] : [[self.path lastPathComponent] stringByDeletingPathExtension];
}

- (BOOL)isDirectory {
    return NO;
}

- (BOOL)isImage {
    return NO;
}

@end
