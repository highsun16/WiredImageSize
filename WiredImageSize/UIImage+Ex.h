//
//  UIImage+Ex.h
//  GoShopping
//
//  Created by Diao Junfang on 15/10/27.
//  Copyright © 2015年 LITB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ex)

- (UIImage *)gs_croppedImageWithRect:(CGRect)rect;
+ (UIImage *)gs_imageFromColor:(UIColor *)color;
+ (UIImage *)gs_scaledImageWithWidth:(float)width image:(UIImage*)image;

@end
