//
//  OnboardingPage.swift
//  OnBoardingScreensWithSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/05/21.
//

import SwiftUI

struct OnboardingPage: View {
    
    // MARK:- variables
    @State var viewAppeared = false
    
    @Binding var selectedIndex: Int
    @StateObject var appModel: AppModel
    
    let onboardingData: OnboardingMetaData
    var step: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            VStack(alignment: .leading) {
                Image(onboardingData.imageName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(onboardingData.imageScale)
                    .offset(y: onboardingData.imageOffset)
                
                VStack(alignment: .leading) {
                    Text(onboardingData.title)
                        .foregroundColor(.black)
                        .font(.system(size: 60, weight: .semibold))
                        .shadow(color: Color(hex: "c0c0c0").opacity(0.4), radius: 5)
                        .opacity(self.viewAppeared ? 1 : 0)
                        .offset(y: self.viewAppeared ? 0 : -100)
                        .frame(height: self.viewAppeared ? 150 : CGFloat.zero, alignment: .leading)
                        .frame(minHeight: 150)
                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.7).delay(0.25))
                    
                    
                    Text(onboardingData.subtitle)
                        .font(.system(size: 24, weight: .regular))
                        .opacity(0.7)
                        .shadow(color: Color(hex: "c0c0c0").opacity(1), radius: 5)
                        .foregroundColor(.black)
                        .padding(.top, 16)
                        .opacity(self.viewAppeared ? 1 : 0)
                        .offset(y: self.viewAppeared ? 0 : 100)
                        .frame(height: self.viewAppeared ? 80 : CGFloat.zero, alignment: .top)
                        .frame(minHeight: 80)
                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.7).delay(0.325))
                    
                }.padding([.leading, .trailing], 42)
                Spacer()
            }.padding(.top, 42)
            
        }.onAppear() {
            showOrHideView()
        }
    }
    
    // MARK:- functions
    func showOrHideView() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if (!viewAppeared && appModel.currentStep == step) {
                animate()
            } else if (viewAppeared && appModel.currentStep != step) {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    hide()
                }
            }
        }
    }
    
    func animate() {
        self.viewAppeared = true
    }
    
    func hide() {
        self.viewAppeared = false
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(hex: "f6c634")
                .edgesIgnoringSafeArea(.all)
            OnboardingPage(selectedIndex: .constant(0), appModel: AppModel(), onboardingData: AppModel().onboardingData[0],
                           step: 0)
        }
    }
}
