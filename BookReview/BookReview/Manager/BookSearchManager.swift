//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 유혜빈 on 2023/01/13.
//

import Alamofire
import Foundation

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "",
            "X-Naver-Client-Secret": ""
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self){response in
                switch response.result{
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            }
            .resume()
    }
}
