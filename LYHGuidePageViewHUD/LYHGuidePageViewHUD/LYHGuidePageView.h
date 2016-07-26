//
//  LYHGuidePageView.h
//  LYHGuidePage
//
//  Created by 刘英豪 on 16/7/22.
//  Copyright © 2016年 YnGHo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYHGuidePageView : UIView


/**
 *  不显示立即体验按钮LYHGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *
 *  @return LYHGuidePageHUD对象
 */
- (instancetype)lyh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray  buttonIsHidden:(BOOL)isHidden;

/**
 显示立即体验按钮LYHGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *  @return LYHGuidePageHUD对象
 */
- (instancetype)lyh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray btnImage:(UIImage*)btnImage  buttonIsHidden:(BOOL)isHidden;


/**
 *  不显示立即体验按钮LYHGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *
 *  @return LYHGuidePageHUD对象
 */
+ (instancetype)lyh_GuidePageFrame:(CGRect)frame imageArray:(NSArray *)imageArray  buttonIsHidden:(BOOL)isHidden;

/**
 显示立即体验按钮LYHGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *  @return LYHGuidePageHUD对象
 */
+ (instancetype)lyh_GuidePageFrame:(CGRect)frame imageArray:(NSArray *)imageArray btnImage:(UIImage*)btnImage  buttonIsHidden:(BOOL)isHidden;



@property (nonatomic, strong) UIImage *btnImage;
@property (nonatomic, copy) void(^startBlock)();
@property (nonatomic, assign) BOOL isHiddenImage;

@end
