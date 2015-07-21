//
//  IANshowLoading.h
//  IANshowloading
//
//  Created by ian on 15/7/21.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IANshowLoading : UIView

+ (void)showLoadingForView:(UIView *)view;
+ (void)showLoadingForView:(UIView *)view allowUserInteraction:(BOOL)allowUserInteraction;
+ (BOOL)hideLoadingForView:(UIView *)view;

@end
