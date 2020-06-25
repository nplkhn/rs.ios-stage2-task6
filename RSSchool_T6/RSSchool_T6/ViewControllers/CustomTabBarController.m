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
    self.navigationItem.title = @"Info";
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorFromRGBNumber:@0xF9CC78];
}

#pragma mark - setup views
- (void)setupViews {
    self.view.backgroundColor = [UIColor colorFromRGBNumber:@0xFFFFFF];
    self.delegate = self;
    
    //MARK: info VC
    InfoViewController *infoVC = [InfoViewController new];
    [self setViewController:infoVC
         tabBarSelectedIcon:kInfoSelectedIconName
    andTabBarUnselectedIcon:kInfoUnselectedIconName];
    self.infoViewController = infoVC;
    
    //MARK: gallery VC
    GalleryViewController *galleryVC = [GalleryViewController new];
    [self setViewController:galleryVC
         tabBarSelectedIcon:kGallerySelectedIconName
    andTabBarUnselectedIcon:kGaleryUnselectedIconName];
    self.galleryViewController = galleryVC;
    
    //MARK: home VC
    HomeViewController *homeVC = [HomeViewController new];
    [self setViewController:homeVC
         tabBarSelectedIcon:kHomeSelectedIconName
    andTabBarUnselectedIcon:kHomeUnselectedIconName];
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

#pragma mark - helpers

- (void)setViewController:(UIViewController *)viewController tabBarSelectedIcon:(NSString *)selectedIconName andTabBarUnselectedIcon:(NSString *)unselectedIconName {
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:unselectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, -5, -5, -5);
}

@end
