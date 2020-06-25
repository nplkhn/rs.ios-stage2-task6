//
//  HomeViewController.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/20/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+ColorWithRGBValue.h"
#import "iconNames.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIStackView *figureView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupAnimations];
    NSLog(@"home view controller viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupAnimations];
}

- (void)setupViews {
    self.stackView = [UIStackView new];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.spacing = 100.0;
    
    [self.view addSubview:self.stackView];
    
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
    
    UIDevice *device = [UIDevice currentDevice];
    UIStackView *topContainer = [UIStackView new];
    topContainer.axis = UILayoutConstraintAxisHorizontal;
    topContainer.spacing = 50.0;
    topContainer.alignment = UIStackViewAlignmentCenter;
    UIImageView *appleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kAppleIconName]];
    appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [appleImageView.widthAnchor constraintEqualToConstant:85.0],
        [appleImageView.heightAnchor constraintEqualToConstant:100.0],
    ]];
    
    [topContainer addArrangedSubview:appleImageView];
    UIStackView *labelContainer = [UIStackView new];
    labelContainer.axis = UILayoutConstraintAxisVertical;
    labelContainer.spacing = 10.0;
    UILabel *deviceNameLabel = [UILabel new];
    deviceNameLabel.text = device.name;
    [labelContainer addArrangedSubview:deviceNameLabel];
    UILabel *deviceModelLabel = [UILabel new];
    deviceModelLabel.text = device.model;
    [labelContainer addArrangedSubview:deviceModelLabel];
    UILabel *deviceIOSVersion = [UILabel new];
    deviceIOSVersion.text = [NSString stringWithFormat:@"%@ %@", device.systemName, device.systemVersion];
    [labelContainer addArrangedSubview:deviceIOSVersion];
    
    [topContainer addArrangedSubview:labelContainer];
    
    [self.stackView addArrangedSubview:topContainer];
    
    
    // MARK: figure views
    UIView *circleView = [[UIView alloc] init];
    UIView *squareView = [[UIView alloc] init];
    UIView *triangleView = [[UIView alloc] init];

    circleView.layer.cornerRadius = 35.0;
    
    circleView.layer.backgroundColor = [UIColor colorFromRGBNumber: @0xEE686A].CGColor;
    squareView.layer.backgroundColor = [UIColor colorFromRGBNumber: @0x29C2D1].CGColor;
    triangleView.layer.backgroundColor = [UIColor colorFromRGBNumber: @0x34C1A1].CGColor;
    
    UIStackView *figureView = [UIStackView new];
    [figureView addArrangedSubview:circleView];
    [figureView addArrangedSubview:squareView];
    [figureView addArrangedSubview:triangleView];
    figureView.alignment = UIStackViewAlignmentCenter;
    figureView.axis = UILayoutConstraintAxisHorizontal;
    figureView.spacing = 30.0;
    
    figureView.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints: @[
        [circleView.heightAnchor constraintEqualToConstant:70.0],
        [circleView.widthAnchor constraintEqualToConstant:70.0],
        [squareView.heightAnchor constraintEqualToConstant:70.0],
        [squareView.widthAnchor constraintEqualToConstant:70.0],
        [triangleView.heightAnchor constraintEqualToConstant:70.0],
        [triangleView.widthAnchor constraintEqualToConstant:70.0]
    ]];
    
    UIBezierPath* trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:(CGPoint){35,0}];
    [trianglePath addLineToPoint:(CGPoint){70,70}];
    [trianglePath addLineToPoint:(CGPoint){0,70}];
    [trianglePath closePath];
    
    CAShapeLayer *triangleMaskLayer = [CAShapeLayer layer];
    [triangleMaskLayer setPath:trianglePath.CGPath];
    
    triangleView.layer.mask = triangleMaskLayer;
    
    [self.stackView addArrangedSubview:figureView];
    self.figureView = figureView;
    
    UIStackView *buttonStackView = [UIStackView new];
    buttonStackView.axis = UILayoutConstraintAxisVertical;
    buttonStackView.alignment = UIStackViewAlignmentCenter;
    buttonStackView.spacing = 20.0;
    
    UIButton *cvButton = [UIButton new];
    [cvButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    [cvButton setTitleColor:[UIColor colorFromRGBNumber:@0x101010] forState:UIControlStateNormal];
    cvButton.backgroundColor = [UIColor colorFromRGBNumber: @0xF9CC78];
    cvButton.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium];
    cvButton.layer.cornerRadius = 27.5;
    cvButton.translatesAutoresizingMaskIntoConstraints = NO;
    [cvButton addTarget:self action:@selector(cvTap) forControlEvents:UIControlEventTouchUpInside];

    [buttonStackView addArrangedSubview:cvButton];
    
    UIButton *goToStartButton = [UIButton new];
    [goToStartButton setTitle:@"Go to start!" forState:UIControlStateNormal];
    [goToStartButton setTitleColor:[UIColor colorFromRGBNumber:@0x101010] forState:UIControlStateNormal];
    goToStartButton.backgroundColor = [UIColor colorFromRGBNumber: @0xEE686A];
    goToStartButton.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium];
    goToStartButton.layer.cornerRadius = 27.5;
    goToStartButton.translatesAutoresizingMaskIntoConstraints = NO;
    [goToStartButton addTarget:self action:@selector(goToStartTap) forControlEvents:UIControlEventTouchUpInside];

    [buttonStackView addArrangedSubview:goToStartButton];
    
    [self.stackView addArrangedSubview:buttonStackView];

    [NSLayoutConstraint activateConstraints: @[
        [cvButton.heightAnchor constraintEqualToConstant:55.0],
        [cvButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-100.0],
        [goToStartButton.heightAnchor constraintEqualToConstant:55.0],
        [goToStartButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-100.0]
    ]];
}

#pragma mark - button handlers

- (void) goToStartTap {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)cvTap {
    NSURL *url = [NSURL URLWithString:@"https://nplkhn.github.io/rsschool-cv/cv"];
    [UIApplication.sharedApplication openURL:url options:@{} completionHandler:^(BOOL success) {
        NSLog(@"%d", success);
    }];
//    [UIApplication.sharedApplication openURL:url options:@{} completionHandler:];
}

#pragma mark - setup animations
- (void)circleViewAnimation {
    [UIView animateKeyframesWithDuration:1
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionRepeat
                              animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
            [self.figureView.arrangedSubviews[0] setTransform:CGAffineTransformScale(self.figureView.arrangedSubviews[0].transform, (CGFloat)77/70, (CGFloat)77/70)];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.5 animations:^{
            [self.figureView.arrangedSubviews[0] setTransform:CGAffineTransformScale(self.figureView.arrangedSubviews[0].transform, (CGFloat)63/77, (CGFloat)63/77)];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            [self.figureView.arrangedSubviews[0] setTransform:CGAffineTransformScale(self.figureView.arrangedSubviews[0].transform, (CGFloat)70/63, (CGFloat)70/63)];
        }];
    }
                              completion:nil];
}

- (void)squareViewAnimation {
    [UIView animateKeyframesWithDuration:1
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionRepeat
                              animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
            [self.figureView.arrangedSubviews[1] setTransform:CGAffineTransformTranslate(self.figureView.arrangedSubviews[1].transform, 0, 7)];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.5 animations:^{
            [self.figureView.arrangedSubviews[1] setTransform:CGAffineTransformTranslate(self.figureView.arrangedSubviews[1].transform, 0, -14)];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            [self.figureView.arrangedSubviews[1] setTransform:CGAffineTransformTranslate(self.figureView.arrangedSubviews[1].transform, 0, 7)];
        }];
    }
                              completion:nil];
}

- (void)triangleViewAnimation {
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.figureView.arrangedSubviews[2] setTransform:CGAffineTransformRotate(self.figureView.arrangedSubviews[2].transform, M_PI_2)];
    }completion:^(BOOL finished){
        if (finished) {
            [self triangleViewAnimation];
        }
    }];
}

- (void) setupAnimations {
    [self circleViewAnimation];
    [self squareViewAnimation];
    [self triangleViewAnimation];
}

@end
