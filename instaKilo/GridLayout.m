//
//  GridLayout.m
//  instaKilo
//
//  Created by Daniel Grosman on 2017-11-15.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "GridLayout.h"
#import "FloralView.h"


@implementation GridLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registerClass:[FloralView class] forDecorationViewOfKind:@"decoration"];
    }
    return self;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes =  [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSMutableArray *decorationAttributes = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        UICollectionViewLayoutAttributes *decorLayoutAttributes = [self layoutAttributesForDecorationViewOfKind:@"decoration" atIndexPath:attribute.indexPath];
        if (decorLayoutAttributes){
            decorLayoutAttributes.frame = attribute.frame;
            decorLayoutAttributes.zIndex = attribute.zIndex-1;
            [decorationAttributes addObject:decorLayoutAttributes];
        }
        
    }
    [attributes addObjectsFromArray:decorationAttributes];
    
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if ([elementKind isEqualToString:@"decoration"]) {
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
        return attributes;
    }
    return nil;
}

@end
