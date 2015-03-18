//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by 王 云帆 on 15/3/13.
//  Copyright (c) 2015年 王 云帆. All rights reserved.
//

#import "AddToDoItemViewController.h"
#import "ToDoItem.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoItemViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


    if(sender != self.doneButton) return;
    if (self.textField.text.length > 0) {
        
        
        
        NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
        NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingString:@"ToDoitem.data"]];
        NSError *error = nil;
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
        if (store == nil) {
            [NSException raise:@"添加数据库错误" format:@"%@",[error localizedDescription]];
        }
        
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
        context.persistentStoreCoordinator = psc;
        
        
        NSManagedObject *toDoItem = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem" inManagedObjectContext:context];
        NSLog(@"1-------------------");
        
       
        
//        self.toDoItem = [[ToDoItem alloc]init];
//        self.toDoItem.itemName = self.textField.text;
//        self.toDoItem.completed = false;
        [toDoItem setValue:self.textField.text forKey:@"itemName"];
        [toDoItem setValue:false forKey:@"completed"];
        
        BOOL success = [context save:&error];
        if (!success) {
            [NSException raise:@"访问数据库失败" format:@"%@",[error localizedDescription]];
        }
        
//        
//        NSFetchRequest *request = [[NSFetchRequest alloc]init];
//        request.entity = [NSEntityDescription entityForName:@"ToDoItem" inManagedObjectContext:context];
//        NSArray *objs = [context executeFetchRequest:request error:&error];
//        if (error) {
//            [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
//        }
//        // 遍历数据
//        for (NSManagedObject *obj in objs) {
//            NSLog(@"name=%@", [obj valueForKey:@"itemName"]);
//        }

        
 
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
