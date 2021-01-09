//
//  RootViewModel.swift
//  MVVMRxSwiftTutorialYoutube
//
//  Created by 신동규 on 2021/01/10.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "Donggyu News"
    
    private let articleService:ArticleServiceProtocol
    
    init(articleService:ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        articleService.fetchNews().map { $0.map { ArticleViewModel(article: $0) } }
    }
}
