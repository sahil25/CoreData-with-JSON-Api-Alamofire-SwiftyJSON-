//
//  ViewController.swift
//  CP4a
//
//  Created by Sahil Shah on 15/09/2015.
//  Copyright © 2015 Sahil Shah. All rights reserved.
//

import UIKit

import ObjectMapper
import AlamofireObjectMapper
import Alamofire
import CoreData
import SwiftyJSON



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultsController: NSFetchedResultsController!
    
    //CoreData
    var cdString: NSString?
    var forecastItems = [CDForecast]()
    
    
    //Non Core Data
    var stringLocation: String?
    var arrayOfForecasts = [Forecast]()
    var arrayOfLocations = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Core Data
        let fetchRequest = NSFetchRequest(entityName: "CDWeatherResp")
        let sortDescriptor = NSSortDescriptor(key: "cdLocation", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do
        {
            try fetchedResultsController.performFetch()
        } catch
        {
            print("error")
        }
        
     //   loadGit()
        loadCD()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
        
        // return arrayOfForecasts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        configureCell(cell, indexPath: indexPath)
        
   /*     // ObjectMapper TableView
        //let location = stringLocation
        let forecast = arrayOfForecasts[indexPath.row]
        //cell.locationLabel?.text = location
        cell.locationLabel?.text = forecast.day
        cell.tempLabel?.text = "\(forecast.temperature)"
        cell.condLabel?.text = forecast.conditions  */
        
        return cell
    }

    func configureCell(cell: TableViewCell, indexPath: NSIndexPath)
    {
        let weatherResp = fetchedResultsController.objectAtIndexPath(indexPath) as! CDWeatherResp
        cell.locationLabel?.text = weatherResp.cdLocation
        
        let forecast = weatherResp.locForecast[indexPath] as! CDForecast
        cell.tempLabel?.text = forecast.day
        
    }
    
    func loadCD()
    {
        let entity = NSEntityDescription.entityForName("CDWeatherResp", inManagedObjectContext: managedContext)
        let weatherResp = CDWeatherResp(entity: entity!, insertIntoManagedObjectContext: managedContext)

        let forecastEntity = NSEntityDescription.entityForName("CDForecast", inManagedObjectContext: managedContext)
        let forecast = CDForecast(entity: forecastEntity!, insertIntoManagedObjectContext: managedContext)
        
        var locSet: NSMutableOrderedSet = []
        
        
        let url = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/f583be1121dbc5e9b0381b3017718a70c31054f7/sample_json"
        Alamofire.request(.GET, url).response { request, response, result, error in
            let json = JSON(data: result!)
            
           let threeDay = json["three_day_forecast"].arrayValue as [JSON]
           for object in threeDay
           {
              let day = object["day"].string
              forecast.day = day
            
              locSet.addObject(forecast)
              //print(locSet)
            
            }
            
            weatherResp.locForecast = locSet
            
            let location = json["location"].string
            weatherResp.cdLocation = location
            
            self.tableView.reloadData()
            do
            {
                try! self.managedContext.save()

            }
        }
    }
    
/*    func loadGit()
    {
        let url = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/f583be1121dbc5e9b0381b3017718a70c31054f7/sample_json"
        Alamofire.request(.GET, url).responseObject{(response: WeatherResponse?, error: ErrorType?) in
            let stringLoc = response?.stringLocation
            self.stringLocation = stringLoc
            
            let forecastArray = response?.threeDayForecast
            self.arrayOfForecasts = forecastArray!
            
            self.tableView.reloadData()
        }
    }
*/
    
    
    /*
    
    Alamofire.request(.GET, url).responseObject{(response: CDWeatherResp?, error: ErrorType?) in
    let stringLoc = response?.cdLocation
    self.stringLocation = stringLoc
    
    let forecastArray = response?.locForecast
    self.forecastItems = forecastArray!
    
    self.tableView.reloadData()
    }


*/

}

