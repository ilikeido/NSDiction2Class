//
//  Demo.m
//  AFNETTEST
//
//  Created by hesh on 13-8-27.
//  Copyright (c) 2013年 ilikeido. All rights reserved.
//

#import "Demo.h"
#import "NSDictionary+NSDictionary2Object.h"

@interface Child : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) int age;

@end

@implementation Child
@end

@interface Parent : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSArray *children;

@end

@implementation Parent

+(Class)__childrenClass{
    return [Child class];
}

@end

@implementation Demo

-(void)test{
    NSArray *childrenDict = [NSArray arrayWithObject:
                                [NSDictionary dictionaryWithObjectsAndKeys:@"kitty",@"name",@12,@"age", nil]
                         ];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:childrenDict,@"children",@"jonson",@"name",nil];
    Parent *parent = [dict objectByClass:[Parent class]];
    NSLog(@"parent name:%@",parent.name);
    for (Child *child in parent.children) {
        NSLog(@"name:%@ , age:%d",child.name,child.age);
    }
}

@end
