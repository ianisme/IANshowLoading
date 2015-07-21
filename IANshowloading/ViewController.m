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
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(self.view.bounds.size.width/2 - 30, 100, 60, 20);
    btn1.backgroundColor = [UIColor redColor];
    btn1.tag = 1001;
    [btn1 setTitle:@"show" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(self.view.bounds.size.width/2 - 30, 130, 60, 20);
    btn2.backgroundColor = [UIColor redColor];
    btn2.tag = 1002;
    [btn2 setTitle:@"hide" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)Click:(UIButton *)btn
{
    if (btn.tag == 1001) {
        [IANshowLoading showLoadingForView:self.view allowUserInteraction:YES];
    }else {
        [IANshowLoading hideLoadingForView:self.view];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
