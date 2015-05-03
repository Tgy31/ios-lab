//
//  ILImageFile.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ILImageFile.h"

// Frameworks
#import <UIKit/UIImage.h>

@interface ILImageFile()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *path;
@property (strong, nonatomic, readwrite) UIImage *image;

@end

@implementation ILImageFile

#pragma mark - Constructors

+ (instancetype)imageFileFromPath:(NSString *)path {
    return [[ILImageFile alloc] initFromPath:path];
}

- (id)initFromPath:(NSString *)path {
    self = [super init];
    if (self) {
        self.path = path;
    }
    return self;
}

#pragma mark - Getters & Setters

- (UIImage *)image {
    if (!_image) _image = [UIImage imageWithContentsOfFile:self.path];
    return _image;
}

- (void)setPath:(NSString *)path {
    _path = path;
    self.name = [self extractNameFromPath:path];
}

#pragma mark - Helpers

+ (BOOL)isImageFile:(NSString *)path {
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    return img != nil;
}

- (NSString *)extractNameFromPath:(NSString *)path {
    return [path lastPathComponent];
}

@end
