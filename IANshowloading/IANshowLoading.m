//
//  IANshowLoading.m
//  IANshowloading
//
//  Created by ian on 15/7/21.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "IANshowLoading.h"

@interface IANshowLoading()

@property (nonatomic, strong)UIImageView *loadingImageView;
@property (nonatomic) BOOL removeFromSuperViewOnHide;

@end

@implementation IANshowLoading

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initItem];
    }
    return self;
}

- (void)initItem
{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [imgArray addObject:image];

    }
    self.loadingImageView.backgroundColor = [UIColor clearColor];
    self.loadingImageView.animationImages = imgArray;
    self.loadingImageView.animationDuration = 0.4f;
    [self addSubview:self.loadingImageView];
    [self.loadingImageView startAnimating];

}

- (id)initWithView:(UIView *)view
{
    return [self initWithFrame:view.bounds];
}

+ (void)showLoadingForView:(UIView *)view
{
    [[self class] showLoadingForView:view allowUserInteraction:YES];
}

+ (void)showLoadingForView:(UIView *)view allowUserInteraction:(BOOL)allowUserInteraction
{
    IANshowLoading *loadingView = [[self alloc] initWithView:view];
    loadingView.userInteractionEnabled = !allowUserInteraction;
    [loadingView setAlpha:0];
    [view addSubview:loadingView];
    [loadingView showViewWithAnimate:YES];
}

+ (BOOL)hideLoadingForView:(UIView *)view
{
    IANshowLoading *gearLoading = [self gearLoadingForView:view];
    if (gearLoading != nil) {
        [gearLoading hideViewWithAnimate:YES];
        return YES;
    }
    return NO;
}

+ (instancetype)gearLoadingForView:(UIView *)view
{
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (IANshowLoading *)subview;
        }
    }
    return nil;
}

-(void)showViewWithAnimate:(BOOL)animate
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideViewWithAnimate:(BOOL)animate
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UIImageView *)loadingImageView
{
    if (!_loadingImageView) {
        _loadingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - 25, self.bounds.size.height/2 - 25, 50, 50)];
    }
    return _loadingImageView;
}

@end
