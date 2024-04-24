//
//  UIStoryboard+Extentions.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import UIKit

extension UIViewController {
    
    static func instantiate(fromStoryboard storyboardName: String = StoryBoardName.main.realName) -> Self {
        return instantiateFromStoryboardHelper(storyName: storyboardName)
    }
    
    private static func instantiateFromStoryboardHelper<T>(storyName: String) -> T {
        let storyboard = UIStoryboard(name: storyName, bundle: nil)
        let className = String(describing: self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? T else {
            fatalError("Failed to instantiate view controller with identifier \(className) in storyboard named \(storyName).")
        }
        return viewController
    }
}

