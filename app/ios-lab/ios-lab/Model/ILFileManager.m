//
//  ILFileManager.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILFileManager.h"

static ILFileManager *sharedManager;

@interface ILFileManager()

@property (strong, nonatomic) ILDirectory *rootDirectory;

@end

@implementation ILFileManager

#pragma mark - Singleton

+ (ILFileManager *)sharedManager {
    if (!sharedManager) sharedManager = [ILFileManager new];
    return sharedManager;
}

+ (ILDirectory *)readSharedDirectory {
    return [[ILFileManager sharedManager] readSharedDirectory];
}

+ (ILDirectory *)rootDirectory {
    return [[ILFileManager sharedManager] rootDirectory];
}

#pragma mark - Methods

- (ILDirectory *)readSharedDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *publicDocumentsDir = [paths objectAtIndex:0];
    
    self.rootDirectory = [ILDirectory directoryFromPath:publicDocumentsDir];
    
    return self.rootDirectory;
}

@end
