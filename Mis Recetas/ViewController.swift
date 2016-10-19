//
//  ViewController.swift
//  Mis Recetas
//
//  Created by Edu on 13/10/16.
//  Copyright © 2016 Edu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        
    }


    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        var recipe = Recipe(name: "Tortilla de Patatas", image: #imageLiteral(resourceName: "Tortilla"), time: 20, ingredients: ["Patatas", "Huevos", "Cebolla"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)

        recipe = Recipe(name: "Pizza", image: #imageLiteral(resourceName: "Pizza"), time: 30, ingredients: ["Queso", "Tromate Frito", "Carne Picada", "Salsa Barbacoa", "Bacon"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar", image: #imageLiteral(resourceName: "EnsaladaCesar"), time: 13, ingredients: ["Lechuga", "Tomate", "Cebolla", "maiz", "Salsa Cesar"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con Queso", image: #imageLiteral(resourceName: "Hamburgesa"),  time: 35, ingredients: ["Carne Picada", "Huevos", "Cebolla", "Pan de Hamburguesa", "Queso"], steps: ["Pelar 4 kg de patatas", "Batir 8 huevos", "Calentar aceite y freir patatas cortadas a lo fino", "Mezclar huevos batidos con patatas", "Añadir Cebolla", "Dar la vuelta a la tortilla para hacerla por el otro lado"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Gazpacho", image: #imageLiteral(resourceName: "Gazpacho"),  time: 13, ingredients: ["Tomate", "Pimiento Verde", "Pimiento Rojo", "Pepino", "Aceite", "Vinagre"], steps: ["Mezclar y batir  durante 1 min todos los ingredientes", "Añadir Hielo", "Batir durante un minuto"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Nuggets", image: #imageLiteral(resourceName: "Nuggets"),  time: 53, ingredients: ["Pechuga de Pollo", "Huevos", "Queso", "yogurt", "Nata", "Pan Rallado", "Pimienta", "Pan de Molde"], steps: ["Picar las pechugas", "Mezclar aceite, pollo, queso, pimienta y rebanada de pan de molde", "Rebozar y moldear los nugguets al gusto", "Calentar aceite y freir nuggets"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Fabada", image: #imageLiteral(resourceName: "Fabada"),  time: 240, ingredients: ["Judiones Blancos", "Chorizo", "Cebolla", "Tocino", "Morcilla", "Laurel"], steps: ["Echar las judias a una olla", "Echar el resto de ingredientes", "Rellenar con agua hasta dos dedo por encima", "No remover", "Rellenar un vasito de agua para asustar cada vez que el nivel de agua llegue a los ingredientes", "Cocer durante al menos 3 horas"])
        recipes.append(recipe)
    
    }
    
    //Es para llamarla cada vez que se va a esta vista
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Para ocultar la barra de navegación al deslizar scroll
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    
    
    //Quitar la barra de estado del dispositivo
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    //MARK: FUNCIONES DEL DELEGADO I
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        
        // MARK: Crear celda básica
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        */
        
        //Crear celda personalizada
        // 1- En icono flecha seleccionar custom
        // 2- En tableView e icono de regla cambiamos el tamaño de la celda
        // 3- En celda añadimos visualmente (storyboard) una imageView con sus constrains
        // 4- Crear archivo tipo TableViewCell y relacionarlo con la celda(RecipeCell)
        
        //Crear celda customizada
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) //añadir para customizar
            as! RecipeCellTableViewCell
        
        cell.nameLabel.text = recipe.name
        cell.thumbnailImageView.image = recipe.image
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        /* PARA HACER EL CIRCULO Y QUITARLO, 
         AUNQUE TB SE PUEDE HACER CON 
         STORYBOARD/ICONO_DNI/ADD_USER_DEFINED_RUNTIME_ATTRIBUTTES
         USANDO/layer.cornerRadius-num Y 
         EN_FLECHITA_ICONO/MARCAR_EL_CLIP_TO_BOUNDS(DEBAJO DE BACKGROUND)
         
        cell.thumbnailImageView.layer.cornerRadius = 42
        cell.thumbnailImageView.clipsToBounds = true
        */
        /*
        if recipe.isFavourite{
                cell.accessoryType = .checkmark
            }
            else{
                cell.accessoryType = .none
            }
        */
        
        
        
        return cell
        
    }
    
    //MARK: BORRADO --Este metodo Activa el deslizamiento de una celda
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //Pa borrar
        if editingStyle == .delete{
            self.recipes.remove(at: indexPath.row)//IndexPath.row es la posicion
        }
        
        //MARK: ACTUALIZAR
        
        //Este actualiza la pagina
        //self.tableView.reloadData()
        //Y este otro ademas le da efectos
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        

        
        //MARK: Compartir
        let shareAction = UITableViewRowAction.init(style: .default, title: "Share") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta \(self.recipes[indexPath.row].name!)"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1)
       
        //MARK: Borrar
        let deleteAction = UITableViewRowAction.init(style: .default, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1)
        
        return [shareAction, deleteAction]
    }
    
    
    //MARK: FUNCIONES DEL DELEGADO II
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*
        let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name,
                                                message: "Valora este plato",
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(cancelAction)
        
        
        //Este codigo es para elegir el color del boton del alert
        var favouriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite{
            favouriteActionTitle = "No Favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
            
        }
        
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            
            //Recuperamos el indexPath seleccionado
            if let indexPath = self.tableView.indexPathForSelectedRow{
                //Seleccionamos la receta
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectedRecipe
                }
            }
    }
}



















