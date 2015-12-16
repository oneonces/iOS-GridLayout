# iOS-GridLayout
iOS Grid layout using code

Grid Layout for iOS

Using
you can use Weight or specify the width/height of the grid cell.

e.g

    DXPadding padding = DXPaddingMake(5, 5, 5, 5);
    
    DXGridCell *row0 = [[DXGridCell alloc] initWithWeight:1];// row Height Weight: 1
    
    DXGridCell *row1 = [[DXGridCell alloc] initWithDimension:100];// row fixed Height
    
    DXGridCell *row2 = [[DXGridCell alloc] initWithDimension:150];// row fixed Height
    
    DXGridCell *row3 = [[DXGridCell alloc] initWithWeight:0.5];// row Height Weight: 0.5

    DXGridCell *col0 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col1 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col2 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    DXGridCell *col3 = [[DXGridCell alloc] initWithWeight:1];// column width Weight: 1
    //    DXGridCell *col4 = [[DXGridCell alloc] initWithWeight:2];// column width Weight: 1
    DXGridCell *col4 = [[DXGridCell alloc] initWithDimension:200];// column fixed width 200
    
    NSArray<DXGridCell *> *rowcells = [[NSArray alloc] initWithObjects:row0, row1, row2, row3, nil];
    NSArray<DXGridCell *> *colcells = [[NSArray alloc] initWithObjects:col0, col1, col2, col3, col4, nil];
    
    gridLayout = [[DXGridLayout alloc] initWithFrame:CGRectMake(0, 0, rectSreen.size.width, rectSreen.size.height)];
    [gridLayout setPadding:padding];
    [gridLayout setRowCells:rowcells];
    [gridLayout setColumnCells:colcells];
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
//    [gridLayout addLayoutItem:btn1 Row:0 Column:0];

    [gridLayout addLayoutItem:btn1 Width:40 Height:40 Row:0 Column:0];
    
    UIButton *btn10 = [[UIButton alloc] init];
    btn10.backgroundColor = [UIColor orangeColor];
    [gridLayout addLayoutItem:btn10 Row:3 Column:2];
    
    [self.view addSubview:gridLayout];
    
    
    
