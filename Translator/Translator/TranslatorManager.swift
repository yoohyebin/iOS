//
//  TranslatorManager.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/12.
//

import Foundation
import Alamofire    // AFNetworking, URLSession

struct TranslatorManager{
    var sourceLanguage: Language = .ko
    var targetLanguage: Language = .en

    func translate(_ text: String, _ completionHandler: @escaping (String) -> Void){
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else { return }

        let requestModel = TranslateRequestModel(
            source: sourceLanguage.languageCode,
            target: targetLanguage.languageCode,
            text: text
        )
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "",
            "X-Naver-Client-Secret": ""
        ]
        
        AF
            .request(url,
                     method: .post,
                     parameters: requestModel,
                     headers: headers)
            .responseDecodable(of: TranslateReponseModel.self){ response in
                switch response.result{
                case .success(let result):
                    completionHandler(result.translatedText)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
