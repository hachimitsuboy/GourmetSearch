//
//  ViewController.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/16.
//

import UIKit
import Alamofire
import SwiftyJSON
import PKHUD


class ViewController: UIViewController {
    
    
    
    //https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=cbfac9b6e9961b61&keyword=%E5%9B%9B%E6%9D%A1%E6%B2%B3%E5%8E%9F%E7%94%BA
    @IBOutlet weak var textField: UITextField!
    
    var imageUrlString = ""
    var shopName = ""
    var shopGenre = ""
    var shopModelArray = [ShopModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        if let location = textField.text{
            
            let urlString = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=cbfac9b6e9961b61&count=50&keyword=\(location)&order=4&format=json"
            
            startParse(urlString: urlString)
            
        }
        
        
    }
    
    func startParse(urlString:String){
        //初期化
        shopModelArray = []
        HUD.show(.progress)
        let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
//        print(encodeUrlString)
        
        AF.request(encodeUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { [self] response in
            
//            print("responseの結果:\(response)")
            
            
            switch response.result{
                
            case .success:
               
                let json:JSON = JSON(response.data as Any)
                var hitcount = json["results"]["results_returned"].string
                
                
                if Int(hitcount!)! > 50{
                    hitcount = "50"
                }
                
                for i in 0...Int(hitcount!)!-1{
                    
                    if json["results"]["shop"][i]["name"] != "" && json["results"]["shop"][i]["genre"]["name"] != "" && json["results"]["shop"][i]["photo"]["mobile"]["l"] != "" && json["results"]["shop"][i]["logo_image"] != "" && json["results"]["shop"][i]["urls"]["pc"] != ""{
                        
                        let shopModel = ShopModel(imageUrlString: json["results"]["shop"][i]["photo"]["mobile"]["l"].string!, shopName:json["results"]["shop"][i]["name"].string!, shopGenre:  json["results"]["shop"][i]["genre"]["name"].string!, shopLogoImage: json["results"]["shop"][i]["logo_image"].string!, shopUrlString: json["results"]["shop"][i]["urls"]["pc"].string!)
                        
                        shopModelArray.append(shopModel)
                        if shopModelArray.count == Int(hitcount!)!{
                            
                            //画面遷移
                            toSelectVC()
                        }
                    }
                }
                HUD.hide()
                
            case .failure:
                break
            }
        }
        
    }
    
    func toSelectVC(){
        
        performSegue(withIdentifier: "selectVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if textField.text != nil && segue.identifier=="selectVC"{
            
            let selectVC = segue.destination as! SelectViewController
            
            selectVC.shopModelArray = shopModelArray
        }
    }
    
    
    @IBAction func favList(_ sender: Any) {

        let favListVC = self.storyboard?.instantiateViewController(identifier: "favListVC")as! FavListViewController
        
        self.navigationController?.pushViewController(favListVC, animated: true)
    }
}

