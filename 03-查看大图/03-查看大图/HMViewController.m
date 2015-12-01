//
//  HMViewController.m
//  03-查看大图
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

// 假设图像是从网络上获取的
@property (nonatomic, strong) UIImage *image;

@end

@implementation HMViewController

// 图像的setter
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    // 设置图像视图的内容
    self.imageView.image = image;
    // 让图像视图根据图像自动调整大小
    [self.imageView sizeToFit];
    
    // 告诉scrollView内部内容的实际大小
    self.scrollView.contentSize = image.size;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 设置图像
    self.image = [UIImage imageNamed:@"minion"];
    
    // 设置边距
    self.scrollView.contentInset = UIEdgeInsetsMake(50, 20, 20, 20);
    
    // 不显示水平滚动标示
    self.scrollView.showsHorizontalScrollIndicator = NO;
    // 不显示垂直滚动标示
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // *** 偏移位置
    self.scrollView.contentOffset = CGPointMake(0, -100);
    
    // 取消弹簧效果，内容固定，不希望出现弹簧效果时
    // 不要跟bounds属性搞混了
    self.scrollView.bounces = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click
{
    // 移动大图的偏移位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 20;
    offset.y += 20;
    
    // 注意：设置contentOffset会忽略contentSize
    self.scrollView.contentOffset = offset;
}

@end
