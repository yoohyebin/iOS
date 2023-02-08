//
//  SelectRegionViewModel.swift
//  FindCovidCenter
//
//  Created by 유혜빈 on 2023/01/09.
//

import Foundation
import Combine

class SelectRegionViewModel: ObservableObject {
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellables = Set<AnyCancellable>()    //disposeBag
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {[weak self] in
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]()
                },
                receiveValue: {[weak self] centers in
                    self?.centers = Dictionary(grouping: centers) { $0.sido }
                }
            )
            .store(in: &cancellables)   //disposed(by: disposeBag)
    }
}
