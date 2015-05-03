//
//  ILFileManager.h
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import <Foundation/Foundation.h>

// Models
#import "ILDirectory.h"

@interface ILFileManager : NSObject

+ (ILDirectory *)readSharedDirectory;

@end
