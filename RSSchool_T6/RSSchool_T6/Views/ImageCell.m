//
//  ImageCollectionViewCell.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/25/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "ImageCell.h"
@import Photos;

@interface ImageCell()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ImageCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImageView];
    }
    return self;
}

- (void)setupImageView {
    self.imageView = [UIImageView new];
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.imageView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]
    ]];
    
}

- (void)setAsset:(PHAsset *)asset {
    if (_asset != asset) {
        _asset = asset;
        
        PHImageManager *imageManager = [PHImageManager defaultManager];
        
//        PHImageRequestOptions *requestOptions = [PHImageRequestOptions new];
//        [requestOptions setSynchronous:YES];
//        [requestOptions setVersion:PHImageRequestOptionsVersionCurrent];
//        [requestOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeOpportunistic];
//        [requestOptions setResizeMode:PHImageRequestOptionsResizeModeNone];
        
        __weak ImageCell *weakSelf = self;
        [imageManager requestImageForAsset:asset
                                targetSize:PHImageManagerMaximumSize
                               contentMode:PHImageContentModeDefault
                                   options:nil
                             resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            if (result) {
                NSLog(@"info: %@", info);
                [weakSelf.imageView setImage:result];
            }
        }];
    }
}

@end
