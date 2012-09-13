//
//  OverflowingUIImageContainer.m
//  santoUIImageScroller
//
//  Created by Garret Riddle on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OverflowView.h"


@interface OverflowView(){
    UIView *_slideLayer;
    UIImageView *_rightMostImageView;
}

@end



@implementation OverflowView



- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        // sliding layer
        _slideLayer = [[UIView alloc] init];
        _slideLayer.clipsToBounds = NO;
        [self addSubview:_slideLayer];
    }
    return self;
}

- (void)addImage:(UIImage *)img {
    // calculate img view size after scaling
    int newHeight = self.bounds.size.height;
    int newWidth = img.size.width * (newHeight / img.size.height);
    
    // add to slider
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = CGRectMake(0, 0, newWidth, newHeight);
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [_slideLayer addSubview:imgView];
    
    // add to the right of last image
    if (_rightMostImageView){
        CGRect newImgViewFrame = imgView.frame;
        newImgViewFrame.origin.x = _rightMostImageView.frame.origin.x + _rightMostImageView.frame.size.width;
        imgView.frame = newImgViewFrame;
    }
    _rightMostImageView = imgView;
    
    
    // slide slider if needed
    int offsetToRight = self.bounds.size.width - (imgView.frame.origin.x + imgView.frame.size.width);
    if (offsetToRight < 0){
        CGRect newSliderFrame = _slideLayer.frame;
        newSliderFrame.origin.x = offsetToRight;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        _slideLayer.frame = newSliderFrame;
        [UIView commitAnimations];
    }
}



@end
