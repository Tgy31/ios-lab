//
//  ILDirectoryTableViewVC.h
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>

// Models
#import "ILDirectory.h"

@interface ILDirectoryTableViewVC : UITableViewController

@property (strong, nonatomic) ILDirectory *directory;

+ (instancetype)newWithDirectory:(ILDirectory *)directory;

@end
