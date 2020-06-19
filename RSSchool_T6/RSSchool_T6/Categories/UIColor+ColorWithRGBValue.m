//
//  UIColor+ColorWithHexValue.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/19/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "UIColor+ColorWithRGBValue.h"

@implementation UIColor (ColorWithRGBValue)

+ (UIColor *)colorFromRGBNumber:(NSNumber *)color {
    return [UIColor colorWithRed:((float)((color.intValue & 0xFF0000) >> 16))/255.0
                           green:((float)((color.intValue & 0x00FF00) >>  8))/255.0
                            blue:((float)((color.intValue & 0x0000FF) >>  0))/255.0
                           alpha:1.0];
}

@end
