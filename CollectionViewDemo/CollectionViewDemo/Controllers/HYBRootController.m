//
//  HYBViewController.m
//  CollectionViewDemo
//
//  Created by ljy-335 on 14-9-29.
//  Copyright (c) 2014年 uni2uni. All rights reserved.
//

#import "HYBRootController.h"
#import "HYBItemModel.h"
#import "HYBItemCell.h"

@interface HYBRootController () {
    NSMutableArray *_dataSource;
}

@end

@implementation HYBRootController

- (id)init {
    if (self = [super init]) {
        _dataSource = [[NSMutableArray alloc] init];
        for (NSUInteger section = 0; section < 5; section++) {
            NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
            for (NSUInteger row = 0; row < arc4random() % 16 + 5; row++) {
                HYBItemModel *itemModel = [[HYBItemModel alloc] init];
                itemModel.imageUrl = [NSString stringWithFormat:@"%lu", row % 9 + 1];
                itemModel.name = [NSString stringWithFormat:@"Item%luInSection%lu", row, section];
                [sectionArray addObject:itemModel];
            }
            [_dataSource addObject:sectionArray];
        }
        
        // 这段代码是注册相关信息，要求在创建此类时就提供非nil的
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        CGFloat h =  [UIScreen mainScreen].bounds.size.height - 64;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, h)
                                                 collectionViewLayout:flowLayout];
        [self.collectionView registerClass:[HYBItemCell class]
                forCellWithReuseIdentifier:@"HYBCollectionViewCellIdentifier"];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self.collectionView reloadData];
    return;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section < _dataSource.count) {
        NSArray *sectionArray = [_dataSource objectAtIndex:section];
        return sectionArray.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"HYBCollectionViewCellIdentifier";
    HYBItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                           forIndexPath:indexPath];
    if (!cell) {
        cell = [[HYBItemCell alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    }

    if (indexPath.section < _dataSource.count) {
        NSArray *sectionArray = [_dataSource objectAtIndex:indexPath.section];
        if (indexPath.row < sectionArray.count) {
            HYBItemModel *model = [sectionArray objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:model.imageUrl];
            cell.titleLabel.text = model.name;
        }
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate



@end
