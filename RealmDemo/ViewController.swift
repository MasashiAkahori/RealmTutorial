//
//  ViewController.swift
//  RealmDemo
//
//  Created by 赤堀雅司 on 28/1/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
  
  let realm = try! Realm()
 
  override func viewDidLoad() {
    super.viewDidLoad()
    realm.beginWrite()
    realm.delete(realm.objects(Person.self))
    try! realm.commitWrite()
    
    save()
    render()
  }
  func render() {
    let people = realm.objects(Person.self)
    for person in people {
      let firstName = person.firstName
      let lastName = person.lastName
      let fullName = "\(firstName) \(lastName)"
      
      let label = UILabel(frame: view.bounds)
      label.text = fullName
      label.textAlignment = .center
      label.numberOfLines = 0
      label.addSubview(label)
      label.font = UIFont(name: "Helvetica", size: 42)
      
    }
  }
  

  func save() {
    let Gronkowski = Person()
    Gronkowski.firstName = "Rob"
    Gronkowski.lastName = "Gronkowski"
   
    realm.beginWrite()
    realm.add(Gronkowski)
    try! realm.commitWrite()
  }
}

class Person: Object {
  @objc dynamic var firstName: String = ""
  @objc dynamic var lastName: String = ""
  @objc dynamic var age: Int = 0
}
