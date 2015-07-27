//
//  IANshowLoading.m
//  IANshowloading
//
//  Created by ian on 15/7/21.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "IANshowLoading.h"

static NSUInteger const IANhubViewWith = 100;
static NSUInteger const IANhubViewHeight = 100;
static NSUInteger const IANloadingImageViewWith = 50;
static NSUInteger const IANloadingImageViewHeight = 50;

@interface IANshowLoading()

@property (nonatomic, strong) UIView *hudView;
@property (nonatomic, strong) UIImageView *loadingImageView;

@end

@implementation IANshowLoading


#pragma mark - Life Cycle -
- (instancetype)initWithFrame:(CGRect)frame isHudView:(BOOL)isHudView
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initItem:isHudView];
    }
    return self;
}

#pragma mark - Interface Method -

+ (void)showLoadingForView:(UIView *)view
{
    [[self class] showLoadingForView:view allowUserInteraction:NO];
}

+ (void)showLoadingForView:(UIView *)view allowUserInteraction:(BOOL)allowUserInteraction
{
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return ;
        }
    }

    IANshowLoading *loadingView = [[self alloc] initWithView:view isHudView:NO];
    loadingView.userInteractionEnabled = !allowUserInteraction;
    loadingView.alpha = 0;
    [view addSubview:loadingView];
    [loadingView showViewWithAnimate:YES];
}

+ (void)showGrayLoadingForView:(UIView *)view
{
    [[self class] showGrayLoadingForView:view allowUserInteraction:NO];
}

+ (void)showGrayLoadingForView:(UIView *)view allowUserInteraction:(BOOL)allowUserInteraction
{
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return ;
        }
    }
    
    IANshowLoading *loadingView = [[self alloc] initWithView:view isHudView:YES];
    loadingView.userInteractionEnabled = !allowUserInteraction;
    loadingView.alpha = 0;
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

#pragma mark - Private Method -

- (void)initItem:(BOOL)isHudView
{
    if (isHudView) {
        self.hudView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self addSubview:self.hudView];
    }

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

- (id)initWithView:(UIView *)view isHudView:(BOOL)isHudView
{
    return [self initWithFrame:view.bounds isHudView:isHudView];
}

+ (instancetype)gearLoadingForView:(UIView *)view
{
    NSMutableArray *array = [NSMutableArray array];
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            [array addObject:(IANshowLoading *)subview];
        }
    }
    if (array.count>1) {
        for (NSUInteger j = 0; j < array.count; j++) {
            IANshowLoading *loadingView = (IANshowLoading *)array[j];
            if (j != array.count - 1) {
                [loadingView removeFromSuperview];
            }
            if (j == array.count - 1){
                return (IANshowLoading *)array[j];
            }
        }
    }else {
        return (IANshowLoading *)array.firstObject;
    }
    return nil;
}

-(void)showViewWithAnimate:(BOOL)animate
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideViewWithAnimate:(BOOL)animate
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - getter and setter -
- (UIImageView *)loadingImageView
{
    if (!_loadingImageView) {
        _loadingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - IANloadingImageViewWith/2, self.bounds.size.height/2 - IANloadingImageViewHeight/2, IANloadingImageViewWith, IANloadingImageViewHeight)];
    }
    return _loadingImageView;
}
- (UIView *)hudView
{
    if (!_hudView) {
        _hudView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - IANhubViewWith/2, self.bounds.size.height/2 - IANhubViewHeight/2, IANhubViewWith, IANhubViewHeight)];
        _hudView.clipsToBounds = YES;
        _hudView.layer.cornerRadius = 10;
    }
    return _hudView;
}

@end
