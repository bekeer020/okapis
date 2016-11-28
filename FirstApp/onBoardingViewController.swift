//
//  onBoardingViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/22/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit
import PaperOnboarding

class onBoardingViewController: UIViewController,PaperOnboardingDataSource,PaperOnboardingDelegate{

    @IBOutlet var getStartedButton: UIButton!
    @IBOutlet var myboardinView: onBoardingView!
    @IBAction func getStartAction(_ sender: UIButton) {
        
        let userdefault=UserDefaults.standard
        
        userdefault.set(true, forKey: "XYZ")
        
        userdefault.synchronize()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myboardinView.dataSource=self
        myboardinView.delegate=self
        
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne=UIColor(red: 217/256, green: 72/256, blue: 89/256, alpha: 1)
        let backgroundColorTow=UIColor(red: 106/256, green: 166/256, blue: 211/256, alpha: 1)
        let backgroundColorThree=UIColor(red: 186/256, green: 200/256, blue: 78/256, alpha: 1)

        let titleFont=UIFont(name: "AvenirNext-Bold", size: 24)! //iosFont.com
        let titleDescription=UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("ghadeer_15.jpg","Rocket Title","Rocket Description","",backgroundColorOne,UIColor.white,UIColor.white,titleFont,titleDescription),("ghadeer_15.jpg","Our Branches","Rocket Description","",backgroundColorTow,UIColor.white,UIColor.white,titleFont,titleDescription),("ghadeer_15.jpg","QK Title","Rocket Description","",backgroundColorThree,UIColor.white,UIColor.white,titleFont,titleDescription)][index]
        
    }
    
    
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index==1
        {
            if self.getStartedButton.alpha==1
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.getStartedButton.alpha=0
                    
                })
            }
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index==2
        {
            UIView.animate(withDuration: 0.2, animations: {
            self.getStartedButton.alpha=1
            
            })
        }
    }
    
  
}
