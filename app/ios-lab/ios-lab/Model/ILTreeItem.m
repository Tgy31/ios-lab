//
//  ILTreeItem.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILTreeItem.h"

@implementation ILTreeItem

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
