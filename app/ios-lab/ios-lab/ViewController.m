//
//  ViewController.m
//  ios-lab
//
//  Created by Tanguy Hélesbeux on 03/05/2015.
//  Copyright (c) 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    

}

// Source: http://www.raywenderlich.com/1948/itunes-tutorial-for-ios-how-to-integrate-itunes-file-sharing-with-your-ios-app
- (void)readFiles {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *publicDocumentsDir = [paths objectAtIndex:0];
    
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:publicDocumentsDir error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
    }
    
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"sbz" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fullPath = [publicDocumentsDir stringByAppendingPathComponent:file];
            //            [retval addObject:fullPath];
        }
    }
}

@end
