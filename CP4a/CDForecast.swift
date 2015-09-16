//
//  CDForecast.swift
//  
//
//  Created by Sahil Shah on 15/09/2015.
//
//

import Foundation
import CoreData
import ObjectMapper
import AlamofireObjectMapper

class CDForecast: NSManagedObject {

    @NSManaged var day: String?
    @NSManaged var temperature: NSNumber?
    @NSManaged var conditions: String?
    @NSManaged var forecastLocation: NSManagedObject?
    
/*    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: nil)
    }
    
    required init?(_ map: Map) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entity = NSEntityDescription.entityForName("CDForecast", inManagedObjectContext: context)
        super.init(entity: entity!, insertIntoManagedObjectContext: context)
        
        mapping(map)
    }
    
    func mapping(map: Map)
    {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
*/

}
