//
//  CardViewCell.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/17.
//

import UIKit
import VerticalCardSwiper

class CardViewCell: CardCell {
    
    //73

    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopGenreLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    //親クラス(CardCell)のメソッドを使用（オーバーライド）
    override func prepareForReuse() {
        
        super.prepareForReuse()
    }
    
    
    //背景色をランダムな値によって設定する
    public func setRandomBackgroundColor() {
        
        let randomRed: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        self.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    
    override func layoutSubviews() {
        //cellの角
        self.layer.cornerRadius = 15
        super.layoutSubviews()
    }
    
}
