//
//  SelectViewController.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/17.
//

import UIKit
import VerticalCardSwiper
import SDWebImage
import PKHUD
import ChameleonFramework



class SelectViewController: UIViewController,VerticalCardSwiperDelegate,VerticalCardSwiperDatasource {
   
    var shopModelArray = [ShopModel]()
    var likeShopModelArray = [ShopModel]()
    
    
    @IBOutlet weak var cardSwiper: VerticalCardSwiper!
    override func viewDidLoad() {
        super.viewDidLoad()

        cardSwiper.delegate = self
        cardSwiper.datasource = self
        cardSwiper.register(nib: UINib(nibName: "CardViewCell", bundle: nil), forCellWithReuseIdentifier: "CardViewCell")
        cardSwiper.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        shopModelArray.count
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: index) as? CardViewCell{
            
            
            
            verticalCardSwiperView.backgroundColor = UIColor.randomFlat()
            view.backgroundColor = verticalCardSwiperView.backgroundColor
            
            let shopName = shopModelArray[index].shopName
            let shopGenre = shopModelArray[index].shopGenre
          
            cardCell.setRandomBackgroundColor()
            
            cardCell.shopNameLabel.text = "店名:\(shopName)"
            cardCell.shopNameLabel.textColor = .white
            cardCell.shopGenreLabel.text = "ジャンル:\(shopGenre)"
            cardCell.shopGenreLabel.textColor = .white
            
            cardCell.shopImageView.sd_setImage(with: URL(string: shopModelArray[index].imageUrlString), completed: nil)
            
            return cardCell
        }
        
        return CardCell()
        
    }
    
    //willSwipeCardAwayを追記しないと、右にスワイプしたカードでも残り続ける
    func willSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        
        shopModelArray.remove(at: index)
    }
    
    
    func didSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        
        if swipeDirection == .Right{
            //右にスワイプされた時
            likeShopModelArray.append(shopModelArray[index])
            if UserDefaults.standard.object(forKey: "likeShopModelArray") != nil{
                
                if let storedData = UserDefaults.standard.object(forKey: "likeShopModelArray") as? Data {
                    if let unarchivedObject = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData) as? [ShopModel] {
                        likeShopModelArray = unarchivedObject
                    }
                }
//                likeShopModelArray = (UserDefaults.standard.object(forKey: "likeShopModelArray") as? [ShopModel])!
//                likeShopModelArray.append(shopModelArray[index])
//                UserDefaults.standard.set(likeShopModelArray, forKey: "likeShopModelArray")
            }else{
                //初めてのスワイプの時
                let likeShopModel = shopModelArray[index]
                likeShopModelArray.append(likeShopModel)
                
                let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: likeShopModelArray, requiringSecureCoding: false)
                
                UserDefaults.standard.set(archivedData, forKey: "likeShopModelArray")

            }
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        //前の画面に戻る
        dismiss(animated: true, completion: nil)

        
    }
    

}
