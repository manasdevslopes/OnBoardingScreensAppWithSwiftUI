//
//  OnboardingView.swift
//  OnBoardingScreensWithSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/05/21.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK:- variables
    @StateObject var appModel: AppModel = AppModel()
    @State var background: Color
    @State var viewAppeared = false
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            appModel.previousColor
                .edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height
                
                ZStack {
                    /// left
                    if (!appModel.forward) {
                        Circle()
                            .scale(appModel.scale)
                            .foregroundColor(background)
                            .frame(width: 200, height: 200)
                            .offset(x: 12, y: height * 0.775)
                    }
                    /// right
                    if (appModel.forward) {
                        ZStack {
                            Circle()
                                .scale(appModel.scale)
                                .foregroundColor(background)
                                .frame(width: 200, height: 200)
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                                .foregroundColor(.white.opacity(0.5))
                                .blur(radius:6)
                                .frame(width: 200, height: 200)
                                .scaleEffect(appModel.scale)
                                .animation(Animation.easeInOut(duration: 0.2).delay(0.2))
                        }
                        .offset(x: width * 0.6, y: height * 0.775)
                    }
                }
            }
            
            OnboardingScrollView(backgroundColor: $background)
                .environmentObject(appModel)
            
            HStack {
                Spacer()
                if (appModel.currentStep < 2) {
                    Button(action: {
                        
                    }) {
                        Text("Skip")
                            .foregroundColor(.black)
                            .opacity(0.7)
                            .font(.system(size: 20, weight: .medium))
                            .scaleEffect(self.viewAppeared ? 1 : 0)
                            .animation(.default)
                    }
                }
            }.padding(24)
        }.onAppear() {
            self.background = self.appModel.previousColor
            self.viewAppeared = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(background: .yellow)
    }
}
