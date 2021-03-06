//
//  BeeCouchTest.m
//  Worker Bee
//
//  Created by Jens Alfke on 10/5/11.
//  Copyright (c) 2011 Couchbase, Inc. All rights reserved.
//

#import "BeeCouchTest.h"
#import "AppDelegate.h"


@implementation BeeCouchTest
{
    CBLManager* _manager;
    CBLDatabase* _database;
    BOOL _createdDatabase;
}


+ (BOOL) isAbstractTest {
    return self == [BeeCouchTest class];
}


- (NSString*) databaseName {
    return [[[[self class] testName] lowercaseString] stringByAppendingString: @"-db"];
}


- (CBLManager*) manager {
    if (!_manager) {
        _manager = [[CBLManager alloc] init];
    }
    return _manager;
}


- (CBLDatabase*) database {
    if (!_createdDatabase) {
        _createdDatabase = YES;
        NSError* error = nil;
        CBLDatabase* database = [self.manager existingDatabaseNamed: self.databaseName error: NULL];
        if (database) {
            [database deleteDatabase: &error];
        }
        _database = [_manager databaseNamed: self.databaseName error: &error];
    }
    return _database;
}


- (void) deleteDatabase {
    if (!_createdDatabase)
        return;
    CBLDatabase* database = [self.manager existingDatabaseNamed: self.databaseName error: NULL];
    if (database) {
        NSError* error = nil;
        if (![database deleteDatabase: &error])
            [self logFormat: @"WARNING: Couldn't delete database: %@", error];
    }
}


- (void) setUp {
    [super setUp];
    
    _createdDatabase = NO;
}

- (void) tearDown {
    _database = nil;
    _manager = nil;

    [super tearDown];
}


@end
