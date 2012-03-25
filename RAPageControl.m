//
//  RAPageControl.h
//  mults
//
//  Created by Ravis on 08.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RAPageControl : UIView{
    NSUInteger _pageCount;
    NSUInteger _currentPage;
    CGPoint _selfCenter;
    
    UIImage *_activeDotImage;
    UIImage *_inactiveDotImage;
    NSMutableArray *_imgViewsArray;
    
    UIButton *_left;
    UIButton *_right;
}
@property (nonatomic, readonly) NSUInteger pageCount;
@property (nonatomic, readonly) NSUInteger currentPage;
@property (nonatomic, retain) UIButton *lBtn;
@property (nonatomic, retain) UIButton *rBtn;

-(void)setPageCount:(NSUInteger)pageCount;
-(void)setCurrentPage:(NSUInteger)currentPage;

@end
