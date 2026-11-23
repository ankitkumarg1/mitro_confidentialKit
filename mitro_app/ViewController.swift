//
//  ViewController.swift
//  mitro_app
//
//  Created by Ankit on 30/08/26.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let viewModel = ProductVM()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchProduct()
    }

    private func bindViewModel() {
            viewModel.$products
                .receive(on: DispatchQueue.main)
                .sink { products in
                    print("Products:", products)
                }
                .store(in: &cancellables)
        }

}

