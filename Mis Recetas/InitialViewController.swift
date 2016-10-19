//
//  InitialViewController.swift
//  Mis Recetas
//
//  Created by Edu on 19/10/16.
//  Copyright © 2016 Edu. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var imageInitial: UIImageView!
    @IBOutlet weak var labelInitial: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imageInitial.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        labelInitial.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations: {
                        self.labelInitial.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        self.imageInitial.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        },
                       completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
