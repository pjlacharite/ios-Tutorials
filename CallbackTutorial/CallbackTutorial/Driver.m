//
//  Driver.m
//  CallbackTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-05.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import "Driver.h"

#define kEventDidHorn @"didHorn"

@implementation Driver

- (id) initWithVehicle: (Vehicle *) vehicle{
    if(self = [super init]) {
        self.vehicle = vehicle;
        self.vehicle.delegate = self;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didHorn)
                                                     name:kEventDidHorn
                                                   object: nil];
    }
    return self;
}

#pragma mark Instance methods

- (void)pressAccelerationPedal{
    [self.vehicle accelerate];
}

- (void)pressBrakePedal{
    [self.vehicle brake:^{
        [self didBrake];
    }];
}

- (void)pressHorn{
    [self.vehicle horn];
}


#pragma mark Callbacks methods
- (void) didAccelerate{
    NSLog(@"Delegate didAccelerate");
}

- (void) didHorn{
    NSLog(@"Notification didHorn");
}

- (void) didBrake{
    NSLog(@"Block didBrake");
}

@end
