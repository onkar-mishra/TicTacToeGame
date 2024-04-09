//
//  GetStartedViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 09/04/24.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var getStaredButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradient()
       // Apply border and shadow to getStartedButton
        applyBorderAndShadow(to: getStaredButton)
        
        // Apply border and shadow to exitButton
        applyBorderAndShadow(to: exitButton)
        
        // Do any additional setup after loading the view.
    }
    
    func applyBorderAndShadow(to button: UIButton) {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 8
            button.layer.shadowColor = UIColor.white.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 4
        }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        
            guard let playersNameViewController = storyboard?.instantiateViewController(withIdentifier: "PlayersNameViewController") as? PlayersNameViewController else {
                showToast(message: "Something went wrong")
                return
            }
            
            navigationController?.pushViewController(playersNameViewController, animated: true)
        }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        exit(0)
    }
    
    private func showToast(message: String) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let toastView = UIView(frame: CGRect(x: 0, y: window.frame.size.height - 100, width: window.frame.size.width, height: 100))
            toastView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            toastView.alpha = 0.0
            toastView.layer.cornerRadius = 10
            
            let label = UILabel(frame: CGRect(x: 20, y: 20, width: window.frame.size.width - 40, height: 60))
            label.text = message
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.numberOfLines = 2
            toastView.addSubview(label)
            window.addSubview(toastView)
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                toastView.alpha = 1.0
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                    toastView.alpha = 0.0
                }, completion: { _ in
                    toastView.removeFromSuperview()
                })
            })
        }
    }
    
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 95/255, green: 61/255, blue: 125/255, alpha: 1.0).cgColor,
            UIColor(red: 0/255, green: 97/255, blue: 128/255, alpha: 1.0).cgColor,
            UIColor(red: 63/255, green: 106/255, blue: 74/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }


}
