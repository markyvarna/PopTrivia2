//
//  GenresVC.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import UIKit

class GenresVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func moviesBP(_ sender: Any) {
        
    }
    
    @IBAction func celebsBP(_ sender: Any) {
        
    }
    @IBAction func sportsBP(_ sender: Any) {
        
    }
    
    @IBAction func worldBP(_ sender: Any) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToMovies" {
            let destinationvc = segue.destination as? TopicsTableVC
            destinationvc?.topic = "Movie"
        } else if segue.identifier == "goToSports" {
            let destinationvc = segue.destination as? TopicsTableVC
            destinationvc?.topic = "Sports"
        } else if segue.identifier == "goToCelebs" {
            let destinationvc = segue.destination as? TopicsTableVC
            destinationvc?.topic = "Celebs"
        } else if segue.identifier == "goToWorld" {
            let destinationvc = segue.destination as? TopicsTableVC
            destinationvc?.topic = "World"
        }
        
    }
    

}
