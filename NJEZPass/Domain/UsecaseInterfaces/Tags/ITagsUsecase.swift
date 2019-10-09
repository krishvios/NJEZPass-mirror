//
//  ITagsUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities

public protocol ITagsUsecase {
    func getTagsList(request: TagsModel.Request)
    func searchTagwithNumber(request: SearchTagsModel.Request)
}
