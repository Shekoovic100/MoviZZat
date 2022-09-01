//
//  CoreDataStack.swift
//  MoviZZat
//
//  Created by sherif on 23/08/2022.
//

import UIKit
import CoreData

class CoreDataStack {
    
    static let Shared = CoreDataStack()    // singleton

    private init (){
        context = appDelegate.persistentContainer.viewContext
    }

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    let userEntityName = "MovieList"

    enum myKeys : String,CodingKey {
        case image = "movieImage"
        case name = "movieName"
    }
    
    
    
    func SaveToWishListMovie(favouriteMovies:Results) {
        
      
        guard let viewContext = context else {return}
        guard let entity = NSEntityDescription.entity(forEntityName: userEntityName,in: viewContext) else { return }
       
        let saveMovie = NSManagedObject(entity: entity,insertInto: viewContext)
        saveMovie.setValue(favouriteMovies.posterPath , forKey: myKeys.image.rawValue)
        saveMovie.setValue(favouriteMovies.title, forKey: myKeys.name.rawValue)
        appDelegate.saveContext()
        do {
          try viewContext.save()
         } catch {
          print("Error saving")
        }
    }
    
    

    func getSavedProducts()->[NSManagedObject]{

        var arr = [NSManagedObject]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: userEntityName)
        do {
           arr = try context!.fetch(fetchRequest)
    
        } catch let error {
            print(error.localizedDescription)
        }
        return arr

    }
    
    
    
    func delete(){
        
        guard let viewContext = context else {return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: userEntityName)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    viewContext.delete(managedObjectData)
                }
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }
    
    
    
    
  
    
    
}
