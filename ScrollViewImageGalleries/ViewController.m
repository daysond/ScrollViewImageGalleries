//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Dayson Dong on 2019-05-13.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic)UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpScrollView];
    
    
    
    
}

-(void)setUpScrollView {
    
    
    for (int i = 1; i < 4; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"image%d",i];
        self.image = [UIImage imageNamed:imageName];
        self.imageView = [[UIImageView alloc] initWithImage:self.image];
        self.imageView.frame = CGRectMake(self.scrollView.frame.size.width *(i - 1) , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer *tapRecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
        [self.imageView addGestureRecognizer:tapRecog];
        [self.imageView setUserInteractionEnabled:YES];
        [self.scrollView addSubview:self.imageView];
        
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectZero];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [self.view addSubview:self.pageControl];

    [NSLayoutConstraint activateConstraints:@[[self.pageControl.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                                              [self.pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20.0],
                                              [self.pageControl.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
                                              [self.pageControl.heightAnchor constraintEqualToConstant:20]
                                              ]];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;

    
}

-(void)tapHandler:(UITapGestureRecognizer *)sender  {

    [self performSegueWithIdentifier:@"toDetailView" sender:sender];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITapGestureRecognizer*)sender {

    UIImageView *iv = (UIImageView*)sender.view;
    ImageDetailViewController* dvc = segue.destinationViewController;
    dvc.image =iv.image;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = lround(self.scrollView.contentOffset.x / pageWidth);
    self.pageControl.currentPage = page;
    
}



@end
