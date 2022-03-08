//
//  Flip_board__handwritten_App.swift
//  Shared
//
//  Created by 上別縄祐也 on 2022/02/28.
//

import SwiftUI
import UIKit
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

func requestIDFA() {
  ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
    // Tracking authorization completed. Start loading ads here.
    // loadAd()
  })
}
 
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        requestIDFA()
        return true
    }
}

@main
struct Flip_board__handwritten_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
