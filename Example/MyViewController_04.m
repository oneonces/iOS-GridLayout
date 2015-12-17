//
//  MyViewController_04.m
//  UITabBarController_Test01
//
//  Created by lianghua on 15/12/11.
//  Copyright © 2015年 launch. All rights reserved.
//

#import "MyViewController_04.h"
#import "MyViewController_03.h"

@interface MyViewController_04 ()

@end

@implementation MyViewController_04

@synthesize gridLayout;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 屏幕方向
//    if (![UIDevice currentDevice].generatesDeviceOrientationNotifications) {
//        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    }
//    NSLog(@"%d",[UIDevice currentDevice].orientation);
//    
//    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    
    
//    NSLog(@"%d",[UIApplication sharedApplication].statusBarOrientation);
//    NSLog(@"%d",self.interfaceOrientation);
    
    CGRect rectSreen = [UIScreen mainScreen].bounds;
    CGRect rectStatusbar = [[UIApplication sharedApplication] statusBarFrame];
    DXPadding padding = DXPaddingMake(5, 5, 5, 5);
    
#if TRUE// Specify the view's size
    DXGridCell *row0 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    //    DXGridCell *row1 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row1 = [[DXGridCell alloc] initWithDimension:100];// row fixed Height
    DXGridCell *row2 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row3 = [[DXGridCell alloc] initWithWeight:1.5];// row Height Weight: 1.5
    DXGridCell *row4 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row5 = [[DXGridCell alloc] initWithWeight:0.5];// row Height Weight: 0.5
    
    DXGridCell *col0 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col1 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col2 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col3 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    //    DXGridCell *col4 = [[DXGridCell alloc] initWithWeight:2];// column width Weight: 1
    DXGridCell *col4 = [[DXGridCell alloc] initWithDimension:200];// column fixed width 200
    
//    NSArray<DXGridCell *> *rowcells = [[NSArray alloc] initWithObjects:row0, row1, row2, row3, row4, row5, nil];
//    NSArray<DXGridCell *> *colcells = [[NSArray alloc] initWithObjects:col0, col1, col2, col3, col4, nil];
    
    gridLayout = [[DXGridLayout alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [gridLayout setPadding:padding];
//    [gridLayout setRowCells:rowcells];
//    [gridLayout setColumnCells:colcells];
    [gridLayout setRowCellsWithObject:row0, row1, row2, row3, row4, row5, nil];
    [gridLayout setColumnCellsWithObject:col0, col1, col2, col3, col4, nil];
    
    gridLayout.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
//    [gridLayout addLayoutItem:btn1 Row:0 Column:0];
    [gridLayout addLayoutItem:btn1 Width:40 Height:40 Row:0 Column:0];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.backgroundColor = [UIColor blueColor];
    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn2 Row:0 Column:1];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.backgroundColor = [UIColor cyanColor];
    [btn3 setTitle:@"btn3" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn3 Row:0 Column:2];
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.backgroundColor = [UIColor greenColor];
    [btn4 setTitle:@"btn4" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn4 Row:0 Column:3];
    
    UIButton *btn5 = [[UIButton alloc] init];
    btn5.backgroundColor = [UIColor brownColor];
    [btn5 setTitle:@"btn5" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn5 Row:0 Column:4];
    
    UIButton *btn6 = [[UIButton alloc] init];
    btn6.backgroundColor = [UIColor magentaColor];
    [btn6 setTitle:@"btn6" forState:UIControlStateNormal];
//    [gridLayout addLayoutItem:btn6 Width:40 Height:40 Row:1 Column:0];
    [gridLayout addLayoutItem:btn6 Width:40 Height:40 Row:1 Column:0 Alignment:DXAlignHorizontalRight];
    
    UIButton *btn7 = [[UIButton alloc] init];
    btn7.backgroundColor = [UIColor lightGrayColor];
    [btn7 setTitle:@"btn7" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn7 Width:40 Height:40 Row:1 Column:1 Alignment:DXAlignHorizontalLeft];
    
    UIButton *btn8 = [[UIButton alloc] init];
    btn8.backgroundColor = [UIColor grayColor];
    [btn8 setTitle:@"btn8" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn8 Width:40 Height:40 Row:1 Column:2 Alignment:DXAlignHorizontalRight];
    
    UIButton *btn9 = [[UIButton alloc] init];
    btn9.backgroundColor = [UIColor orangeColor];
    [btn9 setTitle:@"btn9" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn9 Width:40 Height:40 Row:1 Column:3 Alignment:DXAlignVerticalTop];
    
    UIButton *btn91 = [[UIButton alloc] init];
    btn91.backgroundColor = [UIColor orangeColor];
    [btn91 setTitle:@"91" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn91 Width:40 Height:40 Row:1 Column:4 Alignment:DXAlignVerticalBottom];
    
    UIButton *btn92 = [[UIButton alloc] init];
    btn92.backgroundColor = [UIColor orangeColor];
    [btn92 setTitle:@"92" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn92 Width:400 Height:600 Row:2 Column:0 Margin:DXMarginMake(5, 5, 5, 5) Alignment:DXAlignHorizontalLeft];
    
    UIButton *btn93 = [[UIButton alloc] init];
    btn93.backgroundColor = [UIColor orangeColor];
    [btn93 setTitle:@"93" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn93 Width:40 Height:40 Row:2 Column:1 Alignment:DXAlignCenter];
    
    UIButton *btn94 = [[UIButton alloc] init];
    btn94.backgroundColor = [UIColor orangeColor];
    [btn94 setTitle:@"94" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn94 Width:40 Height:40 Row:3 Column:4 Margin:DXMarginMake(2, 2, 2, 2) Alignment:DXAlignLeftTop];
    
    UIButton *btn95 = [[UIButton alloc] init];
    btn95.backgroundColor = [UIColor orangeColor];
    [btn95 setTitle:@"95" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn95 Width:40 Height:40 Row:2 Column:3 Margin:DXMarginMake(2, 2, 2, 2) Alignment:DXAlignRightTop];
    
    UIButton *btn96 = [[UIButton alloc] init];
    btn96.backgroundColor = [UIColor orangeColor];
    [btn96 setTitle:@"96" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn96 Width:40 Height:40 Row:2 Column:4 Alignment:DXAlignLeftBottom];
    
    UIButton *btn97 = [[UIButton alloc] init];
    btn97.backgroundColor = [UIColor orangeColor];
    [btn97 setTitle:@"97" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn97 Width:60 Height:60 Row:3 Column:0 Alignment:DXAlignRightBottom];
    
    UIButton *btn98 = [[UIButton alloc] init];
    btn98.backgroundColor = [UIColor blackColor];
    [btn98 setTitle:@"98" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn98 Width:60 Height:60 Row:3 Column:1 Alignment:DXAlignStretch];
    
    UIButton *btn99 = [[UIButton alloc] init];
    btn99.backgroundColor = [UIColor orangeColor];
    [btn99 setTitle:@"99" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn99 Width:40 Height:30 Row:3 Column:2 Margin:DXMarginMake(2, 2, 2, 2) Alignment:DXAlignRightBottom];
    
    UIButton *btn100 = [[UIButton alloc] init];
    btn100.backgroundColor = [UIColor orangeColor];
    [btn100 setTitle:@"btn100" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn100 Row:4 Column:0];
    
    UIButton *btn101 = [[UIButton alloc] init];
    btn101.backgroundColor = [UIColor orangeColor];
    [btn101 setTitle:@"btn101" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn101 Row:4 Column:2 Margin:DXMarginMake(5, 5, 5, 5)];
    
    UIButton *btn103 = [[UIButton alloc] init];
    btn103.backgroundColor = [UIColor blueColor];
    [btn103 setTitle:@"btn103" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn103 Row:3 Column:3];
    
    UIButton *btn104 = [[UIButton alloc] init];
    btn104.backgroundColor = [UIColor darkGrayColor];
    [btn104 setTitle:@"btn104" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn104 Row:4 RowSpan:1 Column:3 ColumnSpan:2];
    
    UIButton *btn105 = [[UIButton alloc] init];
    btn105.backgroundColor = [UIColor darkGrayColor];
    [btn105 setTitle:@"105" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn105 Width:40 Height:400 Row:1 RowSpan:3 Column:2 ColumnSpan:1 Margin:DXMarginMake(5, 5, 5, 5) Alignment:DXAlignLeftTop];

    MyViewController_03 *mvc3 = [[MyViewController_03 alloc] init];
    mvc3.view.backgroundColor = [UIColor redColor];
    [gridLayout addLayoutItem:mvc3 Row:5 RowSpan:1 Column:0 ColumnSpan:4];
    
    UIButton *btn10 = [[UIButton alloc] init];
    btn10.backgroundColor = [UIColor orangeColor];
    [btn10 setTitle:@"btn10" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn10 Row:5 Column:4];
    
#pragma ========================================================
#else// Not specify the view's size
    DXGridCell *row0 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
//    DXGridCell *row1 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row1 = [[DXGridCell alloc] initWithDimension:100];// row fixed Height
//    DXGridCell *row2 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row2 = [[DXGridCell alloc] initWithDimension:150];// row fixed Height
    DXGridCell *row3 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row4 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    DXGridCell *row5 = [[DXGridCell alloc] initWithWeight:0.5];// row Height Weight: 0.5

    DXGridCell *col0 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col1 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col2 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col3 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
//    DXGridCell *col4 = [[DXGridCell alloc] initWithWeight:2];// column width Weight: 1
    DXGridCell *col4 = [[DXGridCell alloc] initWithDimension:100];// column fixed width

//    NSArray<DXGridCell *> *rowcells = [[NSArray alloc] initWithObjects:row0, row1, row2, row3, row4, row5, nil];
//    NSArray<DXGridCell *> *colcells = [[NSArray alloc] initWithObjects:col0, col1, col2, col3, col4, nil];

    gridLayout = [[DXGridLayout alloc] initWithFrame:CGRectMake(0, 0, rectSreen.size.width, rectSreen.size.height)];
    [gridLayout setPadding:padding];
//    [gridLayout setRowCells:rowcells];
//    [gridLayout setColumnCells:colcells];
//    gridLayout.rowCells = @[row0, row1, row2, row3, row4, row5];
//    gridLayout.columnCells = @[col0, col1, col2, col3, col4];
    [gridLayout setRowCellsWithObject:row0, row1, row2, row3, row4, row5, nil];
    [gridLayout setColumnCellsWithObject:col0, col1, col2, col3, col4, nil];
    
    gridLayout.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn1 Row:0 Column:0];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.backgroundColor = [UIColor blueColor];
    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn2 Row:0 RowSpan:1 Column:1 ColumnSpan:2 Margin:DXMarginMake(5, 5, 5, 5)];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.backgroundColor = [UIColor cyanColor];
    [btn3 setTitle:@"btn3" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn3 Row:0 RowSpan:2 Column:3 ColumnSpan:1];
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.backgroundColor = [UIColor greenColor];
    [btn4 setTitle:@"btn4" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn4 Row:1 RowSpan:1 Column:0 ColumnSpan:2];
    
    UIButton *btn5 = [[UIButton alloc] init];
    btn5.backgroundColor = [UIColor brownColor];
    [btn5 setTitle:@"btn5" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn5 Row:1 Column:2 Margin:DXMarginMake(10, 10, 10, 10)];
    
    UIButton *btn6 = [[UIButton alloc] init];
    btn6.backgroundColor = [UIColor magentaColor];
    [btn6 setTitle:@"btn6" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn6 Row:2 RowSpan:1 Column:0 ColumnSpan:4 Margin:DXMarginMake(10, 10, 10, 10)];
    
    UIButton *btn7 = [[UIButton alloc] init];
    btn7.backgroundColor = [UIColor lightGrayColor];
    [btn7 setTitle:@"btn7" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn7 Row:3 Column:0];
    
    UIButton *btn8 = [[UIButton alloc] init];
    btn8.backgroundColor = [UIColor grayColor];
    [btn8 setTitle:@"btn8" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn8 Row:3 RowSpan:1 Column:1 ColumnSpan:3];
    
    UIButton *btn9 = [[UIButton alloc] init];
    btn9.backgroundColor = [UIColor orangeColor];
    [btn9 setTitle:@"btn9" forState:UIControlStateNormal];
        [gridLayout addLayoutItem:btn6 Row:3 Column:1];
    [gridLayout addLayoutItem:btn9 Row:0 RowSpan:4 Column:4 ColumnSpan:1 Margin:DXMarginMake(2, 2, 2, 2)];
    
    UITabBar *tabbar = [[UITabBar alloc] init];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"TB 1" image:nil tag:0];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"TB 2" image:nil tag:1];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"TB 3" image:nil tag:2];
    
    NSArray *tabBarItemArray = [[NSArray alloc] initWithObjects: tabBarItem1, tabBarItem2, tabBarItem3, nil];
    [tabbar setItems: tabBarItemArray];
    [gridLayout addLayoutItem:tabbar Row:4 RowSpan:1 Column:0 ColumnSpan:5];
    
    MyViewController_03 *mvc3 = [[MyViewController_03 alloc] init];
    mvc3.view.backgroundColor = [UIColor redColor];
    [gridLayout addLayoutItem:mvc3 Row:5 RowSpan:1 Column:0 ColumnSpan:4];
    
    UIButton *btn10 = [[UIButton alloc] init];
    btn10.backgroundColor = [UIColor orangeColor];
    [btn10 setTitle:@"btn10" forState:UIControlStateNormal];
    [gridLayout addLayoutItem:btn10 Row:5 Column:4];
#endif

    [self.view addSubview:gridLayout];
}

//- (void)viewWillLayoutSubviews {
//     CGRect rectSreen = [UIScreen mainScreen].bounds;
//    gridLayout.frame = CGRectMake(rectSreen.origin.x, rectSreen.origin.y, rectSreen.size.width, rectSreen.size.height);
////    [gridLayout setNeedsLayout];
//    [super viewWillLayoutSubviews];
//}

//- (void)viewDidLayoutSubviews {
////    CGRect rectSreen = [UIScreen mainScreen].bounds;
////    gridLayout.frame = CGRectMake(rectSreen.origin.x, rectSreen.origin.y, rectSreen.size.width, rectSreen.size.height);
////    [gridLayout setNeedsLayout];
//    [super viewDidLayoutSubviews];
//}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//        CGRect rectSreen = [UIScreen mainScreen].bounds;
//        gridLayout.frame = CGRectMake(rectSreen.origin.x, rectSreen.origin.y, rectSreen.size.width, rectSreen.size.height);
//    
//    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
//}



//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
//    CGRect rectSreen = [UIScreen mainScreen].bounds;
//    gridLayout.frame = CGRectMake(rectSreen.origin.x, rectSreen.origin.y, rectSreen.size.width, rectSreen.size.height);
//    
//    switch (toInterfaceOrientation) {
//        caseUIInterfaceOrientationPortrait:
//            break;
//        caseUIInterfaceOrientationPortraitUpsideDown:
//            break;
//        caseUIInterfaceOrientationLandscapeLeft:
//            break;
//        caseUIInterfaceOrientationLandscapeRight:
//            break;
//        default:
//            break;
//    }
//}

//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
//        CGRect rectSreen = [UIScreen mainScreen].bounds;
//        gridLayout.frame = CGRectMake(rectSreen.origin.x, rectSreen.origin.y, rectSreen.size.width, rectSreen.size.height);
//    
//    switch (toInterfaceOrientation) {
//        caseUIInterfaceOrientationPortrait:
//            break;
//        caseUIInterfaceOrientationPortraitUpsideDown:
//            break;
//        caseUIInterfaceOrientationLandscapeLeft:
//            break;
//        caseUIInterfaceOrientationLandscapeRight:
//            break;
//        default:
//            break;
//    }
//}

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

@end
