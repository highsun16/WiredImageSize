//
//  AnotherViewController.m
//  WiredImageSize
//
//  Created by Highsun on 3/28/16.
//  Copyright © 2016 Highsun. All rights reserved.
//

#import "AnotherViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Ex.h"
#import "CustomCell.h"

static NSString * const kImageUrl = @"http://img02.tooopen.com/images/20151228/tooopen_sy_152967398112.jpg";

@implementation AnotherViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    __weak typeof(CustomCell) *wCell = cell;
    [cell.bigImageView sd_setImageWithURL:[NSURL URLWithString:kImageUrl] placeholderImage:[UIImage imageNamed:@"default_cover"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIImage *scaledImage = [UIImage gs_scaledImageWithWidth:[UIApplication sharedApplication].keyWindow.bounds.size.width image:image];
        wCell.bigImageView.image = scaledImage;
//        [wCell setNeedsUpdateConstraints];
    }];
    return cell;
}

@end
