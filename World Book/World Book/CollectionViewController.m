//
//  CollectionViewController.m
//  World Book
//
//  Created by Nilesh Mahale on 9/29/15.
//  Copyright © 2015 Code-Programming. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController {
    
    NSDictionary *flagImages;
    NSDictionary *countryNames;
    NSArray *countrySectionTitles;
    
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    flagImages = @{@"A" : @[@"Australia", @"az"],
                   @"B" : @[@"ba", @"bb", @"bd", @"be", @"bf", @"bg", @"bh", @"bi", @"bj", @"bn", @"bo", @"br", @"bs", @"bt", @"bw", @"by", @"bz"],
                   @"C" : @[@"ca", @"cd", @"cf"]};
    
    
    countryNames = @{@"A" : @[@"Australia", @"az"],
                   @"B" : @[@"ba", @"bb", @"bd", @"be", @"bf", @"bg", @"bh", @"bi", @"bj", @"bn", @"bo", @"br", @"bs", @"bt", @"bw", @"by", @"bz"],
                   @"C" : @[@"ca", @"cd", @"cf"]};
    
    countrySectionTitles = [[flagImages allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    // let's add some section spacing
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [countrySectionTitles count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSString *sectionTitle = [countrySectionTitles objectAtIndex:section];
    NSArray *sectionCountries = [countryNames objectForKey:sectionTitle];
    return [sectionCountries count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *sectionTitle = [countrySectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionCountries = [countryNames objectForKey:sectionTitle];
    NSString *country = [sectionCountries objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:country];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame"]];
    cell.countryLabel.text = country;
    
    return cell;
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

#pragma mark section header

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *resuableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CustomCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [countrySectionTitles objectAtIndex:indexPath.section];
        headerView.sectionTitleLabel.text = title;
        
        resuableView = headerView;
    }
    
    return resuableView;
}

@end


















