//
//  DXGridLayout.h
//  UITabBarController_Test01
//
//  Created by lianghua on 15/12/14.
//  Copyright © 2015年 launch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXLayoutAttribute.h"







@interface DXGridLayout : UIView {
    
}
@property(nonnull, nonatomic, copy)NSArray<DXGridCell *> *rowCells;
@property(nonnull, nonatomic, copy)NSArray<DXGridCell *> *columnCells;
@property(nonatomic, assign)DXPadding padding;

-(nullable id)initWithFrame:(CGRect)frame Rows:(nullable NSArray<DXGridCell *>*)rows Columns:(nullable NSArray<DXGridCell *>*)columns;
-(nullable id)initWithFrame:(CGRect)frame Rows:(nullable NSArray<DXGridCell *>*)rows Columns:(nullable NSArray<DXGridCell *>*)columns Padding:(DXPadding)padding;

-(void)addLayoutItem:(nonnull id)view;
-(void)addLayoutItem:(nonnull id)view Row:(NSInteger)row Column:(NSInteger)column;
-(void)addLayoutItem:(nonnull id)view Row:(NSInteger) row Column:(NSInteger)column Margin:(DXMargin)margin;
-(void)addLayoutItem:(nonnull id)view Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan;
-(void)addLayoutItem:(nonnull id)view Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Margin:(DXMargin)margin;

-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column;// default center
-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column Alignment:(DXLayoutAlignment)alignment;
-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column Margin:(DXMargin)margin;
-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row Column:(NSInteger)column Margin:(DXMargin)margin Alignment:(DXLayoutAlignment)alignment;
-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan;
-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Margin:(DXMargin)margin;
-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Alignment:(DXLayoutAlignment)alignment;

-(void)addLayoutItem:(nonnull id)view Width:(CGFloat)width Height:(CGFloat)height Row:(NSInteger)row RowSpan:(NSInteger)rowSpan Column:(NSInteger)column ColumnSpan:(NSInteger)columnSpan Margin:(DXMargin)margin Alignment:(DXLayoutAlignment)alignment;



//-(CGRect)defaultFrame;
//-(BOOL)fillGridCellItems:(nullable NSArray<DXGridCell *>*)rows Columns:(nullable NSArray<DXGridCell *>*)columns;
//-(void)updateLayout;
//-(CGRect) getFrameOfViewItem:(nonnull DXLayoutItem *)viewItem HorStartPosition:(CGFloat)horStartPosition VerStartPosition:(CGFloat)verStartPosition ItemWidth:(CGFloat)itemWidth ItemHeight:(CGFloat)itemHeight;
//-(void) calculateGridCellAttribute;
//-(void) calcilateGridRowCellAttribute;
//-(void) calcilateGridcolumnCellAttribute;
@end
