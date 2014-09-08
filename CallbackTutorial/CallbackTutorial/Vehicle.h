//
//  Vehicle.h
//  CallbackTutorial
//
//  Created by Pier-Jean Lacharité on 2014-09-05.
//  Copyright (c) 2014 BELL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VehicleProtocol <NSObject>

@required
- (void) didAccelerate;
@end

@interface Vehicle : NSObject

@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *maker;
@property (nonatomic, assign) id<VehicleProtocol> delegate;

- (id)initVehicleWithModel: (NSString *) model andMaker:(NSString *) maker;
- (void) accelerate;
- (void) brake:(void (^)())didBrake;
- (void) horn;
@end