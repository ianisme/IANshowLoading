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
        btn.frame = CGRectMake(15, self.view.frame.size.height - (i+1)*50, self.view.frame.size.width - 30, 40);
        btn.backgroundColor = [UIColor blackColor];
        btn.titleLabel.textColor = [UIColor whiteColor];
        btn.tag = 1001 + i;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [btn setTitle:@"Hide" forState:UIControlStateNormal];
        } else if(i == 1) {
            [btn setTitle:@"ShowGray" forState:UIControlStateNormal];
        } else {
            [btn setTitle:@"Show" forState:UIControlStateNormal];
        }
            
    }
    
}
- (void)Click:(UIButton *)btn
{
    if (btn.tag == 1001) {
        [IANshowLoading hideLoadingForView:self.view];
    }else if(btn.tag == 1002) {
        [IANshowLoading showGrayLoadingForView:self.view allowUserInteraction:YES];
    } else {
        [IANshowLoading showLoadingForView:self.view allowUserInteraction:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
