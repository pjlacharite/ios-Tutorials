//
//  TodoModel.m
//  TodoTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-08.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import "TodoModel.h"

@implementation TodoModel

- (id) initWithName:(NSString *)name{
    if (self = [super init]){
        self.name = name;
        self.creationDate = [[NSDate alloc] init];
    }
    return self;
}

@end
