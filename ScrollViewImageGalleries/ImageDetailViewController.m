//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ImageDetailViewController.h"
//#import "ViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate> 

@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;
@property (nonatomic) UIImageView* imageView;
@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpImageViewWithImage:self.image];
}

-(void)setUpImageViewWithImage: (UIImage*) image {
    
//    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    self.imageView = [[UIImageView alloc]initWithImage:self.image];
//    self.imageView.image = image;
    [self.scrollView addSubview:self.imageView];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.minimumZoomScale = self.scrollView.frame.size.width/ self.imageView.frame.size.width;
    self.scrollView.maximumZoomScale = 10.0;
    self.scrollView.zoomScale = self.scrollView.frame.size.width/ self.imageView.frame.size.width; 
    self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.center.y - self.imageView.center.y, 0, 0, 0);
    self.scrollView.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tapRecog = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler:)];
    [self.scrollView addGestureRecognizer:tapRecog];
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
    
}



-(void)tapHandler: (UITapGestureRecognizer*) sender {
    [self dismissViewControllerAnimated:NO completion:^{}];
}

@end
