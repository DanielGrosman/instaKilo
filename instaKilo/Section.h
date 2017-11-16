//
//  Section.h
//  instaKilo
//
//  Created by Daniel Grosman on 2017-11-15.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSArray *array;

- (instancetype) initWithHeaderTitle:(NSString *)headerTitle array:(NSArray *)array;

@end
