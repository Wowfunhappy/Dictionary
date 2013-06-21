//
//  DICWordLookupTableViewController.h
//  Dictionary
//
//  Created by Feng Ye on 11/18/11.
//  Copyright (c) 2011 @forresty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITextChecker;

@interface DICWordLookupTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong) NSMutableArray *guessesArray;
@property (strong) UISearchDisplayController *mySearchDisplayController;
@property (strong) NSOperationQueue *guessOperationQueue;
@property BOOL exactMatch;
@property BOOL guessing;

@end
