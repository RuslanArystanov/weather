//
//  DetailViewController.swift
//  weather
//
//  Created by Руслан Арыстанов on 03.01.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var weatherDescriptionLabel: UILabel!
    
    var cityName = ""
    var temp = 0.0
    var weatherDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityNameLabel.text = cityName
        tempLabel.text = String(temp.rounded())
        weatherDescriptionLabel.text = weatherDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
