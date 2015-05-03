//
//  ViewController.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ViewController.h"

#import "ILFileManager.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self readFiles];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)readFiles {
    ILDirectory *root = [ILFileManager readSharedDirectory];
}

@end
