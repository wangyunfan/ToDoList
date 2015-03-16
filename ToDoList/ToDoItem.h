//
//  ToDoItem.h
//  ToDoList
//
//  Created by 王 云帆 on 15/3/16.
//  Copyright (c) 2015年 王 云帆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject


@property NSString *itemName;
@property BOOL *completed;
@property (readonly)NSData *creationDate;


@end
