//
//  DJCell.m
//  瀑布流
//
//  Created by Mr.Deng on 16/1/4.
//  Copyright © 2016年 Mr.Deng. All rights reserved.
//

#import "DJCell.h"

@implementation DJCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
}

@end
