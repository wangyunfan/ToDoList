//
//  ToDoItem.h
//  ToDoList
//
//  Created by 王 云帆 on 15/3/18.
//  Copyright (c) 2015年 王 云帆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic,assign) Boolean  completed;
@property (nonatomic, retain) NSString * creationDate;

@end
