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
    
    var name : String
    var type : RoboType = RoboType.Robot{
        didSet(newType){
            self.avatar = nil
        }
    }
    var avatar : UIImage?
    
    init(name: String, type: RoboType)
    {
        self.name = name
        self.type = type
    }
    
    
    
}
