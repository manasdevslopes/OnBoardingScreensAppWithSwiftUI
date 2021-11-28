//
//  AppModel.swift
//  OnBoardingScreensWithSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/05/21.
//

import SwiftUI

class AppModel: ObservableObject {
    
    // MARK:- variables
    @Published var onboardingData: [OnboardingMetaData] = [
        OnboardingMetaData(imageName: "stone", title: "Learn new\nSkills", subtitle: "access thousands of catalogues and courses", imageOffset: 0, associatedColor: Color(hex: "88d8df")),
        OnboardingMetaData(imageName: "office", title: "Anytime\nanywhere ", subtitle: "download courses and learn at your own pace", imageOffset: -24, associatedColor: Color(hex: "f2bac9"), imageScale: 1.2),
        OnboardingMetaData(imageName: "fan", title: "Talk with\nyour tutors", subtitle: "and get your doubts and questions solved", imageOffset: 0, associatedColor: Color(hex: "eddea4"), imageScale: 1.2)
    ]
    
    @Published var previousColor: Color = Color.green
    @Published var passedSteps: [Int] = [0]
    @Published var currentStep = 0 {
        didSet {
            Timer.scheduledTimer(withTimeInterval: animationDuration * 1.5, repeats: false) { _ in
                self.animationInProgress = false
            }
        }
    }
    
    @Published var scale: CGFloat = 0
    @Published var animationInProgress = false
    @Published var forward = true
    
    let animationDuration: TimeInterval = 0.5
    
    // MARK:- inits
    init() {
        previousColor = onboardingData[0].associatedColor
    }
    
    // MARK:- functions
    func addStep() {
        self.passedSteps.append(self.currentStep)
    }
    
    func removeStep(step: Int) {
        self.passedSteps = self.passedSteps.filter {
            $0 != step
        }
    }
    
    func skip() {
        
    }
}
