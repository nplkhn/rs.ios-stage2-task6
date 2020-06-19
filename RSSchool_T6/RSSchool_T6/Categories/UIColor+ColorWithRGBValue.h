//
//  UIColor+ColorWithHexValue.h
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/19/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorWithRGBValue)

+ (UIColor*)colorFromRGBNumber: (NSNumber *)color;

@end

NS_ASSUME_NONNULL_END
