//
//  Screen2ViewController.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/19/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "CustomTabBarController.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "HomeViewController.h"
#import "CustomNavigationViewController.h"
#import "UIColor+ColorWithRGBValue.h"
#import "iconNames.h"


@interface CustomTabBarController ()

@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, strong) InfoViewController *infoViewController;
@property (nonatomic, strong) GalleryViewController *galleryViewController;
@property (nonatomic, strong) HomeViewController *homeViewController;

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"Info";
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorFromRGBNumber:@0xF9CC78];
}

#pragma mark - setup views
- (void)setupViews {
    self.view.backgroundColor = [UIColor colorFromRGBNumber:@0xFFFFFF];

    [[CustomNavigationViewController alloc] initWithRootViewController:self];
    self.delegate = self;
    
    
    //MARK: info VC
    InfoViewController *infoVC = [InfoViewController new];
    infoVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:kInfoUnselectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    infoVC.tabBarItem.selectedImage = [[UIImage imageNamed:kInfoSelectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    infoVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, -5, -5, -5);
    self.infoViewController = infoVC;
    
    //MARK: gallery VC
    GalleryViewController *galleryVC = [GalleryViewController new];
    galleryVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:kGaleryUnselectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    galleryVC.tabBarItem.selectedImage = [[UIImage imageNamed:kGallerySelectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    galleryVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, -5, -5, -5);
    self.galleryViewController = galleryVC;
    
    //MARK: home VC
    HomeViewController *homeVC = [HomeViewController new];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                      image:[[UIImage imageNamed:kHomeUnselectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                        tag:0];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:kHomeSelectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, -5, -5, -5);
    self.homeViewController = homeVC;
    
    
    self.viewControllers = @[infoVC, galleryVC, homeVC];
}


#pragma mark - delegates

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[InfoViewController class]]) {
        self.navigationItem.title = @"Info";
    }
    if ([viewController isKindOfClass:[GalleryViewController class]]) {
        self.navigationItem.title = @"Gallery";
    }
    if ([viewController isKindOfClass:[HomeViewController class]]) {
        self.navigationItem.title = @"RSSchool Task 6";
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
