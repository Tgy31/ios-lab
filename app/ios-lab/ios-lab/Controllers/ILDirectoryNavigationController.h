//
//  ILDirectoryNavigationController.h
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>

// Models
#import "ILDirectory.h"

@interface ILDirectoryNavigationController : UINavigationController

+ (instancetype)newWithRootDirectory:(ILDirectory *)rootDirectory;

@end
