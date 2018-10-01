//
// HMCNotification.h
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


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HMCNotification : NSObject

/**
 *  Created shared instance.
 *
 *  @return self - STBaseUtilClass
 */
+ (HMCNotification *)sharedInstance;

#pragma mark - Methods
/**
 Will show a customized view same as the Apple push notification

 @param title Push title
 @param message Push message
 @param iconImageName Push icon image name
 */
+ (void)showCustomPushWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;


#pragma mark - Properties
/**
 Set notification message color. Default is black
 */
@property (nonatomic, strong) UIColor *messageFontColor;

/**
 Set notification background blur effect. Default is black
 */
@property (nonatomic, strong) UIColor *titleFontColor;

/**
 Set notification background blur effect. Default is UIBlurEffectStyleExtraLight
 */
@property (nonatomic, assign) UIBlurEffectStyle blurStyle;

@property (nonatomic, assign) BOOL pushPresented;

@end
