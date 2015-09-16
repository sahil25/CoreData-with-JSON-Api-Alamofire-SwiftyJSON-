//
//  CDWeatherResp.swift
//  
//
//  Created by Sahil Shah on 15/09/2015.
//
//

import Foundation
import CoreData


class CDWeatherResp: NSManagedObject {

    @NSManaged var cdlocation: String?
    @NSManaged var locForecast: NSOrderedSet?

}
