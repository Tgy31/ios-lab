//
//  ILImageVCViewController.h
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>

// Models
#import "ILImageFile.h"

@interface ILImageVC : UIViewController

@property (strong, nonatomic) ILImageFile *imageFile;

+ (instancetype)newWithImageFile:(ILImageFile *)imageFile;

@end
