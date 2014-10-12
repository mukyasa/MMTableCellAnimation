//
//  MMViewController.m
//  MMTableCellAnimation
//
//  Created by muku on 12/10/14.
//  Copyright (c) 2014 com.muku. All rights reserved.
//

#import "MMViewController.h"
#import "MMCell.h"

@interface MMViewController (){
    NSArray *array;
}

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *backgrnd=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    backgrnd.contentMode=UIViewContentModeScaleAspectFit;
    
    backgrnd.image=[UIImage imageNamed:@"five.jpg"];
    [self.view addSubview:backgrnd];
    [self.view bringSubviewToFront:self.tableView];
    
    
    for (int i=0; i <100; i++) {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    MMCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[MMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.mmlabel.text=@"Iron Man";
    cell.mmlabel.textColor=[UIColor whiteColor];
   
    cell.mmimageView.layer.cornerRadius = cell.mmimageView.frame.size.width/2;
    cell.mmimageView.clipsToBounds = YES;

    cell.mmimageView.image=[UIImage imageNamed:@"one.jpg"];
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //1. Setup the CATransform3D structure
    CATransform3D translation;
    // rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    translation = CATransform3DMakeTranslation(0, 480, 0);
    //rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = translation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //!!!FIX for issue #1 Cell position wrong------------
    if(cell.layer.position.x != 0){
        cell.layer.position = CGPointMake(0, cell.layer.position.y);
    }
    
    //4. Define the final state (After the animation) and commit the animation
    
    [UIView beginAnimations:@"translation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    [UIView commitAnimations];
}

@end
