//
//  MainTableViewController.swift
//  weather
//
//  Created by Руслан Арыстанов on 23.12.2024.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var activityIndicator: UIActivityIndicatorView!
    var weatherCityes: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        Task {
            let fetchedWeather = await DataManager.share.getWeatherForecast()
            
            DispatchQueue.main.async {
                self.weatherCityes = fetchedWeather
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherCityes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let weather = weatherCityes[indexPath.row]
        
        content.secondaryText = weather.location.region
        content.text = weather.location.country
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {return}
        guard let index = tableView.indexPathForSelectedRow else {return}
        
        detailVC.cityName = weatherCityes[index.row].location.region
        detailVC.temp = weatherCityes[index.row].current.temp_c
        detailVC.weatherDescription = weatherCityes[index.row].current.condition.text
    }
}
