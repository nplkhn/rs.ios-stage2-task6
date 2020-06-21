//
//  Screen1ViewController.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/18/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "StartScreenViewController.h"
#import "CustomNavigationViewController.h"
#import "CustomTabBarController.h"
#import "UIColor+ColorWithRGBValue.h"


@interface StartScreenViewController ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIStackView *figureView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) CustomTabBarController *tabBarController;

@end

@implementation StartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupAnimations];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark - setup views
- (void)setupViews {
    self.view.backgroundColor = UIColor.whiteColor;
    
    // MARK: top label
    self.topLabel = [UILabel new];
    self.topLabel.text = @"Are you ready?";
    self.topLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    [self.view addSubview:self.topLabel];
    
    self.topLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
        [self.topLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-150.0],
        [self.topLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    ]];
    
    // MARK: figure views
    UIView *circleView = [[UIView alloc] init];
    UIView *squareView = [[UIView alloc] init];
    UIView *triangleView = [[UIView alloc] init];

    circleView.layer.cornerRadius = 35.0;
    
    circleView.layer.backgroundColor = [UIColor colorFromRGBNumber: @0xEE686A].CGColor;
    squareView.layer.backgroundColor = [UIColor colorFromRGBNumber: @0x29C2D1].CGColor;
    triangleView.layer.backgroundColor = [UIColor colorFromRGBNumber: @0x34C1A1].CGColor;
    
    self.figureView = [UIStackView new];
    [self.figureView addArrangedSubview:circleView];
    [self.figureView addArrangedSubview:squareView];
    [self.figureView addArrangedSubview:triangleView];
    [self.figureView setDistribution:UIStackViewDistributionEqualCentering];
    

    
    [self.view addSubview:self.figureView];

    self.figureView.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints: @[
        [self.figureView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.figureView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50.0],
        [self.figureView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50.0],

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
    
    // MARK: start button
    self.startButton = [UIButton new];
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor colorFromRGBNumber:@0x101010] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.startButton.layer.cornerRadius = 27.5;
    self.startButton.backgroundColor = [UIColor colorFromRGBNumber: @0xF9CC78];
    
    [self.view addSubview:self.startButton];
    
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.startButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-150],
        [self.startButton.heightAnchor constraintEqualToConstant:55.0],
        [self.startButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-100]
    ]];
    
    [self.startButton addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    self.tabBarController = [CustomTabBarController new];
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

#pragma mark - button tap handler
- (void) buttonTapped {
    [self.navigationController pushViewController:self.tabBarController animated:YES];
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
