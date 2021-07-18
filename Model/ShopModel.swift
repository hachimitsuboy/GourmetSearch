//
//  ShopModel.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/17.
//

import Foundation

class ShopModel: NSObject, NSCoding{
    
    var imageUrlString = String()
    var shopName = String()
    var shopGenre = String()
    var shopLogoImage = String()
    var shopUrlString = String()
    
    init(imageUrlString:String, shopName:String, shopGenre:String, shopLogoImage:String, shopUrlString:String) {
        
        self.imageUrlString = imageUrlString
        self.shopName = shopName
        self.shopGenre = shopGenre
        self.shopLogoImage = shopLogoImage
        self.shopUrlString = shopUrlString
        
    }
    //NSKeyedArchiverに呼び出されるシリアライズ処理（NSCodingで定義されている）
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.imageUrlString, forKey: "imageUrlString")
        aCoder.encode(self.shopName, forKey: "shopName")
        aCoder.encode(self.shopGenre, forKey: "shopGenre")
        aCoder.encode(self.shopLogoImage, forKey: "shopLogoImage")
        aCoder.encode(self.shopUrlString, forKey: "shopUrlString")
        
    }
    
    //NSKeyedArchiverに呼び出されるでシリアライズ処理(NSCodingで処理される)
    required init?(coder aDecoder: NSCoder){
        imageUrlString = aDecoder.decodeObject(forKey: "imageUrlString") as! String
        shopName = aDecoder.decodeObject(forKey: "shopName") as! String
        shopGenre = aDecoder.decodeObject(forKey: "shopGenre") as! String
        shopLogoImage = aDecoder.decodeObject(forKey: "shopLogoImage") as! String
        shopUrlString = aDecoder.decodeObject(forKey: "shopUrlString") as! String
        
        
    }
    
    
    
    
}
