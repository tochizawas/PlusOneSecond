//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by anonymous on 2020/02/24.
//  Copyright © 2020 anonymous. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State
    @State var timeCount: Double = 0.0
    @State var clickCount: Int = 0
    @State var timer: Timer?

    // MARK: - body
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    HStack {
                        Group {
                            Text(timeString(time: timeCount))
                                .font(.system(size: 100, weight: .black))
                                .italic()
                                .foregroundColor(Color.white)
                                .onAppear(perform: {
                                    self.timer =
                                           Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                                               self.timeCount += 0.1
                                           }
                                })
                            Text("s").font(.system(size: 60, weight: .black))
                                .italic()
                                .foregroundColor(Color.white)
                                .padding(.top)
                        }
                        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                    }
                    .padding(.top, 120)
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            self.timer?.invalidate()
                            self.timer = nil
                            self.timeCount = 0.0
                            self.clickCount = 0
                        }) {
                            Text("Stop")
                                .font(.system(size: 34, weight: .black))
                                .foregroundColor(Color.white)
                        }.frame(width: 190, height: 80)
                            .background(Color.green)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                        .padding(.bottom, 10)

                        Button(action: {
                            if self.timer == nil {
                                self.timeCount = 0.0
                                self.clickCount = 0
                                self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                                    self.timeCount += 0.1
                                }
                            }
                        }) {
                            Text("Start")
                                .font(.system(size: 34, weight: .black))
                                .foregroundColor(Color.white)
                        }.frame(width: 190, height: 80)
                            .background(Color.green)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                            .padding(.bottom, 10)
                        
                        Button(action: {
                            guard self.timer != nil else { return }
                            self.timeCount += 1.0
                            self.clickCount += 1
                            print("Total plus:", self.clickCount)
                        }) {
                            Text("+1s")
                                .font(.system(size: 34, weight: .black))
                                .foregroundColor(Color.white)
                        }.frame(width: 190, height: 80)
                            .background(Color.green)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                        
                        Text("a little work with 🕰")
                            .foregroundColor(Color.black.opacity(0.5))
                            .font(.system(size: 17, weight: .regular))
                            .italic()
                            .padding(.top, 16)
                            .padding(.bottom, 16)
                        
                    }
                }
            }
        }
    }
}

// MARK: - functions
extension ContentView {
    func timeString(time: Double) -> String {
        return String(format: "%.1f", time)
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
