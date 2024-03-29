//
//  Robot.swift
//  RoboMonster
//
//  Created by Platon on 07.09.2022.
//

import Foundation
import UIKit

class Robot
{
    public enum RoboType
    {
        case Robot, Monster, Kitten, Face
        var description : String {
          switch self {
          // Use Internationalization, as appropriate.
          case .Robot: return "Robot"
          case .Monster: return "Monster"
          case .Kitten: return "Kitten"
          case .Face: return "Face"
          }
        }
    }
    
    let name : String
    let type : RoboType
    let avatar : UIImage?
    
    init(name: String, type: RoboType, avatar: UIImage? = nil) {
        self.name = name
        self.type = type
        self.avatar = avatar
    }
    
    
    func copy(name: String? = nil, 
              type: RoboType? = nil,
              avatar: UIImage? = nil) -> Robot
    {
        return Robot(
            name: name ?? self.name,
            type: type ?? self.type,
            avatar: avatar ?? self.avatar
        )
    }
    
}
