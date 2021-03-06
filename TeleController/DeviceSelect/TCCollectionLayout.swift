//
//  TCCollectionLayout.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/22.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit

class TCCollectionLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = CGSize.init(width: CGFloat(floorf(Float((ScreenW-40)/3.0))), height: CGFloat(floorf(Float((ScreenW-40)/3.0))))
        minimumLineSpacing = 10.0
        minimumInteritemSpacing = 10.0
        sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        scrollDirection = .vertical
        
    }
}
