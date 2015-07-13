    UIViewController *test1Vc = [[UIViewController alloc] init];
    test1Vc.title = @"test1";
    test1Vc.view.backgroundColor = [UIColor redColor];
    UIViewController *test2Vc = [[UIViewController alloc] init];
    test2Vc.title = @"test2";
    test2Vc.view.backgroundColor = [UIColor yellowColor];
    UIViewController *test3Vc = [[UIViewController alloc] init];
    test3Vc.title = @"test3";
    test3Vc.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *test4Vc = [[UIViewController alloc] init];
    test4Vc.title = @"test4";
    test4Vc.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:test1Vc];
    [array addObject:test2Vc];
    [array addObject:test3Vc];
    [array addObject:test4Vc];

    //add subViewController
    self.segmentView.subViewControllers = array;
    
    
//  self.headView.hiddenBottom = YES;
    self.headView.selectedTitleColor = [UIColor redColor];
    self.headView.bottomColor = [UIColor redColor];
    
    self.segmentView.headView = self.headView;
