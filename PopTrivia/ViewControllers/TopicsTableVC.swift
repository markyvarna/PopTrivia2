//
//  TopicsTableVC.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import UIKit

class TopicsTableVC: UITableViewController {
    
    //MOCK DATA
    var movieArray = ["Marvel", "DC", "Lucas Films"]
    var sportsArray = ["Football", "Soccer", "Golf"]
    var celebsArray = ["Donald Trump", "Tom Cruise", "Emma Stone"]
    var worldArray = ["Africa", "South America", "North America", "Europe"]
    var topic: String?

    var selectedArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let topic = topic else {return}
        if topic == "Movie" {
            loopy(array: movieArray)
        } else if topic == "Sports" {
            loopy(array: sportsArray)
        } else if topic == "World" {
            loopy(array: worldArray)
        } else if topic == "Celebs"{
            loopy(array: celebsArray)
        }
    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)

        cell.textLabel?.text = selectedArray[indexPath.row]
        

        return cell
    }
    

    func loopy(array: [String]) {
        for i in array {
            selectedArray.append(i)
        }
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }
    

}
