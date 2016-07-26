//
//  LYHGuidePageView.m
//  LYHGuidePage
//
//  Created by 刘英豪 on 16/7/22.
//  Copyright © 2016年 YnGHo. All rights reserved.
//

#import "LYHGuidePageView.h"
#import "LYHGuidePageCell.h"

#define LYHScreenW  [UIScreen mainScreen].bounds.size.width
#define LYHScreenH  [UIScreen mainScreen].bounds.size.height

@interface LYHGuidePageView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView * collectionView;
@property (nonatomic, weak) UIScrollView * scrollView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, weak) UIPageControl * pageC;
@property (nonatomic, weak) LYHGuidePageCell * cell;

@end

static NSString * const ID = @"guidePage";

@implementation LYHGuidePageView


+ (instancetype)lyh_GuidePageFrame:(CGRect)frame imageArray:(NSArray *)imageArray  buttonIsHidden:(BOOL)isHidden {
    
    
    return [[self alloc] lyh_initWithFrame:frame imageArray:imageArray buttonIsHidden:isHidden];
}

+ (instancetype)lyh_GuidePageFrame:(CGRect)frame imageArray:(NSArray *)imageArray btnImage:(UIImage*)btnImage  buttonIsHidden:(BOOL)isHidden {
    
    return [[self alloc] lyh_initWithFrame:frame imageArray:imageArray btnImage:btnImage buttonIsHidden:isHidden];
}


- (instancetype)lyh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray btnImage:(UIImage*)btnImage  buttonIsHidden:(BOOL)isHidden {
    
    if ([super initWithFrame:frame]) {
        
        self.isHiddenImage = isHidden;
        
        self.imageArray = imageArray;
        
        self.btnImage = btnImage;
        
        [self addCollectionView];
        [self addPageController];
        
        [self.collectionView registerClass:[LYHGuidePageCell class] forCellWithReuseIdentifier:ID];
    }
    return self;
}

- (instancetype)lyh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray buttonIsHidden:(BOOL)isHidden {
    
    if ([super initWithFrame:frame]) {
        
        self.imageArray = imageArray;
        self.isHiddenImage = isHidden;
        
        [self addCollectionView];
        [self addPageController];
        
        [self.collectionView registerClass:[LYHGuidePageCell class] forCellWithReuseIdentifier:ID];
    }
    return self;
}

#pragma mark---添加UIPageControl

- (void)addPageController {
    
    UIPageControl * pageC = ({
        pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, LYHScreenH * 0.9, LYHScreenW, LYHScreenH * 0.1)];
        pageC.currentPage = 0;
        pageC.numberOfPages = self.imageArray.count;
        pageC.pageIndicatorTintColor = [UIColor grayColor];
        self.pageC = pageC;
        pageC;
    });
    [self addSubview:self.pageC];
}

#pragma mark-----UICollectionViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  {
    
    int page = scrollView.contentOffset.x / LYHScreenW;
    
    [self.pageC setCurrentPage:page];
    
    if (self.imageArray.count - 1 == page) {
        
        self.cell.isClick = self.isHiddenImage;
    }
}

- (void)addCollectionView {
    
    UICollectionViewFlowLayout * flowL = ({
        flowL = [[UICollectionViewFlowLayout alloc] init];
        flowL.itemSize = CGSizeMake(LYHScreenW, LYHScreenH);
        flowL.minimumLineSpacing = 0;
        flowL.minimumInteritemSpacing = 0;
        flowL.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowL;
    });
    
    UICollectionView * collectionView = ({
        collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, LYHScreenW, LYHScreenH) collectionViewLayout:flowL];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        self.collectionView = collectionView;
        collectionView.pagingEnabled = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView;
    });
    
    [self addSubview:collectionView];
}

#pragma mark --------  UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imageArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LYHGuidePageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    self.cell = cell;
    __weak typeof(self) weakSelf = self;
    cell.startBlock = ^ {
        if (weakSelf.startBlock != nil) {
            weakSelf.startBlock();
        }
    };
    cell.image = self.imageArray[indexPath.row];
    [cell setStartBtnWithIndexPath:indexPath count:self.imageArray.count image:self.btnImage];
    
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
    
}

@end
