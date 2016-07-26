//
//  LYHGuidePageCell.h
//  LYHGuidePage
//
//  Created by 刘英豪 on 16/7/21.
//  Copyright © 2016年 YnGHo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYHGuidePageCell : UICollectionViewCell

@property (nonatomic ,strong)UIImage *image;
@property (nonatomic, strong) UIImage *btnImage;
@property (nonatomic, assign) BOOL isClick;
@property (nonatomic, copy) void(^startBlock)();

- (void)setStartBtnWithIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count image:(UIImage*)image;

@end
