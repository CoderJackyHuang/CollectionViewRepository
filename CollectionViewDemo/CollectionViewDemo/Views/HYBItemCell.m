//
//  HYBItemCell.m
//  CollectionViewDemo
//
//  Created by ljy-335 on 14-9-29.
//  Copyright (c) 2014年 uni2uni. All rights reserved.
//

#import "HYBItemCell.h"

@implementation HYBItemCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 图片
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0,
                                                                       frame.size.width - 20,
                                                                       frame.size.height - 30)];
        [self.contentView addSubview:self.imageView];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        // 标题
        CGFloat originY = self.imageView.bounds.origin.y + self.imageView.bounds.size.height;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, originY, frame.size.width, 30)];
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blueColor];
    }
    return self;
}

@end
