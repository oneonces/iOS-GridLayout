//
//  DXLayoutAttribute.h
//  UITabBarController_Test01
//
//  Created by lianghua on 15/12/14.
//  Copyright © 2015年 launch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>





#define DEFAULT_VALUE                    0
#define DEFAULT_SPAN                    1



typedef NS_ENUM(NSInteger, DXLayoutAlignment) {
    DXAlignUnknown = -1,
    DXAlignHorizontalLeft = 1 << 0,
    DXAlignHorizontalCenter = 1 << 1,
    DXAlignHorizontalRight = 1 << 2,
    DXAlignVerticalTop = 1 << 3,
    DXAlignVerticalCenter = 1 << 4,
    DXAlignVerticalBottom = 1 << 5,
    DXAlignStretch = 1 << 6,
    DXAlignLeftTop = DXAlignHorizontalLeft | DXAlignVerticalTop,
    DXAlignRightTop = DXAlignHorizontalRight | DXAlignVerticalTop,
    DXAlignCenter = DXAlignHorizontalCenter | DXAlignVerticalCenter,
    DXAlignLeftBottom = DXAlignHorizontalLeft | DXAlignVerticalBottom,
    DXAlignRightBottom = DXAlignHorizontalRight | DXAlignVerticalBottom,
};


#pragma =============================================================================

#define DXMargin UIEdgeInsets
#define DXPadding UIEdgeInsets

static inline DXMargin DXMarginMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    DXMargin margin = {top, left, bottom, right};
    return margin;
}

static inline DXPadding DXPaddingMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    DXPadding padding = {top, left, bottom, right};
    return padding;
}




#pragma =============================================================================
@interface DXGridCell : NSObject {
}

@property(nonatomic, assign)CGFloat dimension;// row Height, or column width
@property(nonatomic, assign)CGFloat weight;// row or column cell weight

-(nullable id)initWithWeight:(CGFloat)weight;
-(nullable id)initWithDimension:(CGFloat)dim;

@end


#pragma =============================================================================



@interface DXLayoutAttribute : NSObject {
    
}

@property(nonatomic, assign)NSInteger row;
@property(nonatomic, assign)NSInteger column;
@property(nonatomic, assign)NSInteger rowSpan;
@property(nonatomic, assign)NSInteger columnSpan;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@property(nonatomic, assign)CGFloat actualWidth;
@property(nonatomic, assign)CGFloat actualheight;
@property(nonatomic, assign)DXMargin margin;
@property(nonatomic, assign)DXLayoutAlignment alignment;





@end



#pragma =============================================================================
@interface DXGridCellItem : NSObject {
}

@property(nonnull, nonatomic, strong)DXGridCell *cell;
@property(nonnull, nonatomic, strong)DXLayoutAttribute* attribute;

@end




#pragma =============================================================================


#pragma DXLayoutItem
@interface DXLayoutItem : NSObject {
}

@property(nonnull, nonatomic, strong)id view;
@property(nonnull, nonatomic, strong)DXLayoutAttribute* attribute;

@end

