//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpScrollView];
    
    
}

-(void)setUpScrollView {
    
    for (int i = 1; i < 4; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"image%d",i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(self.scrollView.frame.size.width *(i - 1) , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
        
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
    
    self.scrollView.pagingEnabled = YES;
    
}


@end
