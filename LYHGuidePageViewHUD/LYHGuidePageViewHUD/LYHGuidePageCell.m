//
//  LYHGuidePageCell.m
//  LYHGuidePage
//
//  Created by 刘英豪 on 16/7/21.
//  Copyright © 2016年 YnGHo. All rights reserved.
//

#import "LYHGuidePageCell.h"

#define LYHScreenW  [UIScreen mainScreen].bounds.size.width
#define LYHScreenH  [UIScreen mainScreen].bounds.size.height

@interface LYHGuidePageCell ()

@property (nonatomic,weak) UIImageView *imageV;
@property (nonatomic,weak) UIButton *startBtn;

@end

@implementation LYHGuidePageCell

- (UIImageView *)imageV {
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}

- (UIButton *)startBtn {
    
    if (_startBtn == nil) {
        //创建按钮
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [startBtn setImage:self.btnImage forState:UIControlStateNormal];
        //自适应大小
//        [startBtn sizeToFit];
        //设置位置
        startBtn.frame = CGRectMake(LYHScreenW * 0.5, LYHScreenH* 0.8, 140, 40);
        startBtn.center = CGPointMake(LYHScreenW * 0.5, LYHScreenH* 0.8);
       
        [self.contentView addSubview:startBtn];
        //监听按钮的点击
        [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchDown];
        _startBtn = startBtn;
    }
    return _startBtn;
    
}

- (void)setIsClick:(BOOL)isClick {

    _isClick = isClick;
    __weak typeof(self) weakSelf = self;
    if (isClick == YES) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf startBtnClick];
        });
    }
}


//开始按钮的点击
- (void)startBtnClick {
    
    if (self.startBlock != nil) {
        
        self.startBlock();
    }
 
}

- (void)setStartBtnWithIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count image:(UIImage*)image {
    
    self.btnImage = image;
    //如果是最后一个,添加立即体验按钮
    if (indexPath.item == count -1) {
        self.startBtn.hidden = NO;
    }else {
        self.startBtn.hidden = YES;
    }
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imageV.image = image;

}


@end
