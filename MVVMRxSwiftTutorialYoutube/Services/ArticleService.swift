//
//  ArticleService.swift
//  MVVMRxSwiftTutorialYoutube
//
//  Created by 신동규 on 2021/01/10.
//

import Foundation
import Alamofire
import RxSwift

protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}


class ArticleService: ArticleServiceProtocol {
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let articles = articles {
                    observer.onNext(articles)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion:@escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&from=2020-12-09&sortBy=publishedAt&apiKey=bb8e4fcfd4bc4ea4a1ba2b1b105a592f"
        
        
        guard let url = URL(string: urlString) else { return completion(NSError(domain: "donggyu9410", code: 404, userInfo: nil), nil)}
        
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }
            
            if let articles = response.value?.articles {
                return completion(nil, articles)
            }
        }
        
    }
}
