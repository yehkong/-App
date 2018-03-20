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
        super .prepare()
        itemSize = CGSize.init(width: (ScreenW - 40)/3, height: (ScreenW - 40)/3)
        minimumLineSpacing = 10.0
        minimumInteritemSpacing = 10.0
        sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        scrollDirection = .vertical
    }
}
