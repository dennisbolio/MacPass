//
//  MPEntyTableDataSource.m
//  MacPass
//
//  Created by Michael Starke on 09.06.13.
//  Copyright (c) 2013 HicknHack Software GmbH. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "MPEntryTableDataSource.h"
#import "MPEntryViewController.h"

#import "KPKEntry.h"
#import "NSUUID+KeePassKit.h"

@interface MPEntryTableDataSource ()

@end

@implementation MPEntryTableDataSource

- (BOOL)tableView:(NSTableView *)tableView writeRowsWithIndexes:(NSIndexSet *)rowIndexes toPasteboard:(NSPasteboard *)pboard {
  
  if([rowIndexes count] != 1) {
    return NO; // No valid drag
  }
  
  id item = [self.viewController.entryArrayController arrangedObjects][[rowIndexes firstIndex]];
  if(![item isKindOfClass:[KPKEntry class]]) {
    return NO;
  }
  KPKEntry *draggedEntry = (KPKEntry *)item;
  [pboard writeObjects:@[draggedEntry]];
  return YES;
}

@end
