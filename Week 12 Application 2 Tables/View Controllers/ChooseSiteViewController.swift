//
//  ChooseSiteViewController.swift
//  Week 12 Application 2 Tables
//
//  Created by Xcode User on 2018-11-27.
//  Copyright © 2018 Sheridancollege. All rights reserved.
//

import UIKit

class ChooseSiteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listData = ["Jays", "Leafs", "Raptors", "Marlies", "FC"]
    var imageData = ["jays.jpg", "leafs.png", "raptors.jpg", "marlies.jpeg", "fc.png"]
    var siteData = ["http://www.bluejays.com",
                    "http://www.torontomapleleafs.com",
                    "http://www.torontoraptors.com",
                    "http://marlies.ca",
                    "https://www.torontofc.ca"]
    
    @IBAction func unwindToChooseViewController(sender: UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        
        tableCell.primaryLabel.text = listData[rowNum]
        tableCell.secondaryLabel.text = siteData[rowNum]
        tableCell.myImageView.image = UIImage(named: imageData[rowNum])
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        mainDelegate.selectedURL = siteData[indexPath.row]
        
        performSegue(withIdentifier: "ChooseSegueToView", sender: nil)
    }
    
}
