//
//  RobotViewController.swift
//  RoboMonster
//
//  Created by Platon on 07.09.2022.
//

import UIKit

class RobotViewController: UIViewController {

    var robot : Robot?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        updateRobot()
        
        // Do any additional setup after loading the view.
        updateInterface()
    }
    
    func updateRobot()
    {
        if let robot = robot {
            if robot.avatar == nil
            {
                activityIndicator.startAnimating()
                Task{
                    let image = try await Communication.loadImage(robot: robot)
                    robot.avatar = image
                    activityIndicator.stopAnimating()
                    updateInterface()
                }
            }
        }
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
            
            let typeButton = self.view.viewWithTag(4) as! UIButton
            typeButton.setTitle(robot.type.description, for: .normal)
            
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
    
    @IBAction func typeByttonPush(_ sender: Any) {
        
        let alert = UIAlertController(title: "Monster Type", message: "Please Select a Type", preferredStyle: .actionSheet)
           
           alert.addAction(UIAlertAction(title: "Robot", style: .default , handler:{ (UIAlertAction)in
               if let robot = self.robot {
                   robot.type = .Robot
                   self.updateRobot()
               }
               
               print("User click Robot button")
           }))
           
           alert.addAction(UIAlertAction(title: "Monster", style: .default , handler:{ (UIAlertAction)in
               
               if let robot = self.robot {
                   robot.type = .Monster
                   self.updateRobot()
               }
               
               print("User click Monster button")
           }))

           alert.addAction(UIAlertAction(title: "Face", style: .default , handler:{ (UIAlertAction)in
               
               if let robot = self.robot {
                   robot.type = .Face
                   self.updateRobot()
               }
               
               print("User click Face button")
           }))
           
           alert.addAction(UIAlertAction(title: "Kitty", style: .default, handler:{ (UIAlertAction)in
               
               if let robot = self.robot {
                   robot.type = .Kitten
                   self.updateRobot()
               }
               
               print("User click Kitty button")
           }))
        
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))

           
           //uncomment for iPad Support
            alert.popoverPresentationController?.sourceView = sender as? UIView

           self.present(alert, animated: true, completion: {
               print("completion block")
           })
        
    }
    
}
