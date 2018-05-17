//
//  ViewController.swift
//  AttributedTextLabel
//
//  Created by Steven Lipton on 5/1/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit
//: Uncomment this line below for use in playgrounds. Uncomment lines below too. 
//import PlaygroundSupport

class ViewController:UIViewController {
    var label = UILabel()

    func formatLabel(){
        let text = "I really love Pizza"
        let attributedText = NSMutableAttributedString(string: text)
        var fullRange:NSRange{
            return NSRange(location: 0, length: attributedText.length)
        }
        func range(of string:String)->NSRange{
            return attributedText.mutableString.range(of: string)
        }
        
        attributedText.addAttribute(.font, value: UIFont(name:"Georgia",size:48)!, range: fullRange)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: fullRange)
        
        attributedText.addAttribute(.obliqueness, value: 0.25, range: range(of: "really"))
        let attributes:[NSAttributedStringKey:Any] = [
            .font:UIFont(name: "Chalkduster", size: 72)!,
            .foregroundColor: UIColor.red,
            .strokeWidth: 6
        ]
        attributedText.addAttributes(attributes, range: range(of: "Pizza"))
        
        label.attributedText = attributedText
    }


    
    //Programmatic layout of the label.
    func layoutLabel(){
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        // label.top = safeArea.top + 50
        constraints += [NSLayoutConstraint.init(item: label, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0)]
        //label.leading = safeArea.leading + 20
        constraints += [NSLayoutConstraint.init(item: label, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20.0)]
        //label.trailing = safeArea.trailing + 20
        constraints += [NSLayoutConstraint.init(item: label, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 20.0)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.8, alpha: 1.0)
        layoutLabel()
        formatLabel()
        
    }
    
}

//: Uncomment this code  and the `import PlaygroundSupport` above to run in a playground. Includes v2.1 iPad playgrounds bug workaround. See http://bit.ly/iPad21Bug for details.
/*
class StartViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        present(ViewController(), animated: false, completion: nil)
    }
}
PlaygroundPage.current.liveView = StartViewController()
*/
