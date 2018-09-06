//
//  XXDB.swift
//  GRDBDemo
//
//  Created by Rdxer on 2017/12/23.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import GRDB

/// A type responsible for initializing the application database.
///
/// See AppDelegate.setupDatabase()
open class GRDBEx {
    
    /// Creates a fully initialized database at path
    public static func openDatabase(atPath path: String,migrator:DatabaseMigrator) throws -> DatabaseQueue {
        // Connect to the database
        // See https://github.com/groue/GRDB.swift/#database-connections
        let dbQueue = try DatabaseQueue(path: path)
        
        // Use DatabaseMigrator to define the database schema
        // See https://github.com/groue/GRDB.swift/#migrations
        try migrator.migrate(dbQueue)
        
        return dbQueue
    }
    
    /// The DatabaseMigrator that defines the database schema.
    ///
    /// This migrator is exposed so that migrations can be tested.
    // See https://github.com/groue/GRDB.swift/#migrations
//    static var migrator: DatabaseMigrator {
//        var migrator = DatabaseMigrator()
//
//        migrator.registerMigration("createPersons") { db in
//            // Create a table
//            // See https://github.com/groue/GRDB.swift#create-tables
//            try db.create(table: "persons") { t in
//                // An integer primary key auto-generates unique IDs
//                t.column("id", .integer).primaryKey()
//
//                // Sort person names in a localized case insensitive fashion by default
//                // See https://github.com/groue/GRDB.swift/#unicode
//                t.column("name", .text).notNull().collate(.localizedCaseInsensitiveCompare)
//
//                t.column("score", .integer).notNull()
//            }
//        }
//
//        migrator.registerMigration("fixtures") { db in
//            // Populate the persons table with random data
//            for _ in 0..<8 {
//                try Person(name: Person.randomName(), score: Person.randomScore()).insert(db)
//            }
//        }
//
//        //        // Migrations for future application versions will be inserted here:
//        //        migrator.registerMigration(...) { db in
//        //            ...
//        //        }
//
//        return migrator
//    }
}


