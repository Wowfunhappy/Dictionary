//
//  DictionaryTermCell.h
//  Dictionary
//
//  Created by Forrest Ye on 7/1/13.
//
//

#import <UIKit/UIKit.h>

#define kDictionaryTermCellID @"wordCellID"


typedef NS_ENUM(NSInteger, DictionaryTableViewCellType) {
  DictionaryTableViewCellTypeNormal,
  DictionaryTableViewCellTypeAction,
  DictionaryTableViewCellTypeDisabled,
};


@interface SDTDictionaryTermCell : UITableViewCell


- (void)changeToType:(DictionaryTableViewCellType)type withText:(NSString *)text;

- (void)changeToType:(DictionaryTableViewCellType)type;


@end
