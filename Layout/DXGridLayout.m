//
//  DXGridLayout.m
//  UITabBarController_Test01
//
//  Created by lianghua on 15/12/14.
//  Copyright © 2015年 launch. All rights reserved.
//

#import "DXGridLayout.h"


#define AUTORESIZIUINGMASK UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin| UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin

@interface DXGridLayout ()

@property(nullable, nonatomic, strong)NSMutableArray *viewitems;
@property(nullable, nonatomic, strong)NSMutableArray<DXGridCellItem *> *gridRowItems;
@property(nullable, nonatomic, strong)NSMutableArray<DXGridCellItem *> *gridColumnItems;
@property(nonatomic, assign)BOOL haslayout;
//@property(nonatomic, assign)UIDeviceOrientation screenOrientation;
@end



@implementation DXGridLayout



-(id)init {
    return [self initWithFrame:[self defaultFrame]];
}

-(id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame Rows:nil Columns:nil];
}

-(id)initWithFrame:(CGRect)frame Rows:(NSArray<DXGridCell *>*)rows Columns:(NSArray<DXGridCell *>*)columns {
    return [self initWithFrame:frame Rows:rows Columns:columns Padding:DXPaddingMake(0, 0, 0, 0)];
}

-(id)initWithFrame:(CGRect)frame Rows:(NSArray<DXGridCell *>*)rows Columns:(NSArray<DXGridCell *>*)columns Padding:(DXPadding)padding {
    self = [super initWithFrame:frame];
    if (self) {
        self.haslayout = FALSE;
        self.frame = frame;
        self.viewitems = [[NSMutableArray alloc] initWithCapacity:0];
        
        self.padding = padding;
        [self fillGridCellItems:rows Columns:columns];

        self.autoresizingMask = AUTORESIZIUINGMASK;
    }
    return self;
}

-(CGRect)defaultFrame {
    CGRect rect;
    //    CGRect rectSreen = [UIScreen mainScreen].bounds;
    //    CGRect rectStatusbar = [[UIApplication sharedApplication] statusBarFrame];
    id parent = [self superview];
    if ([[parent class] isSubclassOfClass:[UIView class]]) {
        UIView *view = parent;
        rect = view.frame;
    }
    else if ([[parent class] isSubclassOfClass:[UIViewController class]]) {
        UIViewController *vc = parent;
        rect = vc.view.bounds;
    }
    
    return rect;
}

-(void)setRowCellsWithObject:(DXGridCell *)firstCell, ... {
    NSMutableArray<DXGridCell *> *cellList = [[NSMutableArray alloc] initWithCapacity:0];
    
    va_list args;
    va_start(args, firstCell);
    if (nil != firstCell) {
        [cellList addObject:firstCell];
        
        DXGridCell * cell;
        while (nil != (cell = va_arg(args, DXGridCell *))) {
            [cellList addObject:cell];
        }
    }
    va_end(args);
    self.rowCells = [cellList copy];
}

-(void)setColumnCellsWithObject:(DXGridCell *)firstCell, ... {
    NSMutableArray<DXGridCell *> *cellList = [[NSMutableArray alloc] initWithCapacity:0];
    
    va_list args;
    va_start(args, firstCell);
    if (nil != firstCell) {
        [cellList addObject:firstCell];
        
        DXGridCell * cell;
        while (nil != (cell = va_arg(args, DXGridCell *))) {
            [cellList addObject:cell];
        }
    }
    va_end(args);
    self.columnCells = [cellList copy];
}

// 默认只有1行1列
-(void)addLayoutItem:(id)view {
    [self addLayoutItem:view Row:0 Column:0];// palce at row-0 column 0
}

-(void)addLayoutItem:(id)view Row:(NSInteger)row Column:(NSInteger)column {
    [self addLayoutItem:view Row:row Column:column Margin:DXMarginMake(0, 0, 0, 0)];
}

-(void)addLayoutItem:(id)view Row:(NSInteger) row Column:(NSInteger)column Margin:(DXMargin)margin {
    [self addLayoutItem:view Row:row RowSpan:DEFAULT_SPAN Column:column ColumnSpan:DEFAULT_SPAN Margin:margin];
}

-(void)addLayoutItem:(id)view Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan {
    [self addLayoutItem:view Row:row RowSpan:rowSpan Column:column ColumnSpan:columnSpan Margin:DXMarginMake(0, 0, 0, 0)];
}

-(void)addLayoutItem:(id)view Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Margin:(DXMargin)margin {
    [self addLayoutItem:view Width:DEFAULT_VALUE Height:DEFAULT_VALUE Row:row RowSpan:rowSpan Column:column ColumnSpan:columnSpan Margin:margin];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:DEFAULT_SPAN Column:column ColumnSpan:DEFAULT_SPAN];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column Alignment:(DXLayoutAlignment)alignment {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:DEFAULT_SPAN Column:column ColumnSpan:DEFAULT_SPAN Alignment:alignment];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column Margin:(DXMargin)margin {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:DEFAULT_SPAN Column:column ColumnSpan:DEFAULT_SPAN Margin:margin];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column Margin:(DXMargin)margin Alignment:(DXLayoutAlignment)alignment {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:DEFAULT_SPAN Column:column ColumnSpan:DEFAULT_SPAN Margin:margin Alignment:alignment];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:rowSpan Column:column ColumnSpan:columnSpan Margin:DXMarginMake(0, 0, 0, 0)];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Margin:(DXMargin)margin {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:rowSpan Column:column ColumnSpan:columnSpan Margin:margin Alignment:DXAlignCenter];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Alignment:(DXLayoutAlignment)alignment {
    return [self addLayoutItem:view Width:width Height:height Row:row RowSpan:rowSpan Column:column ColumnSpan:columnSpan Margin:DXMarginMake(0, 0, 0, 0) Alignment:alignment];
}

-(void)addLayoutItem:(id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Margin:(DXMargin)margin Alignment:(DXLayoutAlignment)alignment {
    DXLayoutAttribute *attribute = [[DXLayoutAttribute alloc] init];
    DXLayoutItem *viewitem = [[DXLayoutItem alloc] init];
    
    viewitem.view = view;
    if ([[viewitem.view class] isSubclassOfClass:[UIView class]]) {
        UIView *v = viewitem.view;
        v.autoresizingMask = AUTORESIZIUINGMASK;
    }
    else if ([[viewitem.view class] isSubclassOfClass:[UIViewController class]]) {
        UIViewController* v = viewitem.view;
        v.view.autoresizingMask = AUTORESIZIUINGMASK;
    }
    
    attribute.row = row;
    attribute.rowSpan = rowSpan;
    attribute.column = column;
    attribute.columnSpan = columnSpan;
    attribute.width = width;
    attribute.height = height;
    attribute.margin = margin;
    attribute.alignment = alignment;
    
    viewitem.attribute = attribute;
    
    [self.viewitems addObject:viewitem];
}

-(BOOL)fillGridCellItems:(NSArray<DXGridCell *>*)rows Columns:(NSArray<DXGridCell *>*)columns {
    NSArray<DXGridCell *> *rowcells = nil;
    NSArray<DXGridCell *> *colcells = nil;
    if (nil == rows) {
        rowcells = self.rowCells;
    }
    else {
        rowcells = rows;
    }
        
    if (nil == columns) {
        colcells = self.columnCells;
    }
    else {
        colcells = columns;
    }
    
    NSInteger idx = 0;
    NSInteger cnt = [rowcells count];
    if (cnt > 0 && nil == self.gridRowItems)
        self.gridRowItems = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (idx = 0; idx < cnt; idx++) {
        DXGridCellItem *cellItem = [[DXGridCellItem alloc] init];
        cellItem.cell = [rowcells objectAtIndex:idx];
        [self.gridRowItems addObject:cellItem];
    }
    
    cnt = [colcells count];
    if (cnt > 0 && nil == self.gridColumnItems)
        self.gridColumnItems = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (idx = 0; idx < cnt; idx++) {
        DXGridCellItem *cellItem = [[DXGridCellItem alloc] init];
        cellItem.cell = [colcells objectAtIndex:idx];
        [self.gridColumnItems addObject:cellItem];
    }
    return TRUE;
}

-(void)updateLayout {
    BOOL fillSuccess = [self fillGridCellItems:nil Columns:nil];
    if (FALSE == fillSuccess) {
        return;
    }
    [self calculateGridCellAttribute];
    
    NSInteger viewItemIdx=0;
    NSInteger viewItemcount=0;
    NSInteger row;
    NSInteger column;
    
    CGFloat currentHorPosition = 0;
    CGFloat currentVerPosition = 0;
    viewItemcount = [self.viewitems count];

    for (viewItemIdx = 0; viewItemIdx < viewItemcount; viewItemIdx++) {
        DXLayoutItem *viewitem = [self.viewitems objectAtIndex:viewItemIdx];
        row = viewitem.attribute.row;
        column = viewitem.attribute.column;
        
        CGRect rect;
        if ([[viewitem.view class] isSubclassOfClass:[UIView class]]) {
            UIView *v = viewitem.view;
            rect = v.frame;
        }
        else if ([[viewitem.view class] isSubclassOfClass:[UIViewController class]]) {
            UIViewController* v = viewitem.view;
            rect = v.view.frame;
        }
        
        currentHorPosition = self.padding.left;
        for (int i = 0; i < column; i++) {
            DXGridCellItem *colitemtmp = [self.gridColumnItems objectAtIndex:i];
            currentHorPosition += colitemtmp.attribute.actualWidth;
        }
        currentVerPosition = self.padding.top;
        for (int j = 0; j < row; j++) {
            DXGridCellItem *rowitemtmp = [self.gridRowItems objectAtIndex:j];
            currentVerPosition += rowitemtmp.attribute.actualheight;
        }
        
        // current row left = all row's width before current
        CGFloat currentItemWidth = 0;
        for (int colspnidx = 0; colspnidx < viewitem.attribute.columnSpan; colspnidx++) {
            DXGridCellItem *colitemtmp = [self.gridColumnItems objectAtIndex:(column + colspnidx)];
            currentItemWidth += colitemtmp.attribute.actualWidth;
        }

        // current row top = all row's height before current
        CGFloat currentItemHeight = 0;
        for (int rowspnidx = 0; rowspnidx < viewitem.attribute.rowSpan; rowspnidx++) {
            DXGridCellItem *rowitemtmp = [self.gridRowItems objectAtIndex:(row + rowspnidx)];
            currentItemHeight += rowitemtmp.attribute.actualheight;
        }

        rect = [self getFrameOfViewItem:viewitem HorStartPosition:currentHorPosition VerStartPosition:currentVerPosition ItemWidth:currentItemWidth ItemHeight:currentItemHeight];
        
        if ([[viewitem.view class] isSubclassOfClass:[UIView class]]) {
            UIView *v = viewitem.view;
            v.frame = rect;
            [self addSubview:v];
        }
        else if ([[viewitem.view class] isSubclassOfClass:[UIViewController class]]) {
            UIViewController* v = viewitem.view;
            v.view.frame = rect;
            [self addSubview:v.view];
        }
    }
}

-(CGRect) getFrameOfViewItem:(DXLayoutItem *)viewItem HorStartPosition:(CGFloat)horStartPosition VerStartPosition:(CGFloat)verStartPosition ItemWidth:(CGFloat)itemWidth ItemHeight:(CGFloat)itemHeight {
    CGRect rect;
    DXLayoutAlignment alig = viewItem.attribute.alignment;
    
    DXMargin margin = viewItem.attribute.margin;
    if (viewItem.attribute.width >= itemWidth || viewItem.attribute.width >= (itemWidth + margin.left + margin.right)) {
        viewItem.attribute.actualWidth = itemWidth - margin.left - margin.right;
    }
    else {
        viewItem.attribute.actualWidth = viewItem.attribute.width;
    }
    
    if (viewItem.attribute.height >= itemHeight || viewItem.attribute.height >= (itemHeight + margin.top + margin.bottom)) {
        viewItem.attribute.actualheight = itemHeight - margin.top - margin.bottom;
    }
    else {
        viewItem.attribute.actualheight = viewItem.attribute.height;
    }
    
    // not set the width or height, default use Stretch Alignment
    if (DXAlignStretch == alig || DEFAULT_VALUE >= viewItem.attribute.width || DEFAULT_VALUE >= viewItem.attribute.height) {
        viewItem.attribute.margin = margin;
    }
    // has set the width and height and alignment
    else {// use the specified alignment
        if (DXAlignHorizontalLeft == (alig & DXAlignHorizontalLeft)) {
            margin.right = itemWidth - viewItem.attribute.actualWidth - margin.left;
            if (DXAlignHorizontalLeft == alig) {
                margin.top = margin.bottom = (itemHeight - viewItem.attribute.actualheight) / 2;
            }
        }

        if (DXAlignHorizontalCenter == (alig & DXAlignHorizontalCenter)) {
            margin.left = margin.right = (itemWidth - viewItem.attribute.actualWidth) / 2;
            if (DXAlignHorizontalCenter == alig)
                margin.top = margin.bottom = (itemHeight - viewItem.attribute.actualheight) / 2;
        }

        if (DXAlignHorizontalRight == (alig & DXAlignHorizontalRight))  {
            margin.left = itemWidth - viewItem.attribute.actualWidth - margin.right;
            if (DXAlignHorizontalRight == alig)
                margin.top = margin.bottom = (itemHeight - viewItem.attribute.actualheight) / 2;
        }
        
        if (DXAlignVerticalTop == (alig & DXAlignVerticalTop)) {
            margin.bottom = itemHeight - viewItem.attribute.actualheight - margin.top;
            if (DXAlignVerticalTop == alig)
                margin.left = margin.right = (itemWidth - viewItem.attribute.actualWidth) / 2;
        }
        
        if (DXAlignVerticalCenter == (alig & DXAlignVerticalCenter)) {
            margin.top = margin.bottom = (itemHeight - viewItem.attribute.actualheight) / 2;
            if (DXAlignVerticalCenter == alig)
                margin.left = margin.right = (itemWidth - viewItem.attribute.actualWidth) / 2;
        }
        
        if (DXAlignVerticalBottom == (alig & DXAlignVerticalBottom)) {
            margin.top = itemHeight - viewItem.attribute.actualheight - margin.bottom;
            if (DXAlignVerticalBottom == alig)
                margin.left = margin.right = (itemWidth - viewItem.attribute.actualWidth) / 2;
        }

        viewItem.attribute.margin = margin;
    }
    
    rect.origin.x = horStartPosition + viewItem.attribute.margin.left;
    rect.origin.y = verStartPosition + viewItem.attribute.margin.top;
    rect.size.width = itemWidth - viewItem.attribute.margin.left - viewItem.attribute.margin.right;
    rect.size.height = itemHeight - viewItem.attribute.margin.top - viewItem.attribute.margin.bottom;

    return rect;
}

-(void) calculateGridCellAttribute {
    [self calcilateGridRowCellAttribute];
    [self calcilateGridcolumnCellAttribute];
}

-(void) calcilateGridRowCellAttribute {
    NSInteger count = [self.gridRowItems count];
    NSInteger i=0;
    CGFloat layoutHeight = 0;
    CGFloat dimCellTotalHeight = 0;// all fix cells total height
    CGFloat dimCellCount = 0;// the count of fix-width/height cell
    CGFloat weightCellTotalHeight = 0;// all weight cells total height
    CGFloat weightCellCount = 0;// the count of weight-width/height cell
    
    layoutHeight = self.frame.size.height;

    for (i = 0; i < count; i++) {
        DXGridCellItem *gridCellItem = [self.gridRowItems objectAtIndex:i];
        if (DEFAULT_VALUE != gridCellItem.cell.weight) {
            weightCellCount += gridCellItem.cell.weight;
        }
        else {
            dimCellCount++;
            dimCellTotalHeight += gridCellItem.cell.dimension;
        }
    }
    
    weightCellTotalHeight = layoutHeight - dimCellTotalHeight - self.padding.top - self.padding.bottom;
    for (i = 0; i < count; i++) {
        DXGridCellItem *gridCellItem = [self.gridRowItems objectAtIndex:i];
        if (nil == gridCellItem.attribute)
            gridCellItem.attribute = [[DXLayoutAttribute alloc] init];
        if (DEFAULT_VALUE != gridCellItem.cell.weight) {
            gridCellItem.attribute.actualheight = (weightCellTotalHeight * gridCellItem.cell.weight) / weightCellCount;
        }
        else {
            gridCellItem.attribute.actualheight = gridCellItem.cell.dimension;
        }
    }
}

-(void) calcilateGridcolumnCellAttribute {
    NSInteger count = [self.gridColumnItems count];
    NSInteger i=0;
    CGFloat layoutWidth = 0;
    CGFloat dimCellTotalWidth = 0;
    CGFloat dimCellCount = 0;
    CGFloat weightCellTotalWidth = 0;
    CGFloat weightCellCount = 0;
    
    layoutWidth = self.frame.size.width;

    for (i = 0; i < count; i++) {
        DXGridCellItem *gridCellItem = [self.gridColumnItems objectAtIndex:i];
        if (DEFAULT_VALUE != gridCellItem.cell.weight) {
            weightCellCount += gridCellItem.cell.weight;
        }
        else {
            dimCellCount++;
            dimCellTotalWidth += gridCellItem.cell.dimension;
        }
    }
    
    weightCellTotalWidth = layoutWidth - dimCellTotalWidth - self.padding.left - self.padding.right;
    for (i = 0; i < count; i++) {
        DXGridCellItem *gridCellItem = [self.gridColumnItems objectAtIndex:i];
        if (nil == gridCellItem.attribute)
            gridCellItem.attribute = [[DXLayoutAttribute alloc] init];
        if (DEFAULT_VALUE != gridCellItem.cell.weight) {
            gridCellItem.attribute.actualWidth = (weightCellTotalWidth * gridCellItem.cell.weight) / weightCellCount;
        }
        else {
            gridCellItem.attribute.actualWidth = gridCellItem.cell.dimension;
        }
    }
}

- (void)layoutSubviews {
//    self.screenOrientation = [UIDevice currentDevice].orientation;
//    UIDeviceOrientation apporientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (FALSE == self.haslayout) {
        self.haslayout = TRUE;
        [self updateLayout];
    }
//    [self updateLayout];
    [super layoutSubviews];
}

@end
