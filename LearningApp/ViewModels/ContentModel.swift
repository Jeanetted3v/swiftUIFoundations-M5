//
//  ContentModel.swift
//  LearningApp
//
//  Created by Zhao Qianyu on 29/9/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    //initialize the array into an empty array of Modules
    @Published var modules = [Module]()
    var styleData:Data?
    
    //init method, declare a method getLocalData
    init() {
        getLocalData()
    }
    
    //call that function getLocalData, to parse the local JSON file
    func getLocalData() {
        
        //Get a url to the JSON file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonURL!)
            
            //Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            print("cannot parse in modole data")
        }
        
        
        //Parse the style data
        
        //Get url to the html file
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        //Read the file into a data object
        do {
            let styleData = try Data(contentsOf: styleURL!)
            self.styleData = styleData
            
        }
        catch {
            //log error
            print("cannot parse in modole data")
        }
    }
    
}
