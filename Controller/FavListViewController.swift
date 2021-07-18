//
//  FavListViewController.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/17.
//

import UIKit
import SDWebImage

class FavListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var likeShopArray = [ShopModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "likeShopModelArray") != nil{
            if let storedData = UserDefaults.standard.object(forKey: "likeShopModelArray") as? Data {
                if let unarchivedObject = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData) as? [ShopModel] {
                    likeShopArray = unarchivedObject
                    print(likeShopArray.count)
                }
            }
        }else{
            print("お気に入り登録が行われていません")
            return
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeShopArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let logoImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let shopNameLabel = cell.contentView.viewWithTag(2)as! UILabel
        let shopGenreLabel = cell.contentView.viewWithTag(3)as! UILabel
        
        logoImageView.sd_setImage(with: URL(string: likeShopArray[indexPath.row].shopLogoImage), completed: nil)
        
        shopNameLabel.text = "店名:\(likeShopArray[indexPath.row].shopName)"
        shopGenreLabel.text = "ジャンル:\(likeShopArray[indexPath.row].shopGenre)"
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
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
