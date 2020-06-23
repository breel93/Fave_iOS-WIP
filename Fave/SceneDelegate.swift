//
//  SceneDelegate.swift
//  Fave
//
//  Created by Kola Emiola on 07/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(rootView: TabedView())
        window?.makeKeyAndVisible()
    }
    
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        CoreDataManager.shared.saveContext()
//    }
}
