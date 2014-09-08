//
//  BELLViewController.m
//  TodoTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-08.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import "BELLViewController.h"
#import "TodoModel.h"
#import "BELLDetailViewController.h"

@interface BELLViewController ()

@end

@implementation BELLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"My Todo App";
    self.todos = [NSMutableArray array];

    [self createHeader];
    [self createAddButton];
    [self createTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI Creation methods
- (void) createHeader{
    //Frame
    CGRect headerFrame = CGRectZero;
    headerFrame.origin.x = 15;
    headerFrame.origin.y = 100;
    headerFrame.size.width = self.view.frame.size.width - (2 * headerFrame.origin.x);
    headerFrame.size.height = 30;
    //Label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:headerFrame];
    headerLabel = [[UILabel alloc] initWithFrame:headerFrame];
    headerLabel.text = @"Todo App";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont systemFontOfSize:18.0];
    headerLabel.textColor = [UIColor redColor];
    //Border
    headerLabel.layer.borderColor = [UIColor redColor].CGColor;
    headerLabel.layer.borderWidth = 2.0;

    self.headerLabel = headerLabel;
    [self.view addSubview:headerLabel];
}

- (void) createAddButton{
    //Frame
    CGRect buttonFrame = CGRectZero;
    buttonFrame.origin.x = 50;
    buttonFrame.origin.y = 150;
    buttonFrame.size.width = self.view.frame.size.width / 2;
    buttonFrame.size.height = 30;
    //Button
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.frame = buttonFrame;
    [self.addButton setTitle:@"Add Todo" forState:UIControlStateNormal];
    [self.addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    //Listener
    [self.addButton addTarget:self action:@selector(didTapAddButton) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview: self.addButton];
}

- (void) createTable{
    //Frame
    CGRect tableFrame = CGRectZero;
    tableFrame.origin.x = 0;
    tableFrame.origin.y = self.addButton.frame.size.height + self.addButton.frame.origin.y;
    tableFrame.size.width = self.view.frame.size.width;
    tableFrame.size.height = self.view.frame.size.height - self.addButton.frame.size.height - self.headerLabel.frame.size.height;
    //TableView
    self.tableView = [[UITableView alloc] initWithFrame:tableFrame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
}

#pragma mark Actions

-(void )didTapAddButton{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter a Todo" message:nil delegate:self cancelButtonTitle:@"Add" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

#pragma mark UITable Delegate methods

/**
 * Delegate method of UITableViewDelegate that allows us to define a cell for a Row
**/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Initialize empty cell
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    //
    int rowNumber = indexPath.row;
    TodoModel *model = self.todos[rowNumber];
    cell.textLabel.text = model.name;
    return cell;
}

/**
 * Delegate method of UITableViewDelegate that tells us how many rows there are in the TableView
 **/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.todos.count;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int rowNumber = indexPath.row;
    TodoModel *model = self.todos[rowNumber];
    UIStoryboard *storyboard;
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    } else {
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    }

    BELLDetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"detailView"];

    detailViewController.todo = model;


    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

#pragma mark UIAlert Delegate methods

/**
 * Delegate method of UIAlert called when the button is pressed.
 **/
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *name = [alertView textFieldAtIndex:0].text;
    if (name.length >  0){
        TodoModel *model = [[TodoModel alloc] initWithName:name];
        [self.todos addObject:model];
        [self.tableView reloadData];
    }
}

@end
