//
//  main.m
//  CallbackTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-05.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Driver.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Vehicle *vehicle = [[Vehicle alloc] initVehicleWithModel:@"Neon" andMaker:@"Dodge"];
        Driver *driver = [[Driver alloc] initWithVehicle: vehicle];

        [driver pressAccelerationPedal];
        [driver pressBrakePedal];
        [driver pressHorn];
        
    }
    return 0;
}

