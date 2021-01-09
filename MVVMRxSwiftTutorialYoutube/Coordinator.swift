//
//  Coordinator.swift
//  MVVMRxSwiftTutorialYoutube
//
//  Created by 신동규 on 2021/01/10.
//

import UIKit

class Coordinator {
    let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArticleService()))
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        window.makeKeyAndVisible()
    }
}
