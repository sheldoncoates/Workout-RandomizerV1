//
//  IntervalViewController.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-04.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

class IntervalViewController: UIViewController {
    //view
    @IBOutlet weak var intervalPopupView: DesignableView!
    //button
    @IBOutlet weak var startBtn: AppButton!
    //stepper
    @IBOutlet weak var intervalStepper: UIStepper!
    //labels
    @IBOutlet weak var timePerExerciseLabel: ShadowLabel!
    @IBOutlet weak var selectTimePerExerciseLabel: ShadowLabel!
    //vars
    var chestExercises: [String] = []
    var tricepExercises: [String] = []
    var backExercises: [String] = []
    var bicepExercises: [String] = []
    var legExercises: [String] = []
    var shoulderExercises: [String] = []
    var abdomenExercises: [String] = []
    var timePerExercise: Double = 0
    var isPressed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
        // Do any additional setup after loading the view.
        //intial label alphs
        timePerExerciseLabel.alpha = CGFloat(0.25)
        //stepper properties
        intervalStepper.stepValue = 5.0
        intervalStepper.value = 25
        intervalStepper.maximumValue = 400
        intervalStepper.tintColor = UIColor.white
        intervalStepper.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.3)
        //pop up border stuff
        intervalPopupView.layer.borderWidth = 1.0
        intervalPopupView.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        intervalPopupView.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0.6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //dismisses interval popup
    @IBAction func dismissPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    //segues to interval display
    @IBAction func startButtonPressed(_ sender: Any) {
        if intervalStepper.value == 0 || isPressed == false{
            selectTimePerExerciseLabel.text = "Select time per exercise!"
        }else{
            performSegue(withIdentifier: "startInterval", sender: nil)
        }
    }
    //prepares stuff before segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : StartIntervalViewController = segue.destination as! StartIntervalViewController
        DestViewController.chestExercises = chestExercises
        DestViewController.tricepExercises = tricepExercises
        DestViewController.backExercises = backExercises
        DestViewController.bicepExercises = bicepExercises
        DestViewController.legExercises = legExercises
        DestViewController.shoulderExercises = shoulderExercises
        DestViewController.abdomenExercises = abdomenExercises
        DestViewController.timePerExercise = timePerExercise
    }
    //stepper function
    @IBAction func intervalStepperPressed(_ sender: UIStepper) {
        timePerExerciseLabel.alpha = CGFloat(1.0)
        isPressed = true
        timePerExercise = intervalStepper.value
        if sender.value < 60 {
            timePerExerciseLabel.text = "\(Int(sender.value))s"
        }
        if sender.value >= 60 {
            timePerExerciseLabel.text = "1m \(Int(sender.value) - 60)s"
        }
        if sender.value >= 120 {
            timePerExerciseLabel.text = "2m \(Int(sender.value) - 120)s"
        }
        if sender.value >= 180 {
            timePerExerciseLabel.text = "3m \(Int(sender.value) - 180)s"
        }
        if sender.value >= 240 {
            timePerExerciseLabel.text = "4m \(Int(sender.value) - 240)s"
        }
        if sender.value >= 300 {
            timePerExerciseLabel.text = "5m \(Int(sender.value) - 300)s"
        }
        if sender.value >= 360 {
            timePerExerciseLabel.text = "6m \(Int(sender.value) - 360)s"
        }
    }
    //lays out the subviews to work on different screen sizes
    func layoutSubviews(){
         let YConstraintStartBtn = NSLayoutConstraint(item: startBtn, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: intervalPopupView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -self.intervalPopupView.frame.size.height/12)
        view.addConstraints([YConstraintStartBtn])
        let YConstraintTimePerExerciseLabel = NSLayoutConstraint(item: timePerExerciseLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: intervalPopupView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: self.intervalPopupView.frame.size.height/3.5)
        let YConstraintSelectTimePerExerciseLabel = NSLayoutConstraint(item: selectTimePerExerciseLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: intervalPopupView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: self.intervalPopupView.frame.size.height/10)
        view.addConstraints([YConstraintTimePerExerciseLabel,YConstraintSelectTimePerExerciseLabel])
        let YConstraintIntervalStepper = NSLayoutConstraint(item: intervalStepper, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: intervalPopupView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: self.intervalPopupView.frame.size.height/2)
        view.addConstraints([YConstraintIntervalStepper])
    }
}
