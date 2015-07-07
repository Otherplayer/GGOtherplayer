//
//  RootViewController.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"
#import "NSString+Emoji.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"IOS-Categories";
    _items = @{
            @"UIKit":@[@"UIBezierPath",
                       @"UIButton",
                       @"UIColor",
                       @"UIDevice",
                       @"UIImage",
                       @"UIImageView",
                       @"UILable",
                       @"UINavigationController",
                       @"UIResponder",
                       @"UIScrollView",
                       @"UISearchBar",
                       @"UITableViewCell",
                       @"UITextField",
                       @"UITextView",
                       @"UIView",
                       @"UIViewController",
                       @"UIWebView",
                       @"UIWindow",
                       @"MKMapView",
                       @"UITableView",
                       @"UINavigationBar"

                       ],
            @"Foundation":@[@"NSArray",
                            @"NSBundle",
                            @"NSData",
                            @"NSDate",
                            @"NSDictionary",
                            @"NSException",
                            @"NSFileManager",
                            @"NSObject",
                            @"NSSet",
                            @"NSString",
                            @"NSTimer",
                            @"NSURL",
                            @"NSUserDefaults",
                            @"NSIndexPath",
                            @"NSManagedObjectContext",
                            @"NSDateFormatter"
                            
                            ]
               };
    [self.tableView reloadData];
    
    
//    ":smile:" = "\Ud83d\Ude04";
//    for (long long i = 0xE001; i < 0xE05A; i++) {
//        
//        NSLog(@"-%@",[NSString stringWithFormat:@"%C",i]);
//    }
    
    NSString *s = @"\U0001F604"; // earth globe emoji
    NSLog(@"The length of %@ is %lu", s, [s length]);
    // => The length of   is 2
    
    NSUInteger realLength =
    [s lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    NSLog(@"The real length of %@ is %lu", s, realLength);
    // => The real length of   is 1
    
    
    NSString* fname = @"Test";
    char fnameStr[10];
    memcpy(fnameStr, [fname cStringUsingEncoding:NSUnicodeStringEncoding], 2*([fname length]));
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"%c",fnameStr[i]);
    }
    
    NSData* xmlData = [s dataUsingEncoding:NSUTF32StringEncoding];
    NSLog(@"----%@",xmlData);
    
    NSString *result = [[NSString alloc] initWithData:xmlData  encoding:NSUTF32StringEncoding];
    NSLog(@"%@",result);
    
//    NSString *s = @"e\u0301"; // e + ´
//    NSLog(@"The length of %@ is %lu", s, [s length]);
//    // => The length of é is 2
//    
//    NSString *n = [s precomposedStringWithCanonicalMapping]; NSLog(@"The length of %@ is %lu", n, [n length]);
//    // => The length of é is 1
    
    
//    NSString *s = @"The weather on \U0001F30D is \U0001F31E today.";
//    // The weather on   is   today.
//    NSRange fullRange = NSMakeRange(0, [s length]);
//    [s enumerateSubstringsInRange:fullRange options:NSStringEnumerationByComposedCharacterSequences
//                       usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
//    {
//        NSLog(@"%@ %@", substring, NSStringFromRange(substringRange));
//    }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    NSString *className = [name stringByAppendingString:@"DemoViewController"];
    Class class = NSClassFromString(className);
    UIViewController *controller = [[class alloc]initWithNibName:className bundle:[NSBundle mainBundle]];
    controller.title = name;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
