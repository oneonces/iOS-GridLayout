//
//  DXLayoutAttribute.m
//  UITabBarController_Test01
//
//  Created by lianghua on 15/12/14.
//  Copyright © 2015年 launch. All rights reserved.
//

#import "DXLayoutAttribute.h"



#pragma =============================================================================
@implementation DXGridCellItem : NSObject
-(id)init {
    self = [super init];
    if (self) {
    }
    return self;
}
@end


#pragma =============================================================================

#pragma DXLayoutItem

@implementation DXLayoutItem
-(id)init {
    self = [super init];
    if (self) {
    }
    return self;
}
@end




#pragma mark =============================================================================
@implementation DXGridCell

-(id)init {
    return  [self initWithWeight:1];
}

-(id)initWithDimension:(CGFloat)dim {
    self = [super init];
    if (self) {
        self.dimension = dim;
        self.weight = DEFAULT_VALUE;
    }
    
    return self;
}

-(id)initWithWeight:(CGFloat)weight {
    self = [super init];
    if (self) {
        self.dimension = DEFAULT_VALUE;
        self.weight = weight;
    }
    
    return self;
}

@end




#pragma =============================================================================

#pragma DXLayoutAttribute
@interface DXLayoutAttribute ()

@end

@implementation DXLayoutAttribute



-(id)init {
    self = [super init];
    if (self) {
        self.row = DEFAULT_VALUE;
        self.column = DEFAULT_VALUE;
        self.rowSpan = DEFAULT_SPAN;
        self.columnSpan = DEFAULT_SPAN;
        self.width = DEFAULT_VALUE;
        self.height = DEFAULT_VALUE;
        self.actualheight = DEFAULT_VALUE;
        self.height = DEFAULT_VALUE;
        self.margin = DXMarginMake(DEFAULT_VALUE, DEFAULT_VALUE, DEFAULT_VALUE, DEFAULT_VALUE);
        self.alignment = DXAlignStretch;
    }
    
    return self;
}

@end
