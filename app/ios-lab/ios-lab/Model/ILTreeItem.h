//
//  ILTreeItem.h
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILTreeItem : NSObject

@property (strong, nonatomic) NSString *path;

- (NSString *)nameWithExtension:(BOOL)extension;
- (BOOL)isDirectory;
- (BOOL)isImage;

@end
