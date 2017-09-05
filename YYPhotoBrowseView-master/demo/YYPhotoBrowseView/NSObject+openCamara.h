//
//  NSObject+openCamara.h
//  YYPhotoBrowseView
//
//  Created by Marchisio on 2017/9/1.
//  Copyright © 2017年 DINGXU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (openCamara)
- (void)openPhoto:(NSArray *)imageViews Url:(NSArray *)imageUrl view:(UIView *)locationView tag:(NSInteger)tag;
@end
