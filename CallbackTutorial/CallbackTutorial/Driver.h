//
//  Driver.h
//  CallbackTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-05.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vehicle.h"
@interface Driver : NSObject <VehicleProtocol>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Vehicle *vehicle;

- (void)pressAccelerationPedal;
- (void)pressBrakePedal;
- (void)pressHorn;
- (id) initWithVehicle: (Vehicle *) vehicle;
@end
