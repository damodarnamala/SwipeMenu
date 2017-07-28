//
//  SwipeViewController.swift
//  SwipeController
//
//  Created by sharad.rao on 28/07/17.
//  Copyright © 2017 sharad.rao. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

     var delegate : SwipeMenuDelegate?
    
    var  isMenuOpened  = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeMenuAction(sender: UIButton) {
    
        isMenuOpened = !isMenuOpened
        self.updateMenu()
    }

    @IBAction func swipeGestureMenuAction(sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .right {
            isMenuOpened = true
        }
        else if sender.direction == .left {
            isMenuOpened = false
        }
        self.updateMenu()
    }
    
    @IBAction func doubleTapMenuAction(sender: UISwipeGestureRecognizer)
    {
        if self.isMenuOpened {
            self.isMenuOpened = !isMenuOpened
        }
        self.updateMenu()
    }
    
    func updateMenu()  {
        delegate?.didSwipeActionTriggered(isDone: self.isMenuOpened)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
