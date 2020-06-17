//
//  FirstTabControllerHomeVC.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 14/06/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit
import SideMenu


class FirstTabControllerHomeVC: UIViewController {
    
    var menu: SideMenuNavigationController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PresentSideMenu()
        
    }
    
    @IBAction func didtapMenu(){
        
        present(menu!, animated: true)
        
    }
    
    @IBAction func didSignOut(){
        
    print("hello")
        
    
    }
    
    func PresentSideMenu()  {
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }

}


class MenuListController: UITableViewController {
    
    
    var items = ["About","Logout"]
    
    let darkcolor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        
    override func viewDidLoad() {
        super .viewDidLoad()
        
        
        tableView.backgroundColor = darkcolor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkcolor
        return cell
        
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
         
        
    }
    

}
