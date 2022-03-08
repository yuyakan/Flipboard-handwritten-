//
//  Sky2SettingView.swift
//  Flip board -handwritten-
//
//  Created by 上別縄祐也 on 2022/02/28.
//

import SwiftUI

struct Sky2SettingView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
    let bounds = UIScreen.main.bounds
    let width = Double(bounds.width)
    let height = Double(bounds.height)
    VStack(spacing: 0){
        Spacer()
            AdView().frame(width: 320, height: 50)
        HStack{
            Button(action: {
                self.presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName:"arrowshape.turn.up.left.circle.fill")
                        .font(.title)
                        .accentColor(Color.gray)
                        .rotationEffect(Angle.degrees(90))
            })
                .padding(.trailing, width  * 0.9)
            }
        ZStack{
            Image("sky2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: height * 0.7)
            PencilKitViewControllerView().frame(maxHeight: height * 0.7)
            }.navigationBarHidden(true)
            .padding(.bottom)
        Text(" ").padding()
        Spacer()
        }
    }
}
