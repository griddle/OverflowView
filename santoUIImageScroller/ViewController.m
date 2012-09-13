//
//  ViewController.m
//  santoUIImageScroller
//
//  Created by Garret Riddle on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "OverflowView.h"

@interface ViewController (){
    OverflowView *oview;
    NSArray *_imgArray;
    int nextImageToPush;
}
- (void)tick;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    oview = [[OverflowView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [self.view addSubview:oview];
    
    _imgArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"], [UIImage imageNamed:@"4"], [UIImage imageNamed:@"5"], [UIImage imageNamed:@"6"], [UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], nil];
    nextImageToPush = 0;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
}

- (void)tick {
    if (!nextImageToPush) nextImageToPush = 0;
    
    if (nextImageToPush < [_imgArray count]){
        [oview addImage:[_imgArray objectAtIndex:nextImageToPush]];
        ++nextImageToPush;
    }
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
