//
//  Section.m
//  instaKilo
//
//  Created by Daniel Grosman on 2017-11-15.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "Section.h"

@implementation Section

- (instancetype) initWithHeaderTitle:(NSString *)headerTitle array:(NSArray *)array {
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _array = array;
    }
    return self;
}

@end
