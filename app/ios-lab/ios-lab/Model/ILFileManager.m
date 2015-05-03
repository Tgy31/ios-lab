//
//  ILFileManager.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILFileManager.h"

static ILFileManager *sharedManager;

@implementation ILFileManager

#pragma mark - Singleton

+ (ILFileManager *)sharedManager {
    if (!sharedManager) sharedManager = [ILFileManager new];
    return sharedManager;
}

+ (ILDirectory *)readSharedDirectory {
    return [[ILFileManager sharedManager] readSharedDirectory];
}

#pragma mark - Methods

- (ILDirectory *)readSharedDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *publicDocumentsDir = [paths objectAtIndex:0];
    
    ILDirectory *rootDirectory = [ILDirectory directoryFromPath:publicDocumentsDir];
    
    return rootDirectory;
}

@end
