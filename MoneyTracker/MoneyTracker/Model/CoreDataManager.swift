//
//  CoreDataManager.swift
//  MoneyTracker
//
//  Created by Apple on 11/17/20.
//  Copyright © 2020 milic. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init (){}
    
    //MARK:IncomeCostType
    
    func insertIncomeCostType(name:String, isCostType:Bool){
        let incomeCostType = IncomeCostType(context: persistentContainer.viewContext)
        
        incomeCostType.name = name
        incomeCostType.isCostType = isCostType
        
        saveContext()
    }
    
    func fetchIncomeCostType(isCost:Bool) -> [IncomeCostType]? {
        let fetchRequest = NSFetchRequest<IncomeCostType>(entityName: "IncomeCostType")
        
        let predicate = NSPredicate(format: "isCostType == %@", argumentArray: [NSNumber(value: isCost)])
        fetchRequest.predicate = predicate
        
        do{
            let result = try persistentContainer.viewContext.fetch(fetchRequest)
            return result
        }catch{
            print("Could not fetch")
            return nil
        }
    }
    
    func deleteIncomeCostType(_ type:IncomeCostType){
        persistentContainer.viewContext.delete(type)
        saveContext()
    }
    
    //MARK:MoneyTracker
    
    func insertMoneyTracker(name:String,amount:Double,type:IncomeCostType){
        
        let moneyTracker = MoneyTracker(context: persistentContainer.viewContext)
        
        moneyTracker.name = name
        moneyTracker.amount = amount
        moneyTracker.relIncomeCostType = type
        
        saveContext()
    }
    
    func fetchMoneyTrackers() -> [MoneyTracker]? {
           let fetchRequest = NSFetchRequest<MoneyTracker>(entityName: "MoneyTracker")
           
           do{
               let result = try persistentContainer.viewContext.fetch(fetchRequest)
               return result
           }catch{
               print("Could not fetch")
               return nil
           }
       }
    
    func deleteMoneyTrackerType(_ type:MoneyTracker){
        persistentContainer.viewContext.delete(type)
        saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "MoneyTracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

