//
//  SlideViewController.m
//  SlideImageTask1
//
//  Created by admin on 6/4/15.
//  Copyright (c) 2015 HUNGCAO. All rights reserved.
//

#import "SlideViewController.h"
#import "EffectImageView.h"

@interface SlideViewController ()

@end

@implementation SlideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.4
    
    EffectImageView *effectImageView = [[EffectImageView alloc] initWithFrame:self.view.bounds leftImage:[UIImage imageNamed:@"A.jpg"] rightImage:[UIImage imageNamed:@"B.jpg"]];
    effectImageView.center = self.view.center;
    [self.view addSubview:effectImageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
