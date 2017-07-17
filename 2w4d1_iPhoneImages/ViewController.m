//
//  ViewController.m
//  2w4d1_iPhoneImages
//
//  Created by Seantastic31 on 17/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // ***** TO KEEP THE SAFETY FEATURE OF HTTPS GO TO THE WEBPAGE AND INSPECT TO FIND THE URL PATH TO THE SPECIFIC IMAGE (USUALLY ADDS i. AND THE FILE TYPE TO THE HTTP LINK) *****
    NSURL *url = [NSURL URLWithString:@"https://i.imgur.com/bktnImE.png"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // this will run on the main queue
            self.iPhoneImageView.image = image;
        }];
    }];
    
    [downloadTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
