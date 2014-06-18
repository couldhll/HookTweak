%hook SBAwayController
- (void)activate  {
    %orig(); //invoke the orignal method to do what should to do.
    NSLog(@"=========================================================");
    NSLog(@"Hello MobileSubstrate!!");
    NSLog(@"=========================================================");
    
    //get _awayView via MSHookIvar method
    UIView *_awayView = MSHookIvar<UIView *>(self, "_awayView");
    
    //create a lable whose width = 200 and height = 100 and add to _awayView
    float w = 200;
    float h = 100;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((_awayView.frame.size.width - w)/2,100,w,h)];
    label.text = @"Hello, MobileSubstate!!";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    [_awayView addSubview:label];
}
%end