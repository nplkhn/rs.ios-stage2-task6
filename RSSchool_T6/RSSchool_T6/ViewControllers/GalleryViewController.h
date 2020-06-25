//
//  GalleryViewController.h
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/20/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalleryViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
