//
//  TagsPresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain

class TagsPresenter {
    var viewController: ITagsViewable?
}

extension TagsPresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? TagsModel.Response {
            var viewModel = TagsModel.PresentionModel()
            viewModel.transponderList = responseModel.transponderList
            if let msg = responseModel.message {
                viewModel.message = msg
                 viewController?.getTagsSuccess(viewModel: viewModel)
               
            } else {
                
                 viewController?.getTagsFailed(viewModel: viewModel)
            }
        }
    }
    
    func onError(err: APIError) {
        print("onError: ", err)
        var viewModel = TagsModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.getTagsFailed(viewModel: viewModel)
    }
}
