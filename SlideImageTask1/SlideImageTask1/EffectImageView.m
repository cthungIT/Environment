//
//  EffectImageView.m
//  SlideImageTask1
//
//  Created by admin on 6/4/15.
//  Copyright (c) 2015 HUNGCAO. All rights reserved.
//

#import "EffectImageView.h"
#import "Constants.h"

@interface EffectImageView (){
    BOOL isTouch;
}

@property (nonatomic, strong) UIImageView *leftImage;
@property (nonatomic, strong) UIImageView *rightImage;

@end

@implementation EffectImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage rightImage:(UIImage *)rightImage{
    self = [super initWithFrame:CGRectMake(0, 0, leftImage.size.width, leftImage.size.height)];
    if (self) {
        _leftImage = [[UIImageView alloc] initWithFrame:self.bounds];
        [_leftImage setImage:leftImage];
        [_leftImage setContentMode:UIViewContentModeLeft];
        [_leftImage setClipsToBounds:YES];
        [self addSubview:_leftImage];
        
        _rightImage = [[UIImageView alloc] initWithFrame:self.bounds];
        [_rightImage setImage:rightImage];
        [_rightImage setContentMode:UIViewContentModeRight];
        [_rightImage setClipsToBounds:YES];
        [self addSubview:_rightImage];
        
        UIImage *slideImage = [UIImage imageNamed:@"slideBar"];
        _sliderView = [[SliderView alloc] initWithFrame:CGRectMake(0, 0, slideImage.size.width, self.frame.size.height)];
        [_sliderView setImage:slideImage];
        _sliderView.center = self.center;
        [_sliderView setContentMode:UIViewContentModeCenter];
        [self addSubview:_sliderView];
        
        self.positionSlider = leftImage.size.width/2;
    }
    return self;
}

-(void)setSliderView:(SliderView *)sliderView{
    [_sliderView removeFromSuperview];
    _sliderView = sliderView;
    _sliderView.center = self.center;
    
    [self addSubview:_sliderView];
}
-(void)setSliderPosition:(float)position animation:(BOOL)animation{
    if (animation) {
        [UIView animateWithDuration:DEFAULT_TIME_DURATION_SLIDER delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            _positionSlider = position;
        } completion:nil];
    }else{
        _positionSlider = position;
    }
}

//overide function
-(void)setPositionSlider:(float)positionSlider{
    if ((positionSlider < self.frame.size.width)&&(positionSlider > self.bounds.origin.x)) {
        _positionSlider = positionSlider;
        
        if (_sliderView) {
            _sliderView.center = CGPointMake(positionSlider, _sliderView.center.y);
        }
        
        CGRect rectImageLeft = _leftImage.frame;
        rectImageLeft.size.width = positionSlider;
        _leftImage.frame = rectImageLeft;
        
        CGRect rectImageRight = _rightImage.frame;
        rectImageRight.origin.x = positionSlider;
        rectImageRight.size.width = self.frame.size.width - positionSlider;
        _rightImage.frame = rectImageRight;
        
    }
}


//Start gesture
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentTouch = [touch locationInView:_sliderView];
    if (CGRectContainsPoint(_sliderView.bounds, currentTouch)) {
        isTouch = YES;
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (isTouch) {
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self];
        if (currentPoint.x >= _sliderView.bounds.size.width/2 && currentPoint.x <= self.bounds.size.width - self.sliderView.bounds.size.width/2) {
            self.positionSlider = currentPoint.x;
        }
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!isTouch) {
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self];
        [self setSliderPosition:currentPoint.x animation:YES];
    }
}
@end
