//
//  LYHGuidePageViweController.m
//  LYHGuidePage
//
//  Created by 刘英豪 on 16/7/21.
//  Copyright © 2016年 YnGHo. All rights reserved.
//

#import "LYHGuidePageViweController.h"
#import "LYHTestViewController.h"

#import "LYHGuidePageView.h"

#define LYHScreenW  [UIScreen mainScreen].bounds.size.width
#define LYHScreenH  [UIScreen mainScreen].bounds.size.height

@interface LYHGuidePageViweController ()

@property (nonatomic, strong) NSArray *guidePageArr;

@end

@implementation LYHGuidePageViweController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 1; i < 6; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"guideImage%zd.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [temp addObject:image];
        
    }
    self.guidePageArr = temp;

    
    
    LYHGuidePageView * guidePageView = [LYHGuidePageView lyh_GuidePageFrame:CGRectMake(0, 0, LYHScreenW, LYHScreenH) imageArray:self.guidePageArr btnImage:[UIImage imageNamed:@"view_bg_image" ] buttonIsHidden:YES];

     LYHTestViewController * testVc = [[LYHTestViewController alloc] init];
       __weak LYHGuidePageView *weakSelf = guidePageView;
    guidePageView.startBlock = ^ {
        [weakSelf removeFromSuperview];
        [UIApplication sharedApplication].keyWindow.rootViewController = testVc;
    };
    
    
    
    
    
    [self.view addSubview:guidePageView];

    
}



@end


