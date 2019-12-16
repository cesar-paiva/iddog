//
//  CoreDataService.swift
//  iddog
//
//  Created by Cesar Paiva on 12/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit
import CoreData

class CoreDataService {
    
    private var managedObjectContext : NSManagedObjectContext
    private var logins: [Login] = []

    init() {

        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        if #available(iOS 10.0, *) {
            self.managedObjectContext = delegate.persistentContainer.viewContext
        } else {
            self.managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        }

    }

    func fetchToken() -> [Login] {
        let fetchRequest: NSFetchRequest<Login> = Login.fetchRequest()
        do {
            logins = try managedObjectContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        
        return logins
    }
    
    func save(token: String) {
        
        let newLogin = NSEntityDescription.insertNewObject(forEntityName: "Login", into: managedObjectContext) as? Login
        newLogin?.token = token
        
        do {
            try managedObjectContext.save()
        } catch {
            fatalError("error saving data")
        }

    }

}

