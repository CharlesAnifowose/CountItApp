//
//  SettingsViewController.swift
//  ClickerApp
//
//  Created by Christopher Jimenez on 3/14/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettingsViewController: UITableViewController {

    @IBOutlet weak var yellowButton: ColorPickerButton!
    
    @IBOutlet weak var blueButton: ColorPickerButton!
    
    @IBOutlet weak var redButton: ColorPickerButton!
    
    @IBOutlet weak var greenButton: ColorPickerButton!
    
    @IBOutlet weak var incrementStepper: UIStepper!
    
    @IBOutlet weak var incrementLabel: UILabel!

    let viewModel: SettingsViewModel = SettingsViewModel()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.setupObservers()
        
        viewModel.getLatestSettings()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        
        self.yellowButton.setupWithColor(ClickerColors.YellowColor.uiColor)
        
        self.blueButton.setupWithColor(ClickerColors.BlueColor.uiColor)
        
        self.redButton.setupWithColor(ClickerColors.RedColor.uiColor)
        
        self.greenButton.setupWithColor(ClickerColors.GreenColor.uiColor)

    }
    
    func setupObservers(){
        
        
        viewModel.settingsChangedDriver.driveNext{ [weak self ]settings in
            
            self?.incrementStepper.tintColor = settings.color.uiColor.darkerColor()
            
            }.addDisposableTo(disposeBag)
        
        
        viewModel.settingsChangedDriver.map{
            
            return Double($0.incrementMultiplier)
            
            }.drive(incrementStepper.rx_value)
            .addDisposableTo(disposeBag)
        
        
        viewModel.settingsChangedDriver.map{
            
            return "\("increment_text".localized) \($0.incrementMultiplier)"
            
            }.drive(incrementLabel.rx_text)
            .addDisposableTo(disposeBag)
    }
    
    
//    private func shapeButton(button : UIButton, withColor color:UIColor){
//        
//        button.layer.cornerRadius = buttonCornerRadius
//        
//        button.layer.borderWidth = buttonBorderWidth
//        
//        button.layer.borderColor = color.darkerColor().CGColor
//        
//        button.layer.backgroundColor = color.CGColor
//        
//        button.setTitle("", forState: UIControlState.Normal)
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func yellowButtonTouched(sender: AnyObject) {
        
        viewModel.setColor(ClickerColors.YellowColor)
    }
    

    @IBAction func blueButtonTouched(sender: AnyObject) {
        
        viewModel.setColor(ClickerColors.BlueColor)
    }
    
    @IBAction func greenButtonTouched(sender: AnyObject) {
        
         viewModel.setColor(ClickerColors.GreenColor)
        
    }
    
    @IBAction func redButtonTouched(sender: AnyObject) {
        
         viewModel.setColor(ClickerColors.RedColor)
    }
    
    @IBAction func stepperChanged(sender: UIStepper) {
        
        viewModel.setIncrementsMultiple(Int(sender.value))
        
        
    }

}
