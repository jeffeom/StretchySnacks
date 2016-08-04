//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Jeff Eom on 2016-08-04.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var navTitleX: NSLayoutConstraint!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let imageView4 = UIImageView()
    let imageView5 = UIImageView()
    
    let imageStackView = UIStackView()
    
    var count = 0
    
    var tappedImagesArray: Array = [Int]()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: StackView
        
        imageView1.image = UIImage.init(named: "oreos")
        imageView1.heightAnchor.constraintEqualToConstant(60).active = true
        imageView1.widthAnchor.constraintEqualToConstant(60).active = true
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.userInteractionEnabled = true
        imageView1.tag = 1
        imageView1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        imageView2.image = UIImage.init(named: "pizza_pockets")
        imageView2.heightAnchor.constraintEqualToConstant(60).active = true
        imageView2.widthAnchor.constraintEqualToConstant(60).active = true
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.userInteractionEnabled = true
        imageView2.tag = 2
        imageView2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        imageView3.image = UIImage.init(named: "pop_tarts")
        imageView3.heightAnchor.constraintEqualToConstant(60).active = true
        imageView3.widthAnchor.constraintEqualToConstant(60).active = true
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        imageView3.userInteractionEnabled = true
        imageView3.tag = 3
        imageView3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        imageView4.image = UIImage.init(named: "popsicle")
        imageView4.heightAnchor.constraintEqualToConstant(60).active = true
        imageView4.widthAnchor.constraintEqualToConstant(60).active = true
        imageView4.translatesAutoresizingMaskIntoConstraints = false
        imageView4.userInteractionEnabled = true
        imageView4.tag = 4
        imageView4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        imageView5.image = UIImage.init(named: "ramen")
        imageView5.heightAnchor.constraintEqualToConstant(60).active = true
        imageView5.widthAnchor.constraintEqualToConstant(60).active = true
        imageView5.translatesAutoresizingMaskIntoConstraints = false
        imageView5.userInteractionEnabled = true
        imageView5.tag = 5
        imageView5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        imageStackView.axis = UILayoutConstraintAxis.Horizontal
        imageStackView.distribution = UIStackViewDistribution.EqualSpacing
        imageStackView.alignment = UIStackViewAlignment.Bottom
        imageStackView.spacing = 10
        
        imageStackView.addArrangedSubview(imageView1)
        imageStackView.addArrangedSubview(imageView2)
        imageStackView.addArrangedSubview(imageView3)
        imageStackView.addArrangedSubview(imageView4)
        imageStackView.addArrangedSubview(imageView5)
        
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.userInteractionEnabled = true
        self.view.addSubview(imageStackView)
        
        imageStackView.leftAnchor.constraintEqualToAnchor(navBar.leftAnchor, constant: 10).active = true
        imageStackView.rightAnchor.constraintGreaterThanOrEqualToAnchor(navBar.rightAnchor, constant: -10).active = true
        imageStackView.bottomAnchor.constraintEqualToAnchor(navBar.bottomAnchor, constant: -10).active = true
        
        imageStackView.hidden = true
        
    }
    
    //MARK: Action
    
    @IBAction func addButtonPressed(sender: AnyObject?) {
        
        print("plus icon pressed")
        
        if count % 2 == 0{
            self.navBarHeight.constant = 140
            imageStackView.hidden = false
            navTitle.text = "Add a SNACK"
            navTitleX.constant = -35
            
            UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: [], animations: {
                self.view.layoutIfNeeded()
                self.button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2)/2)
                }, completion: nil)
        }else{
            self.navBarHeight.constant = 66
            imageStackView.hidden = true
            navTitle.text = "SNACKS"
            navTitleX.constant = 0
            
            UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5.0, options: [], animations: {
                self.view.layoutIfNeeded()
                self.button.transform = CGAffineTransformMakeRotation(0)
                }, completion: nil)
        }
        count += 1
    }
    
    //MARK: Tap Gesture Function
    
    func tap(gesture: UITapGestureRecognizer) {
        let tag = gesture.view!.tag
        tappedImagesArray.insert(tag, atIndex: 0)
//        tappedImagesArray.append(tag)
        print("Added!")
        tableView.reloadData()
    }
    
    //MARK: TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tappedImagesArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        if tappedImagesArray[indexPath.row] == 1 {
            cell.textLabel?.text = "Oreos"
            
        }else if tappedImagesArray[indexPath.row] == 2 {
            cell.textLabel?.text = "Pizza Pockets"
            
        }else if tappedImagesArray[indexPath.row] == 3 {
            cell.textLabel?.text = "Pop Tarts"
            
        }else if tappedImagesArray[indexPath.row] == 4 {
            cell.textLabel?.text = "Popsicle"
            
        }else if tappedImagesArray[indexPath.row] == 5 {
            cell.textLabel?.text = "Ramen"
        }
        
        return cell
    }
}

