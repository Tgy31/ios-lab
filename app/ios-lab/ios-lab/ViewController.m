//
//  ViewController.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ViewController.h"

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

- (BOOL)isDirectory:(NSString *)path {
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    return isDirectory;
}

- (NSArray *)readImagesAtPath:(NSString *)path {
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
    }
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    NSString *fullPath = nil;
    NSLog(@"%@", path);
    for (NSString *file in files) {
        fullPath = [path stringByAppendingPathComponent:file];
        UIImage *image = [UIImage imageWithContentsOfFile:fullPath];
        if (image) {
            NSLog(@"%@", file);
            [images addObject:image];
        } else if ([self isDirectory:fullPath]) {
            NSArray *subImages = [self readImagesAtPath:fullPath];
            [images addObject:subImages];
        } else {
            NSLog(@"Failed to read : %@", file);
        }
    }
    
    return images;
}

// Source: http://www.raywenderlich.com/1948/itunes-tutorial-for-ios-how-to-integrate-itunes-file-sharing-with-your-ios-app
- (void)readFiles {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *publicDocumentsDir = [paths objectAtIndex:0];
    
    NSArray *images = [self readImagesAtPath:publicDocumentsDir];
}

@end
