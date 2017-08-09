//
//  WorkoutsViewController.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-04.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController {
    //vars
    var chest: Bool = false
    var tricep: Bool = false
    var back: Bool = false
    var bicep: Bool = false
    var leg: Bool = false
    var shoulder: Bool = false
    var abdomen: Bool = false
    var exercises = 0
    var currYPosition = 1
    var scrollHeight: CGFloat = 0
    var numberOfMuscleGroups = 0
    var chestExercisesPassing: [String] = []
    var tricepExercisesPassing: [String] = []
    var backExercisesPassing: [String] = []
    var bicepExercisesPassing: [String] = []
    var legExercisesPassing: [String] = []
    var shoulderExercisesPassing: [String] = []
    var abdomenExercisesPassing: [String] = []
    //gif imageview
    @IBOutlet weak var exerciseGifView: UIImageView!
    //exercise arrays
    var chestExercises: [String] = ["Barbell Bench Press","Barbell Incline Press","Dumbbell Bench Press","Dumbbell Incline Press","Dumbbell Flys","Cable Crossovers","Decline Barbell Bench Press"]
    var tricepExercises: [String] = ["Close-Grip Bench Press","Tricep Pushdown","Barbell Overhead Tricep Extension","Standing Dumbbell Tricep Extension","Dumbbell Tricep Kickbacks","Machine Tricep Extension"]
    var backExercises: [String] = ["Lat Pulldown","One Arm Bent Over Rows","Barbell Rows","Pull Up","Seated Cable Rows","Deadlift"]
    var bicepExercises: [String] = ["Bicep Curls","Preacher Curls","Concentrated Curls","Cable Curls","Hammer Curls","Barbell Curls"]
     var legExercises: [String] = ["Barbell Squats","Leg Press","Leg Extensions","Dumbbell Lunges","Barbell Deadlifts","Lying Leg Curls","Seated Calf Raises","Standing Heel Raises"]
    var shoulderExercises: [String] = ["Smith Machine Shoulder Press","Front Cable Raises","Barbell Upright Row","Seated Barbell Military Press","Dumbbell Lateral Raise","Dumbbell Shoulder Press"]
    var abdomenExercises: [String] = ["Dumbbell Side Bend","Kneeling Cable Crunch","Sit Ups","Hanging Leg Lift","Twist Crunch"]
    //ScrollView
    @IBOutlet weak var exercisesScrollView: UIScrollView!
    //buttons
    @IBOutlet weak var resetBtn: AppButton!
    @IBOutlet weak var intervalButton: AppButton!
    @IBOutlet weak var backButton: AppButton!
    //Labels
    @IBOutlet weak var viewExerciseLbl: ShadowLabel!
    //actions
    @IBAction func resetButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "exercisesToHome", sender: nil)
    }
    @IBAction func intervalButtonPressed(_ sender: Any) {
        if numberOfMuscleGroups > 1 {
            viewExerciseLbl.text = "Only one muscle group for interval"
        }else{
            performSegue(withIdentifier: "exercisesToInterval", sender: nil)
        }
    }
    //stuff to prepare before segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exercisesToInterval" {
            let DestViewController : IntervalViewController = segue.destination as! IntervalViewController
            DestViewController.chestExercises = chestExercisesPassing
            DestViewController.tricepExercises = tricepExercisesPassing
            DestViewController.backExercises = backExercisesPassing
            DestViewController.bicepExercises = bicepExercisesPassing
            DestViewController.legExercises = legExercisesPassing
            DestViewController.shoulderExercises = shoulderExercisesPassing
            DestViewController.abdomenExercises = abdomenExercisesPassing
        }
        if segue.identifier == "exercisesToHome" {
            let _ : ViewController = segue.destination as! ViewController
        }
    }
    //goes back to exercise list
    @IBAction func backButtonPressed(_ sender: Any) {
        exerciseGifView.stopAnimating()
        backButton.isHidden = true
        exerciseGifView.isHidden = true
        viewExerciseLbl.text = "Click exercise to view"
        exercisesScrollView.isHidden = false
        resetBtn.isHidden = false
        intervalButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
        // Do any additional setup after loading the view.
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        view.addSubview(imageView)
        imageView.center.x = self.view.center.x
        imageView.center.y = self.view.center.y
        imageView.image = UIImage(named: "gym2.jpg")
        imageView.layer.zPosition = -1
        //initially hides back button
        backButton.isHidden = true
        exerciseGifView.isHidden = true
        //adds a random exercise to the scrollview for whichever muscle group was selected
        if chest == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    label.textAlignment = .center
                    label.text = "Chest Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 45
                    scrollHeight += 45
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(chestExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(chestExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    button.setTitle(chestExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 42
                    scrollHeight += 42
                    check += 1
                    chestExercisesPassing.append(chestExercises[randomNumber])
                }
            }
        }
        if tricep == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    label.textAlignment = .center
                    label.text = "Tricep Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 45
                    scrollHeight += 45
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(tricepExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(tricepExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    button.setTitle(tricepExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 42
                    scrollHeight += 42
                    check += 1
                    tricepExercisesPassing.append(tricepExercises[randomNumber])
                }
            }
        }
        if back == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    label.textAlignment = .center
                    label.text = "Back Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 45
                    scrollHeight += 45
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(backExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(backExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    button.setTitle(backExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 42
                    scrollHeight += 42
                    check += 1
                    backExercisesPassing.append(backExercises[randomNumber])
                }
            }
        }
        if bicep == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 30))
                    label.textAlignment = .center
                    label.text = "Biceps Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 35
                    scrollHeight += 35
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(bicepExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(bicepExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 30))
                    button.setTitle(bicepExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 31
                    scrollHeight += 31
                    check += 1
                    bicepExercisesPassing.append(bicepExercises[randomNumber])
                }
            }
        }
        if leg == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    label.textAlignment = .center
                    label.text = "Leg Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 45
                    scrollHeight += 45
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(legExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(legExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    button.setTitle(legExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 42
                    scrollHeight += 42
                    check += 1
                    legExercisesPassing.append(legExercises[randomNumber])
                }
            }
        }
        if shoulder == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    label.textAlignment = .center
                    label.text = "Shoulder Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 45
                    scrollHeight += 45
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(shoulderExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(shoulderExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    button.setTitle(shoulderExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 42
                    scrollHeight += 42
                    check += 1
                    shoulderExercisesPassing.append(shoulderExercises[randomNumber])
                }
            }
        }
        if abdomen == true{
            var check:Int = 0
            var specialCheck: Int = 0
            var numberArray: [Int] = []
            while check != exercises {
                if specialCheck == 0 {
                    currYPosition += 4
                    scrollHeight += 4
                    let label = UILabel(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    label.textAlignment = .center
                    label.text = "Abdomen Exercises"
                    label.textColor = UIColor.white
                    label.layer.backgroundColor = UIColor.black.cgColor
                    label.layer.cornerRadius = 5
                    self.exercisesScrollView.addSubview(label)
                    currYPosition += 45
                    scrollHeight += 45
                    specialCheck += 1
                }
                else{
                    var randomNumber: Int = Int(arc4random_uniform(UInt32(abdomenExercises.count)))
                    while numberArray.contains(randomNumber) {
                        randomNumber = Int(arc4random_uniform(UInt32(abdomenExercises.count)))
                    }
                    numberArray.append(randomNumber)
                    let button = AppButton(frame: CGRect(x: 0, y: currYPosition, width: Int(self.exercisesScrollView.frame.size.width), height: 40))
                    button.setTitle(abdomenExercises[randomNumber], for: .normal)
                    button.addTarget(self, action: #selector(viewExercise), for: UIControlEvents.touchUpInside)
                    self.exercisesScrollView.addSubview(button)
                    currYPosition += 42
                    scrollHeight += 42
                    check += 1
                    abdomenExercisesPassing.append(abdomenExercises[randomNumber])
                }
            }
        }
        //sets the appropriate scrollview content size for scrolling
        exercisesScrollView.contentSize = CGSize(width: self.exercisesScrollView.frame.size.width, height: scrollHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewExercise(sender: UIButton) {
        backButton.isHidden = false
        //imageview to display gifs
        exerciseGifView.isHidden = false
        exerciseGifView.contentMode = .scaleAspectFit
        exerciseGifView.layer.borderWidth = 3
        exerciseGifView.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        exerciseGifView.layer.cornerRadius = 3
        exerciseGifView.backgroundColor = UIColor.white

        //Chest workouts gif running statements
        //done
        if sender.title(for: .normal) == "Barbell Bench Press" {
            viewExerciseLbl.text = "Barbell Bench Press"
            
            let barbellBench1 = UIImage(named: "barbellBenchPress1")
            let barbellBench2 = UIImage(named: "barbellBenchPress2")
            
            let imageArray: [UIImage] = [barbellBench1!,barbellBench2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Barbell Incline Press" {
            viewExerciseLbl.text = "Barbell Incline Press"
            
            let barbellIclinePress1 = UIImage(named: "barbellIclinePress1")
            let barbellIclinePress2 = UIImage(named: "barbellIclinePress2")
            
            let imageArray: [UIImage] = [barbellIclinePress1!,barbellIclinePress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Bench Press" {
            viewExerciseLbl.text = "Dumbbell Bench Press"
            
            let dumbbellBenchPress1 = UIImage(named: "dumbbellBenchPress1")
            let dumbbellBenchPress2 = UIImage(named: "dumbbellBenchPress2")
            
            let imageArray: [UIImage] = [dumbbellBenchPress1!,dumbbellBenchPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Incline Press" {
            viewExerciseLbl.text = "Dumbbell Incline Press"
            
            let dumbbellInclinePress1 = UIImage(named: "dumbbellInclinePress1")
            let dumbbellInclinePress2 = UIImage(named: "dumbbellInclinePress2")
            
            let imageArray: [UIImage] = [dumbbellInclinePress1!,dumbbellInclinePress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Flys" {
            viewExerciseLbl.text = "Dumbbell Flyes"
            
            let dumbbellFlyes1 = UIImage(named: "dumbbellFlyes1")
            let dumbbellFlyes2 = UIImage(named: "dumbbellFlyes2")
            
            let imageArray: [UIImage] = [dumbbellFlyes1!,dumbbellFlyes2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Cable Crossovers" {
            viewExerciseLbl.text = "Cable Crossovers"
            
            let cableCrossover1 = UIImage(named: "cableCrossover1")
            let cableCrossover2 = UIImage(named: "cableCrossover2")
            
            let imageArray: [UIImage] = [cableCrossover1!,cableCrossover2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Decline Barbell Bench Press" {
            viewExerciseLbl.text = "Decline Barbell Bench Press"
            
            let declineBarbellBenchPress1 = UIImage(named: "declineBarbellBenchPress1")
            let declineBarbellBenchPress2 = UIImage(named: "declineBarbellBenchPress2")
            
            let imageArray: [UIImage] = [declineBarbellBenchPress1!,declineBarbellBenchPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        
        //Tricep workouts gif running statements
        //done
        if sender.title(for: .normal) == "Close-Grip Bench Press" {
            viewExerciseLbl.text = "Close-Grip Bench Press"
            
            let closegripBarbellBenchPress1 = UIImage(named: "closegripBarbellBenchPress1")
            let closegripBarbellBenchPress2 = UIImage(named: "closegripBarbellBenchPress2")
            
            let imageArray: [UIImage] = [closegripBarbellBenchPress1!,closegripBarbellBenchPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Tricep Pushdown" {
            viewExerciseLbl.text = "Tricep Pushdown"
            
            let tricepPushdowns1 = UIImage(named: "tricepPushdowns1")
            let tricepPushdowns2 = UIImage(named: "tricepPushdowns2")
            
            let imageArray: [UIImage] = [tricepPushdowns1!,tricepPushdowns2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Barbell Overhead Tricep Extension" {
            viewExerciseLbl.text = "Barbell Overhead Tricep Extension"
            
            let standingBarbellTricepExtension1 = UIImage(named: "standingBarbellTricepExtension1")
            let standingBarbellTricepExtension2 = UIImage(named: "standingBarbellTricepExtension2")
            
            let imageArray: [UIImage] = [standingBarbellTricepExtension1!,standingBarbellTricepExtension2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Standing Dumbbell Tricep Extension" {
            viewExerciseLbl.text = "Standing Dumbbell Tricep Extension"
            
            let standingDumbbellTricepExtensions1 = UIImage(named: "standingDumbbellTricepExtensions1")
            let standingDumbbellTricepExtensions2 = UIImage(named: "standingDumbbellTricepExtensions2")
            
            let imageArray: [UIImage] = [standingDumbbellTricepExtensions1!,standingDumbbellTricepExtensions2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Tricep Kickbacks" {
            viewExerciseLbl.text = "Dumbbell Tricep Kickbacks"
            
            let tricepKickbacks1 = UIImage(named: "tricepKickbacks1")
            let tricepKickbacks2 = UIImage(named: "tricepKickbacks2")
            
            let imageArray: [UIImage] = [tricepKickbacks1!,tricepKickbacks2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Machine Tricep Extension" {
            viewExerciseLbl.text = "Machine Tricep Extension"
            
            let machineTricepExtensions1 = UIImage(named: "machineTricepExtensions1")
            let machineTricepExtensions2 = UIImage(named: "machineTricepExtensions2")
            
            let imageArray: [UIImage] = [machineTricepExtensions1!,machineTricepExtensions2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }

        //Back workouts gif running statements
        //done
        if sender.title(for: .normal) == "Lat Pulldown" {
            viewExerciseLbl.text = "Lat Pulldown"
            
            let latPulldowns1 = UIImage(named: "latPulldowns1")
            let latPulldowns2 = UIImage(named: "latPulldowns2")
            
            let imageArray: [UIImage] = [latPulldowns1!,latPulldowns2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "One Arm Bent Over Rows" {
            viewExerciseLbl.text = "One Arm Bent Over Rows"
            
            let oneArmDumbbellBentOverRow1 = UIImage(named: "oneArmDumbbellBentOverRow1")
            let oneArmDumbbellBentOverRow2 = UIImage(named: "oneArmDumbbellBentOverRow2")
            
            let imageArray: [UIImage] = [oneArmDumbbellBentOverRow1!,oneArmDumbbellBentOverRow2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Barbell Rows" {
            viewExerciseLbl.text = "Barbell Rows"
            
            let barbellRows1 = UIImage(named: "barbellRows1")
            let barbellRows2 = UIImage(named: "barbellRows2")
            
            let imageArray: [UIImage] = [barbellRows1!,barbellRows2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Pull Up" {
            viewExerciseLbl.text = "Pull Up"
            
            let pullUp1 = UIImage(named: "pullUp1")
            let pullUp2 = UIImage(named: "pullUp2")
            
            let imageArray: [UIImage] = [pullUp1!,pullUp2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Seated Cable Rows" {
            viewExerciseLbl.text = "Seated Cable Rows"
            
            let cableRow1 = UIImage(named: "cableRow1")
            let cableRow2 = UIImage(named: "cableRow2")
            
            let imageArray: [UIImage] = [cableRow1!,cableRow2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Deadlift" {
            viewExerciseLbl.text = "Deadlift"
            
            let deadlift1 = UIImage(named: "barbellDeadlifts1")
            let deadlift2 = UIImage(named: "barbellDeadlifts2")
            
            let imageArray: [UIImage] = [deadlift1!,deadlift2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        
        //Bicep workouts gif running statements
        //done
        if sender.title(for: .normal) == "Barbell Curls" {
            viewExerciseLbl.text = "Barbell Curls"
            
            let barbellCurl1 = UIImage(named: "barbellCurl1")
            let barbellCurl2 = UIImage(named: "barbellCurl2")
            
            let imageArray: [UIImage] = [barbellCurl1!,barbellCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Bicep Curls" {
            viewExerciseLbl.text = "Bicep Curls"
            
            let bicepCurl1 = UIImage(named: "bicepCurl1")
            let bicepCurl2 = UIImage(named: "bicepCurl2")
            
            let imageArray: [UIImage] = [bicepCurl1!,bicepCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Preacher Curls" {
            viewExerciseLbl.text = "Preacher Curls"
            
            let preacherCurl1 = UIImage(named: "preacherCurl1")
            let preacherCurl2 = UIImage(named: "preacherCurl2")
            
            let imageArray: [UIImage] = [preacherCurl1!,preacherCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Concentrated Curls" {
            viewExerciseLbl.text = "Concentrated Curls"
            
            let concentratedCurl1 = UIImage(named: "concentratedCurl1")
            let concentratedCurl2 = UIImage(named: "concentratedCurl2")
            
            let imageArray: [UIImage] = [concentratedCurl1!,concentratedCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Hammer Curls" {
            viewExerciseLbl.text = "Hammer Curls"
            
            let hammerCurl1 = UIImage(named: "hammerCurl1")
            let hammerCurl2 = UIImage(named: "hammerCurl2")
            
            let imageArray: [UIImage] = [hammerCurl1!,hammerCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Cable Curls" {
            viewExerciseLbl.text = "Cable Curls"
            
            let cableCurl1 = UIImage(named: "cableCurls1")
            let cableCurl2 = UIImage(named: "cableCurls2")
            
            let imageArray: [UIImage] = [cableCurl1!,cableCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        
        //Leg Workouts gif running statements
        //done
        if sender.title(for: .normal) == "Barbell Squats" {
            viewExerciseLbl.text = "Barbell Squats"
            
            let barbellSquat1 = UIImage(named: "barbellSquat1")
            let barbellSquat2 = UIImage(named: "barbellSquat2")
            
            let imageArray: [UIImage] = [barbellSquat1!,barbellSquat2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Leg Press" {
            viewExerciseLbl.text = "Leg Press"
            
            let legPress1 = UIImage(named: "legPress1")
            let legPress2 = UIImage(named: "legPress2")
            
            let imageArray: [UIImage] = [legPress1!,legPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Leg Extensions" {
            viewExerciseLbl.text = "Leg Extensions"
            
            let legExtension1 = UIImage(named: "legExtension1")
            let legExtension2 = UIImage(named: "legExtension2")
            
            let imageArray: [UIImage] = [legExtension1!,legExtension2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Lunges" {
            viewExerciseLbl.text = "Dumbbell Lunges"
            
            let dumbbellLunges1 = UIImage(named: "dumbbellLunges1")
            let dumbbellLunges2 = UIImage(named: "dumbbellLunges2")
            
            let imageArray: [UIImage] = [dumbbellLunges1!,dumbbellLunges2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Barbell Deadlifts" {
            viewExerciseLbl.text = "Barbell Deadlifts"
            
            let barbellDeadlifts1 = UIImage(named: "barbellDeadlifts1")
            let barbellDeadlifts2 = UIImage(named: "barbellDeadlifts2")
            
            let imageArray: [UIImage] = [barbellDeadlifts1!,barbellDeadlifts2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Lying Leg Curls" {
            viewExerciseLbl.text = "Lying Leg Curls"
            
            let lyingLegCurl1 = UIImage(named: "lyingLegCurl1")
            let lyingLegCurl2 = UIImage(named: "lyingLegCurl2")
            
            let imageArray: [UIImage] = [lyingLegCurl1!,lyingLegCurl2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Seated Calf Raises" {
            viewExerciseLbl.text = "Seated Calf Raises"
            
            let seatedCalfRaises1 = UIImage(named: "seatedCalfRaises1")
            let seatedCalfRaises2 = UIImage(named: "seatedCalfRaises2")
            
            let imageArray: [UIImage] = [seatedCalfRaises1!,seatedCalfRaises2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Standing Heel Raises" {
            viewExerciseLbl.text = "Standing Heel Raises"
            
            let seatedCalfRaise1 = UIImage(named: "seatedCalfRaise1")
            let seatedCalfRaise2 = UIImage(named: "seatedCalfRaise2")
            
            let imageArray: [UIImage] = [seatedCalfRaise1!,seatedCalfRaise2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        
        //Shoulder workouts gif running statements
        //done
        if sender.title(for: .normal) == "Smith Machine Shoulder Press" {
            viewExerciseLbl.text = "Smith Machine Shoulder Press"
            
            let smithMachineShoulderPress1 = UIImage(named: "smithMachineShoulderPress1")
            let smithMachineShoulderPress2 = UIImage(named: "smithMachineShoulderPress2")
            
            let imageArray: [UIImage] = [smithMachineShoulderPress1!,smithMachineShoulderPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Front Cable Raises" {
            viewExerciseLbl.text = "Front Cable Raises"
            
            let frontCableRaise1 = UIImage(named: "frontCableRaise1")
            let frontCableRaise2 = UIImage(named: "frontCableRaise2")
            
            let imageArray: [UIImage] = [frontCableRaise1!,frontCableRaise2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Barbell Upright Row" {
            viewExerciseLbl.text = "Barbell Upright Row"
            
            let barbellUprightRow1 = UIImage(named: "barbellUprightRow1")
            let barbellUprightRow2 = UIImage(named: "barbellUprightRow2")
            
            let imageArray: [UIImage] = [barbellUprightRow1!,barbellUprightRow2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Seated Barbell Military Press" {
            viewExerciseLbl.text = "Seated Barbell Military Press"
            
            let barbellMilitaryPress1 = UIImage(named: "barbellMilitaryPress1")
            let barbellMilitaryPress2 = UIImage(named: "barbellMilitaryPress2")
            
            let imageArray: [UIImage] = [barbellMilitaryPress1!,barbellMilitaryPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Lateral Raise" {
            viewExerciseLbl.text = "Dumbbell Lateral Raise"
            
            let dumbbellLateralRaise1 = UIImage(named: "dumbbellLateralRaise1")
            let dumbbellLateralRaise2 = UIImage(named: "dumbbellLateralRaise2")
            
            let imageArray: [UIImage] = [dumbbellLateralRaise1!,dumbbellLateralRaise2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Dumbbell Shoulder Press" {
            viewExerciseLbl.text = "Dumbbell Shoulder Press"
            
            let seatedDumbbellPress1 = UIImage(named: "seatedDumbbellPress1")
            let seatedDumbbellPress2 = UIImage(named: "seatedDumbbellPress2")
            
            let imageArray: [UIImage] = [seatedDumbbellPress1!,seatedDumbbellPress2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }

        //Abdomen workouts gif running statements
        //done
        if sender.title(for: .normal) == "Dumbbell Side Bend" {
            viewExerciseLbl.text = "Dumbbell Side Bend"
            
            let dumbbellSideBends1 = UIImage(named: "dumbbellSideBends1")
            let dumbbellSideBends2 = UIImage(named: "dumbbellSideBends2")
            
            let imageArray: [UIImage] = [dumbbellSideBends1!,dumbbellSideBends2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Kneeling Cable Crunch" {
            viewExerciseLbl.text = "Kneeling Cable Crunch"
            
            let kneelingCableCrunch1 = UIImage(named: "kneelingCableCrunch1")
            let kneelingCableCrunch2 = UIImage(named: "kneelingCableCrunch2")
            
            let imageArray: [UIImage] = [kneelingCableCrunch1!,kneelingCableCrunch2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Sit Ups" {
            viewExerciseLbl.text = "Sit Ups"
            
            let sitUps1 = UIImage(named: "sitUps1")
            let sitUps2 = UIImage(named: "sitUps2")
            
            let imageArray: [UIImage] = [sitUps1!,sitUps2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Hanging Leg Lift" {
            viewExerciseLbl.text = "Hanging Leg Lift"
            
            let hangingLegLift1 = UIImage(named: "hangingLegLift1")
            let hangingLegLift2 = UIImage(named: "hangingLegLift2")
            
            let imageArray: [UIImage] = [hangingLegLift1!,hangingLegLift2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        //done
        if sender.title(for: .normal) == "Twist Crunch" {
            viewExerciseLbl.text = "Twist Crunch"
            
            let twistCrunch1 = UIImage(named: "twistCrunch1")
            let twistCrunch2 = UIImage(named: "twistCrunch2")
            
            let imageArray: [UIImage] = [twistCrunch1!,twistCrunch2!]
            
            exerciseGifView.animationImages = imageArray
            exerciseGifView.animationDuration = 1.3
            exerciseGifView.startAnimating()
        }
        
        resetBtn.isHidden = true
        exercisesScrollView.isHidden = true
        intervalButton.isHidden = true
    }
    //lays out the subviews to work on different screen sizes
    func layoutSubviews(){
        //constraints for view ecercise label
        let YConstraintViewExerciseLbl = NSLayoutConstraint(item: viewExerciseLbl, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: self.view.frame.size.height/18)
        //adding label contraints to view
        view.addConstraints([YConstraintViewExerciseLbl])
        //constraints for exercise scrollview position
        let YConstraintExerciseScrollView1 = NSLayoutConstraint(item: exercisesScrollView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: self.view.frame.size.height/10)
        let YConstraintExerciseScrollView2 = NSLayoutConstraint(item: exercisesScrollView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/8)
        //adding scrollview constraints to view
        view.addConstraints([YConstraintExerciseScrollView1,YConstraintExerciseScrollView2])
        //button constraints
        let XConstraintResetBtn = NSLayoutConstraint(item: resetBtn, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: self.view.frame.size.width/12)
        let YConstraintResetBtn = NSLayoutConstraint(item: resetBtn, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/20)
        let XConstraintIntervalBtn = NSLayoutConstraint(item: intervalButton, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -self.view.frame.size.width/12)
        let YConstraintIntervalBtn = NSLayoutConstraint(item: intervalButton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/20)
        let YConstraintBackBtn = NSLayoutConstraint(item: backButton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/20)
        //adding button constraints to view
        view.addConstraints([XConstraintResetBtn,YConstraintResetBtn,XConstraintIntervalBtn,YConstraintIntervalBtn,YConstraintBackBtn])
        //gif view constraints
        let YConstraintGifView1 = NSLayoutConstraint(item: exerciseGifView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: self.view.frame.size.height/9)
        let YConstraintGifView2 = NSLayoutConstraint(item: exerciseGifView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/8)
        //adding gif view constraints 
        view.addConstraints([YConstraintGifView1,YConstraintGifView2])
    }
}
