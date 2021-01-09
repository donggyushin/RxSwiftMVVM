//
//  ArticleViewModel.swift
//  MVVMRxSwiftTutorialYoutube
//
//  Created by 신동규 on 2021/01/10.
//

import Foundation

struct ArticleViewModel {
    private let article:Article
    
    var imageUrl:String? {
        return article.urlToImage
    }
    
    var title:String? {
        return article.title
    }
    
    var description:String? {
        return article.description
    }
    
    init(article:Article) {
        self.article = article
    }
}
