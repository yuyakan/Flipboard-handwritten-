//
//  ContentView.swift
//  Shared
//
//  Created by 上別縄祐也 on 2022/02/28.
//

import SwiftUI
import PencilKit
import GoogleMobileAds
 
struct AdView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let rootVC = windowScenes?.keyWindow?.rootViewController
        
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        
        banner.rootViewController = rootVC
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
 
struct PencilKitViewControllerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PencilKitViewController {
        return PencilKitViewController()
    }
 
    func updateUIViewController(_ controller: PencilKitViewController, context: Context) {}
}
 
class PencilKitViewController: UIViewController {
    var pkcanvasview: PKCanvasView?
    let pktoolpicker = PKToolPicker()
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.pkcanvasview = PKCanvasView(frame: .zero)
        if let view = self.pkcanvasview {
            view.isOpaque = false
            view.backgroundColor = .clear
            view.overrideUserInterfaceStyle = .light
            self.pktoolpicker.addObserver(view)
            self.pktoolpicker.setVisible(true, forFirstResponder: view)
            view.becomeFirstResponder()
            self.view = view
        }
    }
}



struct ContentView: View {
    var body: some View {
        let img = ["whiteboard", "brackboard", "manga", "book", "sky", "star"]
        let img2 = ["brick", "brackboard2", "color", "brick2", "wall", "sky2"]
        let views: [AnyView] = [AnyView(WhiteSettingView()),AnyView(BrackSettingView()),AnyView(MangaSettingView()),AnyView(BookSettingView()),AnyView(SkySettingView()),AnyView(StarSettingView())]
        let views2: [AnyView] = [AnyView(BrickSettingView()),AnyView(Brack2SettingView()),AnyView(ColorSettingView()),AnyView(Brick2SettingView()),AnyView(WallSettingView()),AnyView(Sky2SettingView())]
        NavigationView{
            VStack{
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0...5, id: \.self) { value in
                                    GeometryReader { geometry in
                                        NavigationLink(destination: views[value]) {
                                            Image("\(img[value])")
                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 150) / -8), axis: (x: 0, y: 10, 0))
                                        }
                                    }
                                    .frame(width: 180, height: 300)
                                }
                            }
                            .padding(40)
                        }
                Spacer()
                Text("Please select background").font(.largeTitle)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0...5, id: \.self) { value in
                                    GeometryReader { geometry in
                                        NavigationLink(destination: views2[value]) {
                                            Image("\(img2[value])")
                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 150) / -8), axis: (x: 0, y: 10, 0))
                                        }
                                    }
                                    .frame(width: 180, height: 300)
                                }
                            }
                            .padding(40)
                        }
                Spacer()
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
