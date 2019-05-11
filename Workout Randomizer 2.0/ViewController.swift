//
//  ViewController.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-04.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //vars
    var chest: Bool = false
    var tricep: Bool = false
    var back: Bool = false
    var bicep: Bool = false
    var leg: Bool = false
    var shoulder: Bool = false
    var abdomen: Bool = false
    var exercises: Double = 0
    var numberOfMuscleGroups = 0
    //labels
    @IBOutlet weak var selectMuscleGroupLbl: ShadowLabel!
    @IBOutlet weak var selectNumberOfExercisesLbl: ShadowLabel!
    @IBOutlet weak var numberOfExercisesLbl: ShadowLabel!
    @IBOutlet weak var specialConditionLbl: ShadowLabel!
    //buttons
    @IBOutlet weak var chestBtn: AppButton!
    @IBOutlet weak var tricepBtn: AppButton!
    @IBOutlet weak var backBtn: AppButton!
    @IBOutlet weak var bicepBtn: AppButton!
    @IBOutlet weak var legBtn: AppButton!
    @IBOutlet weak var shoulderBtn: AppButton!
    @IBOutlet weak var abdomenBtn: AppButton!
    @IBOutlet weak var randomizeBtn: AppButton!
    //stepper
    @IBOutlet weak var exerciseStepper: UIStepper!
    @IBAction func exerciseStepperPressed(_ sender: UIStepper) {
        if abdomen == true {
            exerciseStepper.maximumValue =  5
        }
        if tricep ==  true || back == true || bicep == true || shoulder == true{
            exerciseStepper.maximumValue = 6
        }
        if chest == true {
            exerciseStepper.maximumValue = 7
        }
        if leg == true {
            exerciseStepper.maximumValue = 8
        }
        
        numberOfExercisesLbl.alpha = CGFloat(1.0)
        numberOfExercisesLbl.text = String(sender.value)
        exercises = exerciseStepper.value
    }
    //button actions
    @IBAction func chestButtonPressed(_ sender: Any) {
        if chest == false {
            chest = true
            chestBtn.setTitle("Chest ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            chest = false
            chestBtn.setTitle("Chest", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func tricepButtonPressed(_ sender: Any) {
        if tricep == false {
            tricep = true
            tricepBtn.setTitle("Tricep ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            tricep = false
            tricepBtn.setTitle("Tricep", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        if back == false {
            back = true
            backBtn.setTitle("Back ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            back = false
            backBtn.setTitle("Back", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func bicepButtonPressed(_ sender: Any) {
        if bicep == false {
            bicep = true
            bicepBtn.setTitle("Bicep ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            bicep = false
            bicepBtn.setTitle("Bicep", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func legButtonPressed(_ sender: Any) {
        if leg == false {
            leg = true
            legBtn.setTitle("Legs ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            leg = false
            legBtn.setTitle("Legs", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func shoulderButtonPressed(_ sender: Any) {
        if shoulder == false {
            shoulder = true
            shoulderBtn.setTitle("Shoulders ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            shoulder = false
            shoulderBtn.setTitle("Shoulders", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func abdomenButtonPressed(_ sender: Any) {
        if abdomen == false {
            abdomen = true
            abdomenBtn.setTitle("Abdomen ☑️", for: .normal)
            numberOfMuscleGroups += 1
        }else{
            abdomen = false
            abdomenBtn.setTitle("Abdomen", for: .normal)
            numberOfMuscleGroups -= 1
        }
    }
    @IBAction func randomizeButtonPressed(_ sender: Any) {
        //special condition... reminds user to choose a muscle group
        if bicep ==  false && chest == false && leg == false && tricep == false && back == false && shoulder == false && abdomen == false{
            specialConditionLbl.isHidden = false
            specialConditionLbl.text = "What muscle group do you want to work out?"
        }
        //special condition... reminds user to choose number of exercises
        if exercises == 0 {
            specialConditionLbl.isHidden = false
            specialConditionLbl.text = "How many exercises do you want to do?"
        }
        //allows segue to happen
        if bicep ==  true && exercises > 0 || chest == true && exercises > 0 || leg == true && exercises > 0 || tricep == true && exercises > 0 || back == true && exercises > 0 || shoulder == true && exercises > 0 || abdomen == true && exercises > 0{
            performSegue(withIdentifier: "transitionToExercises", sender: nil)
        }
    }
    //stuff to prepare before segue to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : WorkoutsViewController = segue.destination as! WorkoutsViewController
        DestViewController.chest = chest
        DestViewController.tricep = tricep
        DestViewController.back = back
        DestViewController.bicep = bicep
        DestViewController.leg = leg
        DestViewController.shoulder = shoulder
        DestViewController.abdomen = abdomen
        DestViewController.exercises = Int(exercises)
        DestViewController.numberOfMuscleGroups = numberOfMuscleGroups
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
        //to make label infinite number of lines
        specialConditionLbl.numberOfLines = 0
        specialConditionLbl.lineBreakMode = .byWordWrapping
        specialConditionLbl.sizeToFit()
        // Do any additional setup after loading the view, typically from a nib.
        //background image for opening page
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        view.addSubview(imageView)
        imageView.center.x = self.view.center.x
        imageView.center.y = self.view.center.y
        imageView.image = UIImage(named: "gym.jpg")
        imageView.layer.zPosition = -1
        //sets the initial alpha of the label
        numberOfExercisesLbl.alpha = CGFloat(0.25)
        //hides special condition label
        specialConditionLbl.isHidden = true
        //stepper visuals
        exerciseStepper.tintColor = UIColor.white
        exerciseStepper.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //lays out the subviews to work on different screen sizes
    func layoutSubviews(){
        //constraints for chestbtn position
        let XConstraintChestBtn = NSLayoutConstraint(item: chestBtn ?? "", attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: self.view.frame.size.width/12)
        let YConstraintChestBtn = NSLayoutConstraint(item: chestBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/6)
        //constraints for tricpbtn position
        let XConstraintTricepBtn = NSLayoutConstraint(item: tricepBtn ?? "", attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -self.view.frame.size.width/12)
        let YConstraintTricepBtn = NSLayoutConstraint(item: tricepBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/6)
        //constraints for backbtn position
        let XConstraintBackBtn = NSLayoutConstraint(item: backBtn ?? "", attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: self.view.frame.size.width/12)
        let YConstraintBackBtn = NSLayoutConstraint(item: backBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/3.5)
        //constraints for bicepbtn position
        let XConstraintBicepbtn = NSLayoutConstraint(item: bicepBtn ?? "", attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -self.view.frame.size.width/12)
        let YConstraintBicepBtn = NSLayoutConstraint(item: bicepBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/3.5)
        //constraints for legbtn position
        let XConstraintLegBtn = NSLayoutConstraint(item: legBtn ?? "", attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: self.view.frame.size.width/12)
        let YConstraintLegBtn = NSLayoutConstraint(item: legBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/2.5)
        //constraints for shoulderbtn position
        let XConstraintShoulderBtn = NSLayoutConstraint(item: shoulderBtn ?? "", attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -self.view.frame.size.width/12)
        let YConstraintShoulderBtn = NSLayoutConstraint(item: shoulderBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/2.5)
        //constraints for abdomenbtn position
        let YConstraintAbdomanBtn = NSLayoutConstraint(item: abdomenBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/1.9)
        //constraints for randomizebtn position
        let YConstraintRandomizeBtn = NSLayoutConstraint(item: randomizeBtn ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/1.15)
        //adding button contraints to view
        view.addConstraints([XConstraintChestBtn,YConstraintChestBtn,XConstraintTricepBtn,YConstraintTricepBtn,XConstraintBackBtn,YConstraintBackBtn,XConstraintBicepbtn,YConstraintBicepBtn,XConstraintLegBtn,YConstraintLegBtn,XConstraintShoulderBtn,YConstraintShoulderBtn,YConstraintAbdomanBtn,YConstraintRandomizeBtn])
        //constraints for select muscle group label
        let YConstraintSelectMuscleGroupLbl = NSLayoutConstraint(item: selectMuscleGroupLbl ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/14)
        //constraints for select number of exercises label
        let YConstraintSelectNumberOfExercisesLbl = NSLayoutConstraint(item: selectNumberOfExercisesLbl ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/1.6)
        //constraints for number of exercises label
        let XConstraintNumberOfExercisesLbl = NSLayoutConstraint(item: numberOfExercisesLbl ?? "", attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: self.view.frame.size.width/6)
        let YConstraintNumberOfExercisesLbl = NSLayoutConstraint(item: numberOfExercisesLbl ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/1.4)
        //constraints for special conditions label
        let YConstraintSpecialConditionLbl = NSLayoutConstraint(item: specialConditionLbl ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/1.25)
        //adding label constraints to view
        view.addConstraints([YConstraintSelectMuscleGroupLbl,YConstraintSelectNumberOfExercisesLbl,XConstraintNumberOfExercisesLbl,YConstraintNumberOfExercisesLbl,YConstraintSpecialConditionLbl])
        //constraints for stepper
        let XConstraintExerciseStepper = NSLayoutConstraint(item: exerciseStepper ?? "", attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -self.view.frame.size.width/6)
        let YConstraintExerciseStepper = NSLayoutConstraint(item: exerciseStepper ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/1.4)
        //adding stepper constraints to view
        view.addConstraints([XConstraintExerciseStepper,YConstraintExerciseStepper])
    }
}
