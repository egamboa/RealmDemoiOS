//
//  Dog.swift
//  RealmDemo
//
//  Created by Carlos Mendez on 5/26/18.
//  Copyright © 2018 Carlos Mendez. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    
    
    static func testReal(){
    
        /// Use them like regular Swift objects
        let myDog = Dog()
        myDog.name = "Rex"
        myDog.age = 1
        print("name of dog: \(myDog.name)")
        
        
        let realm = try! Realm()
        
        let puppies = realm.objects(Dog.self).filter("age < 2")
        puppies.count
        print(puppies.count)
        
        try! realm.write {
            realm.add(myDog)
        }
        
       
        puppies.count
        print(puppies.count)

        
    }
}
