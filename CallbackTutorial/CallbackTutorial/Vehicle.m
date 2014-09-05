//
//  Vehicle.m
//  CallbackTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-05.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import "Vehicle.h"

#define kEventDidHorn @"didHorn"
@implementation Vehicle

- (id)initVehicleWithModel: (NSString *) model andMaker:(NSString *) maker{
    if (self = [super init]){
        self.model = model;
        self.maker = maker;
    }

    return self;
}

- (void) accelerate{
    if ([self.delegate respondsToSelector:@selector(didAccelerate)]){
        [self.delegate didAccelerate];
    }
}

- (void) brake:(void (^)())didBrake{
    didBrake();
}

- (void) horn{
    [[NSNotificationCenter defaultCenter] postNotificationName:kEventDidHorn                                                object:self];
}

@end
