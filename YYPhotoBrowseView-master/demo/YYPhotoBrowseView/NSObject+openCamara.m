//
//  NSObject+openCamara.m
//  YYPhotoBrowseView
//
//  Created by Marchisio on 2017/9/1.
//  Copyright © 2017年 DINGXU. All rights reserved.
//

#import "NSObject+openCamara.h"
#import "YYPhotoBrowseView.h"

@implementation NSObject (openCamara)
- (void)openPhoto:(NSArray *)imageViews Url:(NSArray *)imageUrl view:(UIView *)locationView tag:(NSInteger)tag{

    NSInteger selectIndex = tag;
    
    NSLog(@"点击了%ld",selectIndex);
    
    NSMutableArray *items = [NSMutableArray array];
    
    UIView *fromView = nil;
    
    for (int i =0; i < imageViews.count; i++) {
        
        YYPhotoGroupItem *item = [YYPhotoGroupItem new];
        
        item.thumbView = imageViews[i];
        if (imageUrl != nil) {
            NSURL *url = [NSURL URLWithString:imageUrl[i][@"large_url"]];
            item.largeImageURL = url;
        }
        [items addObject:item];
        if (i == selectIndex) {
            fromView = imageViews[i];
        }
    }
    
    YYPhotoBrowseView *groupView = [[YYPhotoBrowseView alloc]initWithGroupItems:items];
    [groupView presentFromImageView:fromView toContainer:locationView animated:YES completion:nil];
}
@end
