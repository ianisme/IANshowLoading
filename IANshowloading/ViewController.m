//
//  ViewController.m
//  IANshowloading
//
//  Created by ian on 15/7/21.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "ViewController.h"
#import "IANshowLoading.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSUInteger i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.view.bounds.size.width/2 - 30, 50 + i*30, 60, 20);
        btn.backgroundColor = [UIColor blackColor];
        btn.titleLabel.textColor = [UIColor whiteColor];
        btn.tag = 1001 + i;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [btn setTitle:@"simple" forState:UIControlStateNormal];
        } else if(i == 1) {
            [btn setTitle:@"gray" forState:UIControlStateNormal];
        } else {
            [btn setTitle:@"hide" forState:UIControlStateNormal];
        }
            
    }
    
}
- (void)Click:(UIButton *)btn
{
    if (btn.tag == 1001) {
        [IANshowLoading showLoadingForView:self.view allowUserInteraction:YES];
    }else if(btn.tag == 1002) {
        [IANshowLoading showGrayLoadingForView:self.view allowUserInteraction:YES];
    } else {
        [IANshowLoading hideLoadingForView:self.view];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
