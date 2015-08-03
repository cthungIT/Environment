//
//  EffectImageView.h
//  SlideImageTask1
//
//  Created by admin on 6/4/15.
//  Copyright (c) 2015 HUNGCAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderView.h"

@interface EffectImageView : UIView

@property (nonatomic, strong) SliderView *sliderView;
@property (nonatomic, assign) float positionSlider;

-(void) setSliderPosition:(float) position animation:(BOOL) animation;
-(id) initWithFrame:(CGRect)frame leftImage:(UIImage *) leftImage rightImage:(UIImage *) rightImage;
@end
