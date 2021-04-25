//
//  Joke+CoreDataProperties.swift
//  DadJokes
//
//  Created by Gayeong on 2021/03/29.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var setup: String//?
    @NSManaged public var punchline: String//?
    @NSManaged public var rating: String//?

}
/*
 // 정체불명
extension Joke : Identifiable {

}
*/
