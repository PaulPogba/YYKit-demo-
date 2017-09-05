//
//  ViewController.m
//  YYPhotoBrowseView
//
//  Created by Marchisio on 16/7/21.
//  Copyright © 2016年 DINGXU. All rights reserved.
//

#import "ViewController.h"
#import "YYPhotoBrowseView.h"
#import "NSObject+openCamara.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) NSMutableArray *imageViews;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pics.plist" ofType:nil];
    self.dataSource = [NSArray arrayWithContentsOfFile:path];
    for (int i =0; i < _dataSource.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:[self rectAtIndex:i]];
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGes:)];
        imgView.backgroundColor = [UIColor redColor];
        [imgView addGestureRecognizer:tap];
        imgView.tag = i;
        NSURL *url = [NSURL URLWithString:_dataSource[i][@"thumbnail_url"]];
        [imgView yy_setImageWithURL:url options:YYWebImageOptionShowNetworkActivity];
        
        [self.view addSubview:imgView];
        [self.imageViews addObject:imgView];
    }
}
- (void)handleTapGes:(UITapGestureRecognizer *)tap{
//
    NSInteger selectIndex = [(UIImageView *)tap.view tag];
    
    ///这里如果图片小图跟大图不一样，传URL，如果没有，大图小图就一张图，URL传空就行
    [self openPhoto:self.imageViews Url:self.dataSource view:self.navigationController.view tag:selectIndex];

    
}
-(CGRect)rectAtIndex:(NSInteger)index{
    //    KcolNumber 每行的个数
    //    Kwidth     控件的宽
    NSInteger KcolNumber = 3;
    CGFloat margin = 10;
    
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - (margin * KcolNumber +1))/(KcolNumber);
    
    CGFloat height = width;
    
    NSUInteger rowIndex = 0;
    NSUInteger colIndex = 0;
    rowIndex = index /KcolNumber;
    colIndex = index %KcolNumber;
    X = colIndex * width + (colIndex)*margin + 5;
    Y = rowIndex * width + (rowIndex)*margin +64;
    return CGRectMake(X, Y, width, height);
}

- (NSMutableArray *)imageViews{
    if (!_imageViews) {
        _imageViews = [NSMutableArray array];
    }
    return _imageViews;
    
}



@end
