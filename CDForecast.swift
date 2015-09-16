//
//  CDForecast.swift
//  
//
//  Created by Sahil Shah on 15/09/2015.
//
//

import Foundation
import CoreData


class CDForecast: NSManagedObject {

    @NSManaged var day: String?
    @NSManaged var temperature: NSNumber?
    @NSManaged var conditions: String?
    @NSManaged var forecastLocation: NSManagedObject?
}
