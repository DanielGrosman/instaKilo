//
//  CollectionViewController.m
//  instaKilo
//
//  Created by Daniel Grosman on 2017-11-15.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "ImagesCollectionHeaderView.h"
#import "Section.h"
#import "State.h"
#import "GridLayout.h"

@interface CollectionViewController () <UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray *arrayOfStates;
@property (strong, nonatomic) State *selectedState;
@property (nonatomic, assign) int stateIndex;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GridLayout *layout = [[GridLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);

    
    Section *landAnimalsSection = [[Section alloc] initWithHeaderTitle:@"Land Animals"
                                                                 array:
                                   @[[UIImage imageNamed:@"cat-one"],
                                     [UIImage imageNamed:@"cat-two"],
                                     [UIImage imageNamed:@"cat-three"],
                                     [UIImage imageNamed:@"dog-one"],
                                     [UIImage imageNamed:@"dog-two"],
                                     [UIImage imageNamed:@"horse-one"],
                                     [UIImage imageNamed:@"horse-two"]
                                     ]];
    Section *waterAnimalsSection = [[Section alloc] initWithHeaderTitle:@"Water Animals"
                                                                  array:
                                    @[[UIImage imageNamed:@"turtle-one"],
                                      [UIImage imageNamed:@"otter-one"],
                                      [UIImage imageNamed:@"otter-two"]
                                      ]];
    Section *locationOneSection = [[Section alloc] initWithHeaderTitle:@"Location One"
                                                                 array:
                                   @[[UIImage imageNamed:@"turtle-one"],
                                     [UIImage imageNamed:@"horse-one"],
                                     [UIImage imageNamed:@"otter-two"],
                                     [UIImage imageNamed:@"cat-three"],
                                     [UIImage imageNamed:@"dog-two"]
                                     ]];
    Section *locationTwoSection = [[Section alloc] initWithHeaderTitle:@"Location Two"
                                                                 array:
                                   @[[UIImage imageNamed:@"horse-two"],
                                     [UIImage imageNamed:@"cat-one"],
                                     [UIImage imageNamed:@"otter-one"],
                                     [UIImage imageNamed:@"cat-two"],
                                     [UIImage imageNamed:@"dog-one"]
                                     ]];
    
    State *categoryState = [[State alloc] initWithArrayOfSections:@[landAnimalsSection,waterAnimalsSection]];
    State *locationState = [[State alloc] initWithArrayOfSections:@[locationOneSection,locationTwoSection]];
    
    self.arrayOfStates = @[categoryState,locationState];
    self.stateIndex = 0;
    self.selectedState = self.arrayOfStates[self.stateIndex];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)buttonSelected:(UISegmentedControl *)sender {
    self.stateIndex ++;
    self.selectedState = self.arrayOfStates[self.stateIndex%2];
    
    [self.collectionView reloadData];
    }

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.selectedState.arrayOfSections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.selectedState.arrayOfSections[section].array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [self.selectedState.arrayOfSections[indexPath.section].array objectAtIndex:indexPath.item];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableHeaderView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        ImagesCollectionHeaderView *imagesHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        imagesHeaderView.headerLabel.text = self.selectedState.arrayOfSections[indexPath.section].headerTitle;

        reusableHeaderView = imagesHeaderView;
    }
    return reusableHeaderView;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
 return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 
 }
 */

@end
