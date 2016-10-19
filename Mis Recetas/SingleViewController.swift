//
//  SingleViewController.swift
//  Mis Recetas
//
//  Created by Edu on 14/10/16.
//  Copyright © 2016 Edu. All rights reserved.
//

import UIKit


//  ESTO ES LO MISMO QUE VIEWCONTROLLER PERO EN VEZ DE CREANDO UNA TABLEVIEWCONTROLLER,
//  USANDO UN VIEWCONTROLLER Y AÑADIENDO UNA TABLA Y UNA CELDA


class SingleViewController: UIViewController {

    var recipes : [Recipe] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //  Esto se implementa así para asignar la tabla a la vista o arrastrando con ctrl
        //  a el mismo view controller(circulito amarillo)
        /*
        self.tableView.dataSource = self
        self.tableView.delegate = self
        */
        
        
        var recipe = Recipe(name: "Tortilla de Patatas", image: #imageLiteral(resourceName: "Tortilla"), time: 20, ingredients: ["Patatas", "Huevos", "Cebolla"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza", image: #imageLiteral(resourceName: "Pizza"), time: 30, ingredients: ["Queso", "Tromate Frito", "Carne Picada", "Salsa Barbacoa", "Bacon"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar", image: #imageLiteral(resourceName: "EnsaladaCesar"), time: 20, ingredients: ["Lechuga", "Tomate", "Cebolla", "maiz", "Salsa Cesar"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con Queso", image: #imageLiteral(resourceName: "Hamburgesa"),  time: 20, ingredients: ["Carne Picada", "Huevos", "Cebolla", "Pan de Hamburguesa", "Queso"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SingleViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }
}
