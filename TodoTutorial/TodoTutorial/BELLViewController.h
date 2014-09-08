//
//  BELLViewController.h
//  TodoTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-08.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BELLViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *todos;

@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *addButton;

- (void) createHeader;
- (void) createAddButton;
- (void) createTable;

@end
