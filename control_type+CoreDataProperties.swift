//
//  Control_type+CoreDataProperties.swift
//  TeleController
//
//  Created by yetaiwen on 2018/1/3.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//
//

import Foundation
import CoreData


extension control_type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<control_type> {
        return NSFetchRequest<control_type>(entityName: "control_type")
    }

    @NSManaged public var define_ID: String?
    @NSManaged public var icn_img: String?
    @NSManaged public var ID: Int16
    @NSManaged public var name_ch: String?
    @NSManaged public var name_en: String?
    @NSManaged public var template_file: String?

}
