//
//  UIImage+Ex.m
//  GoShopping
//
//  Created by Diao Junfang on 15/10/27.
//  Copyright © 2015年 LITB. All rights reserved.
//

#import "UIImage+Ex.h"

@implementation UIImage (Ex)
- (UIImage *)gs_croppedImageWithRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return image;
}

+ (UIImage *)gs_imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)gs_scaledImageWithWidth:(float)width image:(UIImage*)image
{
    float oldWidth = image.size.width;
    float scaleFactor = width / oldWidth;

    float newHeight = image.size.height * scaleFactor;

    UIGraphicsBeginImageContext(CGSizeMake(width, newHeight));
    [image drawInRect:CGRectMake(0, 0, width, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

@end
