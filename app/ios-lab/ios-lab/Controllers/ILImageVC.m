//
//  ILImageVCViewController.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILImageVC.h"

@interface ILImageVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ILImageVC

#pragma mark - Constructors

+ (instancetype)newWithImageFile:(ILImageFile *)imageFile {
    return [[ILImageVC alloc] initWithImageFile:imageFile];
}

- (id)initWithImageFile:(ILImageFile *)imageFile {
    self = [super init];
    if (self) {
        self.imageFile = imageFile;
    }
    return self;
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getters & Setters

- (void)setImageFile:(ILImageFile *)imageFile {
    _imageFile = imageFile;
    [self updateImageView];
}

#pragma mark - View methods

- (void)updateImageView {
    self.imageView.image = [UIImage imageWithContentsOfFile:self.imageFile.path];
}

@end
