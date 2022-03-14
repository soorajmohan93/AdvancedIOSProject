//
//  ViewController.swift
//  VehiclesApp
//
//  Created by Sooraj Mohan on 2022-03-12.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchMake()
        
        DispatchQueue.main.async {
            //concurrency using async
            for _ in 0...10000000{
            continue
            }
            self.fetchModel()
        }
        
        DispatchQueue.main.async {
            //concurrency using async
            for _ in 0...20000000{
            continue
            }
            self.fetchSpecs()
        }
        
        
    }
    
    func fetchMake(){
        print("---------------- PRINTING ALL MAKES --------------------------")
        var components = URLComponents()
        components.scheme = "https"
        components.host = "vpic.nhtsa.dot.gov"
        components.path = "/api/vehicles/getallmakes"
        components.queryItems = [ URLQueryItem(name: "format", value: "json")]
        print("API URL: \(components.url!)")
        let request = URLRequest(url: components.url!)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in

            if let jsonData = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let e {
                    print("problem serializing JSON data \(e)")
                }

            } else if let error = error{
                print("something went wrong \(error)")
            } else {
                print("something went really wrong")
            }
        }

        task.resume()
        
    }
    
    func fetchModel(){
        print("------ PRINTING ALL MODELS FOR ASTON MARTIN ---------------")
        var components = URLComponents()
        components.scheme = "https"
        components.host = "vpic.nhtsa.dot.gov"
        components.path = "/api/vehicles/getmodelsformake/Aston Martin"
        components.queryItems = [ URLQueryItem(name: "format", value: "json")]
        print("API URL: \(components.url!)")
        let request = URLRequest(url: components.url!)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in

            if let jsonData = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let e {
                    print("problem serializing JSON data \(e)")
                }

            } else if let error = error{
                print("something went wrong \(error)")
            } else {
                print("something went really wrong")
            }
        }

        task.resume()
        
    }
    
    func fetchSpecs(){
        print("------ PRINTING ALL SPECS FOR DODGE CHALLENGER 2020 ---------------")
        var components = URLComponents()
        components.scheme = "https"
        components.host = "vpic.nhtsa.dot.gov"
        components.path = "/api/vehicles/GetCanadianVehicleSpecifications/"
        let queryItemYear = URLQueryItem(name: "Year", value: "2020")
        let queryItemMake = URLQueryItem(name: "Make", value: "Dodge")
        let queryItemModel = URLQueryItem(name: "Model", value: "Challenger")
        let queryItemUnits = URLQueryItem(name: "units", value: "Metric")
        let queryItemFormat = URLQueryItem(name: "format", value: "json")
        components.queryItems = [ queryItemYear, queryItemMake, queryItemModel, queryItemUnits, queryItemFormat]
        print("API URL: \(components.url!)")
        let request = URLRequest(url: components.url!)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in

            if let jsonData = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let e {
                    print("problem serializing JSON data \(e)")
                }

            } else if let error = error{
                print("something went wrong \(error)")
            } else {
                print("something went really wrong")
            }
        }

        task.resume()
        
    }

}

