//
//  ViewController.swift
//  SwipeController
//
//  Created by sharad.rao on 28/07/17.
//  Copyright © 2017 sharad.rao. All rights reserved.
//

import UIKit

protocol SwipeMenuDelegate {
   func didSwipeActionTriggered (isDone: Bool)
}

class ViewController: UIViewController,SwipeMenuDelegate {

    @IBOutlet weak var menuWidthConstant: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }  

    func didSwipeActionTriggered(isDone: Bool) {
        
        print("Width:  \(self.menuWidthConstant.constant)")
       
        UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.55, options: .curveEaseOut, animations: {
            if isDone {
                self.menuWidthConstant.constant = 200
            }
            else {
                self.menuWidthConstant.constant = 0
                
            }
            self.view.layoutIfNeeded()

        }) { (isDone: Bool) in
            
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if  segue.identifier == "detail" {
            let desination : SwipeViewController = segue.destination as! SwipeViewController
            desination.delegate = self
        }
    }
    
}

