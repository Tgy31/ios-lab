//
//  ILDirectoryNavigationController.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILDirectoryNavigationController.h"

// Controllers
#import "ILDirectoryTableViewVC.h"

@interface ILDirectoryNavigationController ()

@property (strong, nonatomic) ILDirectory *rootDirectory;

@end

@implementation ILDirectoryNavigationController

#pragma mark - Constructors

+ (instancetype)newWithRootDirectory:(ILDirectory *)rootDirectory {
    return [[ILDirectoryNavigationController alloc] initWithRootDirectory:rootDirectory];
}

- (id)initWithRootDirectory:(ILDirectory *)rootDirectory {
    ILDirectoryTableViewVC *rootVC = [ILDirectoryTableViewVC newWithDirectory:rootDirectory];
    self = [super initWithRootViewController:rootVC];
    if (self) {
        self.rootDirectory = rootDirectory;
    }
    return self;
}

@end
