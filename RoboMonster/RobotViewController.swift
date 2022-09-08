//
//  RobotViewController.swift
//  RoboMonster
//
//  Created by Platon on 07.09.2022.
//

import UIKit

class RobotViewController: UIViewController {

    var robot : Robot?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let robot = robot {
            if robot.avatar == nil
            {
                Task{
                    let image = try await Communication.loadImage(robot: robot)
                    robot.avatar = image
                    updateInterface()
                }
            }
        }
        
        // Do any additional setup after loading the view.
        updateInterface()
    }
    
    
    
    func updateInterface()
    {
        if let robot = robot
        {
            let imView = self.view.viewWithTag(1) as! UIImageView
            imView.image = robot.avatar
            
            let nameLabel = self.view.viewWithTag(2) as! UILabel
            nameLabel.text = robot.name
            
            let sizeLabel = self.view.viewWithTag(3) as! UILabel
            sizeLabel.text = robot.avatar?.size.debugDescription
            
            let typeLabel = self.view.viewWithTag(4) as! UILabel
            typeLabel.text = robot.type.description
            
        }
    }
    
    @IBAction func shareButtonPush(_ sender: Any) {
        
        if let avatar = robot?.avatar
        {
            
            let shareController = UIActivityViewController.init(activityItems: [ (avatar)], applicationActivities:[])
            shareController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
            
            self .present(shareController, animated: true)
        }
        
    }
    

}
