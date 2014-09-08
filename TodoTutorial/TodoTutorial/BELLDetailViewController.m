//
//  BELLDetailViewController.m
//  TodoTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-08.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import "BELLDetailViewController.h"

@interface BELLDetailViewController ()

@end

@implementation BELLDetailViewController

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
    self.title = self.todo.name;

    [self createLabel];
}

- (void)createLabel{
    //Frame
    CGRect headerFrame = CGRectZero;
    headerFrame.origin.x = 15;
    headerFrame.origin.y = 100;
    headerFrame.size.width = self.view.frame.size.width - (2 * headerFrame.origin.x);
    headerFrame.size.height = 30;
    //Label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:headerFrame];
    headerLabel = [[UILabel alloc] initWithFrame:headerFrame];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont systemFontOfSize:18.0];
    headerLabel.textColor = [UIColor blueColor];
    //Text
    NSString *dateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterMediumStyle];
    headerLabel.text = dateString;

    [self.view addSubview:headerLabel];
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
