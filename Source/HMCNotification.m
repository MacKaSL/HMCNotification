//
// HMCNotification.h
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright © Himal Madhushan - http://terceleye.lk
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "HMCNotification.h"

@implementation HMCNotification

+ (HMCNotification *)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - UIKit
+ (UIViewController *)rootViewController {
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

#pragma mark - Notification
+ (void)showCustomPushWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image {
    
    if ([HMCNotification sharedInstance].pushPresented == YES) {
        return;
    }
    
    // notification height
    CGFloat defaultHeight = 100;
    
    // how long the notification should stay
    float delay = 2;
    
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    
    // Creating effect view
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, -defaultHeight, screenFrame.size.width, defaultHeight)];
    effectView.tag = 509;
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:[HMCNotification sharedInstance].blurStyle];
    effectView.effect = blurEffect;
    effectView.alpha = 1;
    
    // Creating and adding content view.
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(effectView.frame.origin.x, 0, effectView.frame.size.width, effectView.frame.size.height)];
    contentView.backgroundColor = [UIColor colorWithRed:0.1922 green:0.2009 blue:0.2322 alpha:1.0];
    contentView.backgroundColor = [UIColor clearColor];
    [effectView.contentView addSubview:contentView];
    
    // Creating UIImageView for icon
    UIImageView *imgViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(20, CGRectGetMidY(contentView.frame) - 15, 40, 40)];
    imgViewIcon.image = image;
    [contentView addSubview:imgViewIcon];
    
    // Creating text container
    UIView *textContainer = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgViewIcon.frame)+10, 20,
                                                                     contentView.frame.size.width - (CGRectGetMaxX(imgViewIcon.frame)+10),
                                                                     contentView.frame.size.height)];
    [contentView addSubview:textContainer];
    
    // Title label
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, defaultHeight*12/100, textContainer.frame.size.width-10, 20)];
    lblTitle.numberOfLines = 0;
    lblTitle.text = title;
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.textColor = [HMCNotification sharedInstance].titleFontColor;
    [textContainer addSubview:lblTitle];
    
    // Message label
    UILabel *lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                    CGRectGetMaxY(lblTitle.frame),
                                                                    textContainer.frame.size.width-10,
                                                                    ((textContainer.frame.size.height-10) - CGRectGetMaxY(lblTitle.frame)))];
    lblMessage.numberOfLines = 0;
    lblMessage.text = message;
    lblMessage.font = [UIFont systemFontOfSize:13];
    lblMessage.textColor = [HMCNotification sharedInstance].messageFontColor;
    [textContainer addSubview:lblMessage];
    
    float labelHeight = [self getLabelHeight:lblMessage];
    
    if (labelHeight > 45) {
        CGRect frame = effectView.frame;
        defaultHeight = defaultHeight + 25;
        frame.size.height = defaultHeight;
        frame.origin.y = -defaultHeight;
        effectView.frame = frame;
        
        CGRect labelFrame = lblMessage.frame;
        labelFrame.size.height = labelHeight;
        lblMessage.frame = labelFrame;
        lblMessage.adjustsFontSizeToFitWidth = YES;
    } else {
        [lblMessage sizeToFit];
    }
    
    UIVisualEffectView *elapsedView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(effectView.frame.size.width/2 - 15, effectView.frame.size.height - 7, 30, 5)];
    elapsedView.layer.cornerRadius = elapsedView.frame.size.height/2;
    elapsedView.contentView.clipsToBounds = YES;
    elapsedView.clipsToBounds = YES;
    UIBlurEffect *elapsedBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    elapsedView.effect = elapsedBlurEffect;
    elapsedView.alpha = 1;
    [effectView addSubview:elapsedView];
    
    [[self rootViewController].view insertSubview:effectView atIndex:1000];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [HMCNotification sharedInstance].pushPresented = YES;
        effectView.transform = CGAffineTransformMakeTranslation(0, defaultHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
            effectView.transform = CGAffineTransformIdentity;
            effectView.alpha = 0;
        } completion:^(BOOL finished) {
            [effectView removeFromSuperview];
            [HMCNotification sharedInstance].pushPresented = NO;
        }];
    }];
}

+ (CGFloat)getLabelHeight:(UILabel*)label {
    CGSize constraint = CGSizeMake(label.frame.size.width, CGFLOAT_MAX);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [label.text boundingRectWithSize:constraint
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:label.font}
                                                  context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height;
}

+ (void)dismissPush:(UIView *)view gesture:(UISwipeGestureRecognizer *)gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionUp) {
        CGPoint point = [gesture locationInView:view];
        NSLog(@"x:%f , y:%f",point.x,point.y);
    }
}

@end
