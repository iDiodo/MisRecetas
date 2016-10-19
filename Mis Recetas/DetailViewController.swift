//
//  DetailViewController.swift
//  Mis Recetas
//
//  Created by Edu on 15/10/16.
//  Copyright © 2016 Edu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.recipeImageView.image = self.recipe.image
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        //Elimina las lineas de separadores despues de la última fila usada
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        self.title = recipe.name
        
        
        //Calcula el tamaño exacto de cada celda para que se ajuste a su contenido y lo reenderice dinamicamente
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //Añadir la imagen actualizada del rating
        let image = UIImage(named: self.recipe.rating)
        let backgroundColor = UIColor()
        self.ratingButton.setImage(image, for: .normal)
        
        
    }
    //Quitar la barra de estado del dispositivo
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    //Para no ocultar la barra de navegación al deslizar scroll y que si se haga en viewController principal
    
    override func viewWillAppear(_ animated: Bool) {// LA Func viewWillAppear es para llamarla cada vez que se va a esta vista
        super.viewWillAppear(animated)
        //Para ocultar la barra de navegación al deslizar scroll
        navigationController?.hidesBarsOnSwipe = false
        //Si estaba oculta la mostramos
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        
        if let reviewVC = segue.source as? ReviewViewController{
            
            
            if let rating = reviewVC.ratingSelected{
                
                self.recipe.rating = rating
                let image = UIImage(named: self.recipe.rating)
                //let ratingBackgroundColor = UIImage(named: "\(backgroundRatingSelected)")
                self.ratingButton.setImage(image, for: .normal)
                //self.ratingButton.backgroundColor = ratingBackgroundColor
                
            }
        }
    }
}

extension DetailViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre: "
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo: "
                cell.valueLabel.text = "\(self.recipe.time!) min"
                /*
            case 2:
                cell.keyLabel.text = "Favorita: "
                if self.recipe.isFavourite{
                    cell.valueLabel.text = "Si"
                }else{
                    cell.valueLabel.text = "No"
                }
                 */
            default:
                break
            }
        case 1:
            if indexPath.row == 0{
                cell.keyLabel.text = ""
            }else{
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0{
                cell.keyLabel.text = ""
            }else{
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
    
    
}

extension DetailViewController: UITableViewDelegate{
    
}
