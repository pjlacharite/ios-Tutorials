//
//  TodoModel.h
//  TodoTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-08.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *creationDate;

- (id) initWithName: (NSString *) name;

@end
