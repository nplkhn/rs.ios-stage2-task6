//
//  GalleryViewController.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/20/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "GalleryViewController.h"
#import "ImageCell.h"
#import "iconNames.h"
@import Photos;

@interface GalleryViewController ()

@property (nonatomic, strong) PHFetchResult *fetchResult;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view.
    
    
    self.fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeUnknown
                                                 options:0];
    NSLog(@"%@", self.fetchResult);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}


- (void)setupViews {
    self.view.backgroundColor = UIColor.whiteColor;
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"collectionViewCellId"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - collection view delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCellId" forIndexPath:indexPath];
    
    PHAsset *asset = self.fetchResult[indexPath.item];
    [cell setAsset:asset];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.fetchResult.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return floor(self.fetchResult.count/3.0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(80.0, 80.0);
}

@end
