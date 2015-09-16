//
//  CDWeatherResp.swift
//  
//
//  Created by Sahil Shah on 15/09/2015.
//
//

import Foundation
import CoreData
import ObjectMapper
import AlamofireObjectMapper


class CDWeatherResp: NSManagedObject {

    @NSManaged var cdLocation: String?
    @NSManaged var locForecast: NSOrderedSet?
    
 /*   override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: nil)
    }
    
    required init?(_ map: Map) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entity = NSEntityDescription.entityForName("CDWeatherResp", inManagedObjectContext: context)
        super.init(entity: entity!, insertIntoManagedObjectContext: context)
        
        mapping(map)
    }
    
    func mapping(map: Map)
    {
        cdLocation <- map["location"]
        locForecast <- map["three_day_forecast"]
    }
 */

}
