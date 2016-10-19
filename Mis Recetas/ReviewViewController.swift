//
//  ReviewViewController.swift
//  Mis Recetas
//
//  Created by Edu on 18/10/16.
//  Copyright © 2016 Edu. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var colored : String?
    var ratingSelected: String?
    var backgroundRatingSelected : UIColor = UIColor.orange
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Añadir efecto blur a la imagen
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
        
        //StackView
        //ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.firstButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.secondButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.thirdButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)

        
        
        //Label
        labelQuestion.transform = CGAffineTransform(rotationAngle: CGFloat(floatLiteral: .pi))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //closeButton
        let translateEffect = CGAffineTransform(translationX: 0.0, y: -20.0)
        /*
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: {
                            self.labelQuestion.transform = CGAffineTransform(rotationAngle: CGFloat(floatLiteral: 0.0))
                            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        },
                       completion: nil)
         */
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations:
                       {
                        //CLOSEBUTTON
                        self.closeButton.transform = CGAffineTransform(translationX: 0.0, y: 50.0)
                        //STACKVIEW
                        self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0).concatenating(translateEffect)
                        //LABEL
                        self.labelQuestion.transform = CGAffineTransform(rotationAngle: CGFloat(floatLiteral: 0.0)).concatenating(translateEffect)
                       },
                       completion:{(success) in
                        UIView.animate(withDuration: 0.5,
                                       delay: 0.0,
                                       usingSpringWithDamping: 0.3,
                                       initialSpringVelocity: 0.5,
                                       options: [],
                                       animations:
                                        {
                                            //STACKVIEW
                                            self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0).concatenating(translateEffect)
                                        },
                                       completion: {(success) in
                                        UIView.animate(withDuration: 0.5,
                                                       delay: 0.0,
                                                       usingSpringWithDamping: 0.3,
                                                       initialSpringVelocity: 0.5,
                                                       options: [],
                                                       animations:
                                            {
                                                //STACKVIEW
                                                self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0).concatenating(translateEffect)
                                            },
                                                       completion: nil)
        })
    })
}
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    //MARK: Enviar a traves del segue informacion
    @IBAction func rattingPressed(_ sender: UIButton) {
        switch sender.tag {
            
        case 1:
            ratingSelected = "dislike"
            backgroundRatingSelected = firstButton.backgroundColor!
        case 2:
            ratingSelected = "good"
            backgroundRatingSelected = secondButton.backgroundColor!
        case 3:
            ratingSelected = "great"
            backgroundRatingSelected = thirdButton.backgroundColor!
            colored = "\(backgroundRatingSelected)"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
    }
    
    
    
    
    
    
    
    
    
    
    

}
