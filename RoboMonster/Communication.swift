//
//  Communication.swift
//  RoboMonster
//
//  Created by Platon on 07.09.2022.
//

import Foundation
import UIKit


extension Robot.RoboType
{
    func type2url() -> String
    {
        switch self {
        case .Robot: return ""
        case .Monster: return "?set=set2"
        case .Kitten: return "?set=set4"
        case .Face: return "?set=set3"
        }
    }
}

public class Communication
{
    
    static let session = URLSession.shared
    static func loadImage(robot: Robot) async throws -> UIImage?{
        
        let api = "https://robohash.org/"
        let endpoint = (robot.name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? robot.name) + robot.type.type2url()

        let url = URL(string: api + endpoint)
        
        let (data, _) = try await session.data(from: url!)
        let image = UIImage(data: data)
        return image

    }
    
    
}
