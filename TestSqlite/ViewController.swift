//
//  ViewController.swift
//  TestSqlite
//
//  Created by Sadiq on 17/06/15.
//  Copyright (c) 2015 Xstpl. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var names = ["John","Mark","Jay"]
    override func viewDidLoad() {
        super.viewDidLoad()
        insertdata()
        getData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func insertdata(){
        var appdel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        for name in names {
            var person: Person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: appdel.managedObjectContext!) as! Person
          person.name = name
        }
        appdel.saveContext()
    }
    
    func getData(){
        
        var fetch = NSFetchRequest(entityName: "Person")
        var appdel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var persons  =  appdel.managedObjectContext?.executeFetchRequest(fetch, error: nil) as! [Person]
        for person in persons {
            println(person.name)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

