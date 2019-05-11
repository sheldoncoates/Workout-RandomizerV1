//
//  StartIntervalViewController.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-09.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

class StartIntervalViewController: UIViewController {
    //labels
    @IBOutlet weak var exerciseNameLbl: UILabel!
    @IBOutlet weak var timeLbl: ShadowLabel!
    //buttons
    @IBOutlet weak var backButton: AppButton!
    @IBOutlet weak var pausePlayButton: AppButton!
    //imageview
    @IBOutlet weak var exerciseGifView: UIImageView!
    //vars
    var chestExercises: [String] = []
    var tricepExercises: [String] = []
    var backExercises: [String] = []
    var bicepExercises: [String] = []
    var legExercises: [String] = []
    var shoulderExercises: [String] = []
    var abdomenExercises: [String] = []
    var chest: Bool = false
    var tricep: Bool = false
    var back: Bool = false
    var bicep: Bool = false
    var leg: Bool = false
    var shoulder: Bool = false
    var abdomen: Bool = false
    var counter = 1
    var i = 0
    var timePerExercise: Double = 0
    var exercises: Double = 0
    var overallTime: Double = 0
    var overallCounter: Double = 0
    var intervalTimer = Timer()
    var isPaused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
        exerciseNameLbl.numberOfLines = 0
        exerciseNameLbl.lineBreakMode = .byWordWrapping
        exerciseNameLbl.sizeToFit()
        exerciseNameLbl.font = UIFont.boldSystemFont(ofSize: 17)
        // Do any additional setup after loading the view.
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        view.addSubview(imageView)
        imageView.center.x = self.view.center.x
        imageView.center.y = self.view.center.y
        imageView.image = UIImage(named: "gym3.jpg")
        imageView.layer.zPosition = -1
        //initially hide back button
        backButton.isHidden = true
        //properties for gif view
        exerciseGifView.contentMode = .scaleAspectFit
        exerciseGifView.layer.borderWidth = 3
        exerciseGifView.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        exerciseGifView.layer.cornerRadius = 3
        exerciseGifView.backgroundColor = UIColor.white
        //if statements for bool vars and exercise count
        if chestExercises.count > 0 {
            chest = true
            exercises = Double(chestExercises.count)
        }
        if tricepExercises.count > 0 {
            tricep = true
            exercises = Double(tricepExercises.count)
        }
        if backExercises.count > 0 {
            back = true
            exercises = Double(backExercises.count)
        }
        if bicepExercises.count > 0 {
            bicep = true
            exercises = Double(bicepExercises.count)
        }
        if legExercises.count > 0 {
            leg = true
            exercises = Double(legExercises.count)
        }
        if shoulderExercises.count > 0 {
            shoulder = true
            exercises = Double(shoulderExercises.count)
        }
        if abdomenExercises.count > 0 {
            abdomen = true
            exercises = Double(abdomenExercises.count)
        }
        //begins timer for interval
        runInterval()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goBackHome", sender: nil)
    }
    
    @IBAction func pausePlayButtonPressed(_ sender: Any) {
        if isPaused == false {
            exerciseGifView.stopAnimating()
            backButton.isHidden = false
            pausePlayButton.setTitle("Resume", for: .normal)
            intervalTimer.invalidate()
            isPaused = true
        }
        else {
            exerciseGifView.startAnimating()
            backButton.isHidden = true
            pausePlayButton.setTitle("Pause", for: .normal)
            intervalTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            isPaused = false
        }
    }
    //prepares stuff to go back to home screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let _ : ViewController = segue.destination as! ViewController
    }
    func runInterval(){
        //total time
        overallTime = timePerExercise * exercises
        //timer to do interval
        intervalTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    //basically switches gif and makes timer work
    @objc func updateTime(){
        if counter == 1 {
            if chest == true{
                if i < chestExercises.count {
                    if chestExercises[i] == "Barbell Bench Press" {
                        exerciseNameLbl.text = "Barbell Bench Press"
                        
                        let barbellBench1 = UIImage(named: "barbellBenchPress1")
                        let barbellBench2 = UIImage(named: "barbellBenchPress2")
                        
                        let imageArray: [UIImage] = [barbellBench1!,barbellBench2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if chestExercises[i] == "Barbell Incline Press" {
                        exerciseNameLbl.text = "Barbell Incline Press"
                        
                        let barbellIclinePress1 = UIImage(named: "barbellIclinePress1")
                        let barbellIclinePress2 = UIImage(named: "barbellIclinePress2")
                        
                        let imageArray: [UIImage] = [barbellIclinePress1!,barbellIclinePress2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if chestExercises[i] == "Dumbbell Bench Press" {
                        exerciseNameLbl.text = "Dumbbell Bench Press"
                        
                        let dumbbellBenchPress1 = UIImage(named: "dumbbellBenchPress1")
                        let dumbbellBenchPress2 = UIImage(named: "dumbbellBenchPress2")
                        
                        let imageArray: [UIImage] = [dumbbellBenchPress1!,dumbbellBenchPress2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if chestExercises[i] == "Dumbbell Incline Press" {
                        exerciseNameLbl.text = "Dumbbell Incline Press"
                        
                        let dumbbellInclinePress1 = UIImage(named: "dumbbellInclinePress1")
                        let dumbbellInclinePress2 = UIImage(named: "dumbbellInclinePress2")
                        
                        let imageArray: [UIImage] = [dumbbellInclinePress1!,dumbbellInclinePress2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if chestExercises[i] == "Dumbbell Flys" {
                        exerciseNameLbl.text = "Dumbbell Flyes"
                        
                        let dumbbellFlyes1 = UIImage(named: "dumbbellFlyes1")
                        let dumbbellFlyes2 = UIImage(named: "dumbbellFlyes2")
                        
                        let imageArray: [UIImage] = [dumbbellFlyes1!,dumbbellFlyes2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if chestExercises[i] == "Cable Crossovers" {
                        exerciseNameLbl.text = "Cable Crossovers"
                        
                        let cableCrossover1 = UIImage(named: "cableCrossover1")
                        let cableCrossover2 = UIImage(named: "cableCrossover2")
                        
                        let imageArray: [UIImage] = [cableCrossover1!,cableCrossover2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if chestExercises[i] == "Decline Barbell Bench Press" {
                        exerciseNameLbl.text = "Decline Barbell Bench Press"
                        
                        let declineBarbellBenchPress1 = UIImage(named: "declineBarbellBenchPress1")
                        let declineBarbellBenchPress2 = UIImage(named: "declineBarbellBenchPress2")
                        
                        let imageArray: [UIImage] = [declineBarbellBenchPress1!,declineBarbellBenchPress2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
            if tricep == true {
                if i < tricepExercises.count {
                    if tricepExercises[i] == "Close-Grip Bench Press" {
                        exerciseNameLbl.text = "Close-Grip Bench Press"
                        
                        let closegripBarbellBenchPress1 = UIImage(named: "closegripBarbellBenchPress1")
                        let closegripBarbellBenchPress2 = UIImage(named: "closegripBarbellBenchPress2")
                        
                        let imageArray: [UIImage] = [closegripBarbellBenchPress1!,closegripBarbellBenchPress2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if tricepExercises[i] == "Tricep Pushdown" {
                        exerciseNameLbl.text = "Tricep Pushdown"
                        
                        let tricepPushdowns1 = UIImage(named: "tricepPushdowns1")
                        let tricepPushdowns2 = UIImage(named: "tricepPushdowns2")
                        
                        let imageArray: [UIImage] = [tricepPushdowns1!,tricepPushdowns2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if tricepExercises[i] == "Barbell Overhead Tricep Extension" {
                        exerciseNameLbl.text = "Barbell Overhead Tricep Extension"
                        
                        let standingBarbellTricepExtension1 = UIImage(named: "standingBarbellTricepExtension1")
                        let standingBarbellTricepExtension2 = UIImage(named: "standingBarbellTricepExtension2")
                        
                        let imageArray: [UIImage] = [standingBarbellTricepExtension1!,standingBarbellTricepExtension2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if tricepExercises[i] == "Standing Dumbbell Tricep Extension" {
                        exerciseNameLbl.text = "Standing Dumbbell Tricep Extension"
                        
                        let standingDumbbellTricepExtensions1 = UIImage(named: "standingDumbbellTricepExtensions1")
                        let standingDumbbellTricepExtensions2 = UIImage(named: "standingDumbbellTricepExtensions2")
                        
                        let imageArray: [UIImage] = [standingDumbbellTricepExtensions1!,standingDumbbellTricepExtensions2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if tricepExercises[i] == "Dumbbell Tricep Kickbacks" {
                        exerciseNameLbl.text = "Dumbbell Tricep Kickbacks"
                        
                        let tricepKickbacks1 = UIImage(named: "tricepKickbacks1")
                        let tricepKickbacks2 = UIImage(named: "tricepKickbacks2")
                        
                        let imageArray: [UIImage] = [tricepKickbacks1!,tricepKickbacks2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if tricepExercises[i] == "Machine Tricep Extension" {
                        exerciseNameLbl.text = "Machine Tricep Extension"
                        
                        let machineTricepExtensions1 = UIImage(named: "machineTricepExtensions1")
                        let machineTricepExtensions2 = UIImage(named: "machineTricepExtensions2")
                        
                        let imageArray: [UIImage] = [machineTricepExtensions1!,machineTricepExtensions2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
            if back == true{
                if i < backExercises.count {
                    if backExercises[i] == "Lat Pulldown" {
                        exerciseNameLbl.text = "Lat Pulldown"
                        
                        let latPulldowns1 = UIImage(named: "latPulldowns1")
                        let latPulldowns2 = UIImage(named: "latPulldowns2")
                        
                        let imageArray: [UIImage] = [latPulldowns1!,latPulldowns2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if backExercises[i] == "One Arm Bent Over Rows" {
                        exerciseNameLbl.text = "One Arm Bent Over Rows"
                        
                        let oneArmDumbbellBentOverRow1 = UIImage(named: "oneArmDumbbellBentOverRow1")
                        let oneArmDumbbellBentOverRow2 = UIImage(named: "oneArmDumbbellBentOverRow2")
                        
                        let imageArray: [UIImage] = [oneArmDumbbellBentOverRow1!,oneArmDumbbellBentOverRow2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if backExercises[i] == "Barbell Rows" {
                        exerciseNameLbl.text = "Barbell Rows"
                        
                        let barbellRows1 = UIImage(named: "barbellRows1")
                        let barbellRows2 = UIImage(named: "barbellRows2")
                        
                        let imageArray: [UIImage] = [barbellRows1!,barbellRows2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if backExercises[i] == "Pull Up" {
                        exerciseNameLbl.text = "Pull Up"
                        
                        let pullUp1 = UIImage(named: "pullUp1")
                        let pullUp2 = UIImage(named: "pullUp2")
                        
                        let imageArray: [UIImage] = [pullUp1!,pullUp2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if backExercises[i] == "Seated Cable Rows" {
                        exerciseNameLbl.text = "Seated Cable Rows"
                        
                        let cableRow1 = UIImage(named: "cableRow1")
                        let cableRow2 = UIImage(named: "cableRow2")
                        
                        let imageArray: [UIImage] = [cableRow1!,cableRow2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if backExercises[i] == "Deadlift" {
                        exerciseNameLbl.text = "Deadlift"
                        
                        let deadlift1 = UIImage(named: "barbellDeadlifts1")
                        let deadlift2 = UIImage(named: "barbellDeadlifts2")
                        
                        let imageArray: [UIImage] = [deadlift1!,deadlift2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
            if bicep == true {
                if i < bicepExercises.count {
                    if bicepExercises[i] == "Barbell Curls" {
                        exerciseNameLbl.text = "Barbell Curls"
                        
                        let barbellCurl1 = UIImage(named: "barbellCurl1")
                        let barbellCurl2 = UIImage(named: "barbellCurl2")
                        
                        let imageArray: [UIImage] = [barbellCurl1!,barbellCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                        
                    }
                    if bicepExercises[i] == "Bicep Curls" {
                        exerciseNameLbl.text = "Bicep Curls"
                        
                        let bicepCurl1 = UIImage(named: "bicepCurl1")
                        let bicepCurl2 = UIImage(named: "bicepCurl2")
                        
                        let imageArray: [UIImage] = [bicepCurl1!,bicepCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if bicepExercises[i] == "Preacher Curls" {
                        exerciseNameLbl.text = "Preacher Curls"
                        
                        let preacherCurl1 = UIImage(named: "preacherCurl1")
                        let preacherCurl2 = UIImage(named: "preacherCurl2")
                        
                        let imageArray: [UIImage] = [preacherCurl1!,preacherCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if bicepExercises[i] == "Concentrated Curls" {
                        exerciseNameLbl.text = "Concentrated Curls"
                        
                        let concentratedCurl1 = UIImage(named: "concentratedCurl1")
                        let concentratedCurl2 = UIImage(named: "concentratedCurl2")
                        
                        let imageArray: [UIImage] = [concentratedCurl1!,concentratedCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if bicepExercises[i] == "Hammer Curls" {
                        exerciseNameLbl.text = "Hammer Curls"
                        
                        let hammerCurl1 = UIImage(named: "hammerCurl1")
                        let hammerCurl2 = UIImage(named: "hammerCurl2")
                        
                        let imageArray: [UIImage] = [hammerCurl1!,hammerCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if bicepExercises[i] == "Cable Curls" {
                        exerciseNameLbl.text = "Cable Curls"
                        
                        let cableCurl1 = UIImage(named: "cableCurls1")
                        let cableCurl2 = UIImage(named: "cableCurls2")
                        
                        let imageArray: [UIImage] = [cableCurl1!,cableCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
            if leg == true{
                if i < legExercises.count {
                    if legExercises[i] == "Barbell Squats" {
                        exerciseNameLbl.text = "Barbell Squats"
                        
                        let barbellSquat1 = UIImage(named: "barbellSquat1")
                        let barbellSquat2 = UIImage(named: "barbellSquat2")
                        
                        let imageArray: [UIImage] = [barbellSquat1!,barbellSquat2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Leg Press" {
                        exerciseNameLbl.text = "Leg Press"
                        
                        let legPress1 = UIImage(named: "legPress1")
                        let legPress2 = UIImage(named: "legPress2")
                        
                        let imageArray: [UIImage] = [legPress1!,legPress2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Leg Extensions" {
                        exerciseNameLbl.text = "Leg Extensions"
                        
                        let legExtension1 = UIImage(named: "legExtension1")
                        let legExtension2 = UIImage(named: "legExtension2")
                        
                        let imageArray: [UIImage] = [legExtension1!,legExtension2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Dumbbell Lunges" {
                        exerciseNameLbl.text = "Dumbbell Lunges"
                        
                        let dumbbellLunges1 = UIImage(named: "dumbbellLunges1")
                        let dumbbellLunges2 = UIImage(named: "dumbbellLunges2")
                        
                        let imageArray: [UIImage] = [dumbbellLunges1!,dumbbellLunges2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Barbell Deadlifts" {
                        exerciseNameLbl.text = "Barbell Deadlifts"
                        
                        let barbellDeadlifts1 = UIImage(named: "barbellDeadlifts1")
                        let barbellDeadlifts2 = UIImage(named: "barbellDeadlifts2")
                        
                        let imageArray: [UIImage] = [barbellDeadlifts1!,barbellDeadlifts2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Lying Leg Curls" {
                        exerciseNameLbl.text = "Lying Leg Curls"
                        
                        let lyingLegCurl1 = UIImage(named: "lyingLegCurl1")
                        let lyingLegCurl2 = UIImage(named: "lyingLegCurl2")
                        
                        let imageArray: [UIImage] = [lyingLegCurl1!,lyingLegCurl2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Seated Calf Raises" {
                        exerciseNameLbl.text = "Seated Calf Raises"
                        
                        let seatedCalfRaises1 = UIImage(named: "seatedCalfRaises1")
                        let seatedCalfRaises2 = UIImage(named: "seatedCalfRaises2")
                        
                        let imageArray: [UIImage] = [seatedCalfRaises1!,seatedCalfRaises2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    if legExercises[i] == "Standing Heel Raises" {
                        exerciseNameLbl.text = "Standing Heel Raises"
                        
                        let seatedCalfRaise1 = UIImage(named: "seatedCalfRaise1")
                        let seatedCalfRaise2 = UIImage(named: "seatedCalfRaise2")
                        
                        let imageArray: [UIImage] = [seatedCalfRaise1!,seatedCalfRaise2!]
                        
                        self.exerciseGifView.animationImages = imageArray
                        self.exerciseGifView.animationDuration = 1.3
                        self.exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
            if shoulder == true {
                if i < shoulderExercises.count {
                    if shoulderExercises[i] == "Smith Machine Shoulder Press" {
                        exerciseNameLbl.text = "Smith Machine Shoulder Press"
                        
                        let smithMachineShoulderPress1 = UIImage(named: "smithMachineShoulderPress1")
                        let smithMachineShoulderPress2 = UIImage(named: "smithMachineShoulderPress2")
                        
                        let imageArray: [UIImage] = [smithMachineShoulderPress1!,smithMachineShoulderPress2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if shoulderExercises[i] == "Front Cable Raises" {
                        exerciseNameLbl.text = "Front Cable Raises"
                        
                        let frontCableRaise1 = UIImage(named: "frontCableRaise1")
                        let frontCableRaise2 = UIImage(named: "frontCableRaise2")
                        
                        let imageArray: [UIImage] = [frontCableRaise1!,frontCableRaise2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if shoulderExercises[i] == "Barbell Upright Row" {
                        exerciseNameLbl.text = "Barbell Upright Row"
                        
                        let barbellUprightRow1 = UIImage(named: "barbellUprightRow1")
                        let barbellUprightRow2 = UIImage(named: "barbellUprightRow2")
                        
                        let imageArray: [UIImage] = [barbellUprightRow1!,barbellUprightRow2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if shoulderExercises[i] == "Seated Barbell Military Press" {
                        exerciseNameLbl.text = "Seated Barbell Military Press"
                        
                        let barbellMilitaryPress1 = UIImage(named: "barbellMilitaryPress1")
                        let barbellMilitaryPress2 = UIImage(named: "barbellMilitaryPress2")
                        
                        let imageArray: [UIImage] = [barbellMilitaryPress1!,barbellMilitaryPress2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if shoulderExercises[i] == "Dumbbell Lateral Raise" {
                        exerciseNameLbl.text = "Dumbbell Lateral Raise"
                        
                        let dumbbellLateralRaise1 = UIImage(named: "dumbbellLateralRaise1")
                        let dumbbellLateralRaise2 = UIImage(named: "dumbbellLateralRaise2")
                        
                        let imageArray: [UIImage] = [dumbbellLateralRaise1!,dumbbellLateralRaise2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if shoulderExercises[i] == "Dumbbell Shoulder Press" {
                        exerciseNameLbl.text = "Dumbbell Shoulder Press"
                        
                        let seatedDumbbellPress1 = UIImage(named: "seatedDumbbellPress1")
                        let seatedDumbbellPress2 = UIImage(named: "seatedDumbbellPress2")
                        
                        let imageArray: [UIImage] = [seatedDumbbellPress1!,seatedDumbbellPress2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
            if abdomen == true {
                if i < abdomenExercises.count {
                    if abdomenExercises[i] == "Dumbbell Side Bend" {
                        exerciseNameLbl.text = "Dumbbell Side Bend"
                        
                        let dumbbellSideBends1 = UIImage(named: "dumbbellSideBends1")
                        let dumbbellSideBends2 = UIImage(named: "dumbbellSideBends2")
                        
                        let imageArray: [UIImage] = [dumbbellSideBends1!,dumbbellSideBends2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if abdomenExercises[i] == "Kneeling Cable Crunch" {
                        exerciseNameLbl.text = "Kneeling Cable Crunch"
                        
                        let kneelingCableCrunch1 = UIImage(named: "kneelingCableCrunch1")
                        let kneelingCableCrunch2 = UIImage(named: "kneelingCableCrunch2")
                        
                        let imageArray: [UIImage] = [kneelingCableCrunch1!,kneelingCableCrunch2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if abdomenExercises[i] == "Sit Ups" {
                        exerciseNameLbl.text = "Sit Ups"
                        
                        let sitUps1 = UIImage(named: "sitUps1")
                        let sitUps2 = UIImage(named: "sitUps2")
                        
                        let imageArray: [UIImage] = [sitUps1!,sitUps2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if abdomenExercises[i] == "Hanging Leg Lift" {
                        exerciseNameLbl.text = "Hanging Leg Lift"
                        
                        let hangingLegLift1 = UIImage(named: "hangingLegLift1")
                        let hangingLegLift2 = UIImage(named: "hangingLegLift2")
                        
                        let imageArray: [UIImage] = [hangingLegLift1!,hangingLegLift2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    if abdomenExercises[i] == "Twist Crunch" {
                        exerciseNameLbl.text = "Twist Crunch"
                        
                        let twistCrunch1 = UIImage(named: "twistCrunch1")
                        let twistCrunch2 = UIImage(named: "twistCrunch2")
                        
                        let imageArray: [UIImage] = [twistCrunch1!,twistCrunch2!]
                        
                        exerciseGifView.animationImages = imageArray
                        exerciseGifView.animationDuration = 1.3
                        exerciseGifView.startAnimating()
                    }
                    i += 1
                }
            }
        }
        if counter < 60 {
            timeLbl.text = "\(counter)s"
        }
        if counter >= 60 {
            timeLbl.text = "1m \(counter - 60)s"
        }
        if counter >= 120 {
            timeLbl.text = "2m \(counter - 120)s"
        }
        if counter >= 180 {
            timeLbl.text = "3m \(counter - 180)s"
        }
        if counter >= 240 {
            timeLbl.text = "4m \(counter - 240)s"
        }
        if counter >= 300 {
            timeLbl.text = "5m \(counter - 300)s"
        }
        if counter >= 360 {
            timeLbl.text = "6m \(counter - 360)s"
        }
        if Double(counter) == timePerExercise {
            counter = 0
        }
        if overallTime == overallCounter {
            pausePlayButton.isHidden = true
            backButton.isHidden = false
            intervalTimer.invalidate()
            exerciseGifView.stopAnimating()
        }
        counter += 1
        overallCounter += 1
    }
    //lays out the subviews to work on different screen sizes
    func layoutSubviews(){
        //constraints for back button
        let XConstraintBackbtn = NSLayoutConstraint(item: backButton ?? "", attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: self.view.frame.size.width/12)
        let YConstraintBackbtn = NSLayoutConstraint(item: backButton ?? "", attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/20)
        view.addConstraints([XConstraintBackbtn,YConstraintBackbtn])
        //constraints for exercise gif view position
        let YConstraintExerciseGifView1 = NSLayoutConstraint(item: exerciseGifView ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/9)
        let YConstraintExerciseGifView2 = NSLayoutConstraint(item: exerciseGifView ?? "", attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/8)
        //adding scrollview constraints to view
        view.addConstraints([YConstraintExerciseGifView1,YConstraintExerciseGifView2])
        //constraints for exercise name label
        let YConstraintExerciseNameLbl = NSLayoutConstraint(item: exerciseNameLbl ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/8)
        view.addConstraints([YConstraintExerciseNameLbl])
        //constraints for time label
        let YConstraintTimeLbl = NSLayoutConstraint(item: timeLbl ?? "", attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.view.frame.size.height/16)
        view.addConstraints([YConstraintTimeLbl])
        //constraints for pause play button
        let XConstraintPausePlaybtn = NSLayoutConstraint(item: pausePlayButton ?? "", attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -self.view.frame.size.width/12)
        let YConstraintPausePlaybtn = NSLayoutConstraint(item: pausePlayButton ?? "", attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -self.view.frame.size.height/20)
        view.addConstraints([XConstraintPausePlaybtn,YConstraintPausePlaybtn])
    }
}
