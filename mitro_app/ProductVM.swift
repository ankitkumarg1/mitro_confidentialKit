//
//  ProductVM.swift
//  mitro_app
//
//  Created by Ankit on 31/08/26.
//

import Foundation
import Combine

class ProductVM  {

    @Published private(set) var products: [ProductModel] = []
    @Published private(set) var errorMessage: String?


    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    private let sessionManager: SessionManager

    init(sessionManager: SessionManager = SessionManager()) {
            self.sessionManager = sessionManager
        }


    func fetchProduct() {
            sessionManager.api(endPoint: .product, httpMethod: .get)
            .sink { [unowned self] completion in
                switch completion {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        print(error)
                    case .finished:
                        print("finished")
                }
            } receiveValue: {[unowned self] (response: ProductResponse) in
                self.products = response.products
                print(response.products)
            }
            .store(in: &cancellables)
    }







}
