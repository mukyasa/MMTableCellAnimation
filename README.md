MMTableCellAnimation
====================

This project is about table cell translation animation 

![Demo MMTableCellAnimation](http://i.imgur.com/mlnGzSa.gif)


Contact Me
==========
Mukesh Mandora

Contact: mandoramuku07@gmail.com

Twitter: http://twitter.com/mukyasa1310

LinkedIn: https://in.linkedin.com/in/mukeshmandora


**Add This Code**

```objective-c
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//1. Setup the CATransform structure
CATransform3D translation;

translation = CATransform3DMakeTranslation(0, 480, 0);

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
```
