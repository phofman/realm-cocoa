/* @@Example: ex_objc_query_typed_intro @@ */
#import <Realm/Realm.h>
#import "people.h"

/*
 The classes People, PeopleQuery, PeopleView, and PeopleRow are declared
 (interfaces are generated) in people.h as

 REALM_TABLE_DEF_3(People,
                     Name,  String,
                     Age,   Int,
                     Hired, Bool)

 and in people.m you must have

 REALM_TABLE_IMPL_3(People,
                      Name, String,
                      Age,  Int,
                      Hired, Bool)

 in order to generate the implementation of the classes.
 */

void ex_objc_query_typed_intro()
{
    // Creates a new table of the type defined above
    People *table = [[People alloc] init];
    
    // Adds rows to the table.
    [table addRow:@{@"Name":@"Brian", @"Age":@14, @"Hired":@NO}];
    [table addRow:@{@"Name":@"Jack",  @"Age":@34, @"Hired":@YES}];
    [table addRow:@{@"Name":@"Bob",   @"Age":@10, @"Hired":@NO}];
        
    // Create a view
    RLMView *view = [table where:@"Age > 20"];
    
    // Iterate over the query result
    for (RLMRow *row in view) {
        NSLog(@"Person matching query: %@", row[@"Name"]);
    }
}
/* @@EndExample@@ */
