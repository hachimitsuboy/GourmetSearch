//
//  ShopModel.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/17.
//

import Foundation

class ShopModel: Codable{
    
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
    
    
    
}
