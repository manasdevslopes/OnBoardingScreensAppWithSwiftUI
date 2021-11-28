//
//  NextButton.swift
//  OnBoardingScreensWithSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/05/21.
//

import SwiftUI

struct NextButton: View {
    // MARK:- variables
    @Binding var background: Color
    @EnvironmentObject var appModel: AppModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: self.appModel.currentStep == 2 ? 45 : 24)
                .foregroundColor(Color.white)
                .shadow(color: Color.white.opacity(0.4), radius: 5)
            
            StrokedRectangle(background: $background)
                .environmentObject(appModel)
            
            Image(systemName: "chevron.right")
                .foregroundColor(appModel.currentStep == 2 ? Color.green : Color.black)
                .font(.system(size: 24, weight: self.appModel.currentStep == 2 ? .black : .semibold))
                .scaleEffect(self.appModel.currentStep == 2 ? 1.2 : 1)
                .animation(.default)
        }
        .frame(width: 90, height: 90)
        .scaleEffect(self.appModel.currentStep == 2 ? 0.9 : 1)
        .animation(.default)
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            NextButton(background: .constant(.yellow))
                .environmentObject(AppModel())
        }
    }
}
