//
//  State.m
//  instaKilo
//
//  Created by Daniel Grosman on 2017-11-15.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "State.h"

@implementation State

- (instancetype) initWithArrayOfSections:(NSArray<Section*> *)arrayOfSections {
    if (self = [super init]) {
        _arrayOfSections = arrayOfSections;
    }
    return self;
}

@end
