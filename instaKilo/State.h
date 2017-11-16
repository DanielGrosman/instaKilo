//
//  State.h
//  instaKilo
//
//  Created by Daniel Grosman on 2017-11-15.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Section.h"

@interface State : NSObject

@property (nonatomic, strong) NSArray<Section*>*arrayOfSections;

- (instancetype) initWithArrayOfSections:(NSArray<Section*> *)arrayOfSections;

@end
