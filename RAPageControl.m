//
//  RAPageControl.m
//  mults
//
//  Created by Ravis on 08.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RAPageControl.h"

@implementation RAPageControl

@synthesize pageCount=_pageCount, currentPage=_currentPage, lBtn=_left, rBtn=_right;

-(void)setPageCount:(NSUInteger)pageCount{
    if (pageCount<[_imgViewsArray count]){
        return;
    }
//    NSLog(@"Page count to set - %i", pageCount);
//    NSLog(@"Cycle counter - %i", pageCount-[_imgViewsArray count]);
    int lastCount=[_imgViewsArray count];
    for (int i=0;i<(pageCount-lastCount);i++){
        UIImageView *dot=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DOT_1.png"]];
        dot.frame=CGRectMake(0, 0, dot.frame.size.width/1.5, dot.frame.size.height/1.5);
        [self addSubview:dot];
        [_imgViewsArray addObject:dot];
    }
    int deltaCenter=0;
    if (pageCount%2==0)
        deltaCenter=-20*(pageCount/2)+10;
    else
        deltaCenter=-20*(pageCount/2);
//    NSLog(@"deltaCenter - %i", deltaCenter);
//    NSLog(@"self center - %f", _selfCenter.x);
    for (int i=0;i<pageCount;i++){
        UIImageView *curView=[_imgViewsArray objectAtIndex:i];
        curView.center=CGPointMake(_selfCenter.x+deltaCenter, 10);
        NSLog(@"Dot %i center is %f", i, _selfCenter.x+deltaCenter);
        deltaCenter+=20;
    }
    _pageCount=pageCount;
//    NSLog(@"On exit we have %i dots", [_imgViewsArray count]);
}
-(void)setCurrentPage:(NSUInteger)currentPage{
    for (int i=0;i<[_imgViewsArray count];i++){
        UIImageView *curView=[_imgViewsArray objectAtIndex:i];
        if (i==currentPage)
            curView.image=[UIImage imageNamed:@"DOT_2.png"];
        else
            curView.image=[UIImage imageNamed:@"DOT_1.png"];
    }
    _currentPage=currentPage;
}

- (id)initWithFrame:(CGRect)frame
{
    frame.size.height=20;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _selfCenter=CGPointMake(frame.size.width/2, frame.size.height/2);
        _pageCount=1;
        UIImageView *dot=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DOT_2.png"]];
        dot.frame=CGRectMake(0, 0, dot.frame.size.width/1.5, dot.frame.size.height/1.5);
        dot.center=_selfCenter;
        [self addSubview:dot];
        _imgViewsArray=[[NSMutableArray alloc] initWithObjects:dot, nil];
        _currentPage=0;
        //buttons
        _right=[UIButton buttonWithType:UIButtonTypeCustom];
        [_right setFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, 20)];
        [self addSubview:_right];
        _left=[UIButton buttonWithType:UIButtonTypeCustom];
        [_left setFrame:CGRectMake(0, 0, self.frame.size.width/2, 20)];
        [self addSubview:_left];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
