//
//  ProductResponse.swift
//  mitro_app
//
//  Created by Ankit on 31/08/26.
//

import Foundation

struct ProductResponse: Codable {
    let products: [ProductModel]
    let total: Int
    let skip: Int
    let limit: Int
}

struct ProductModel: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: DimensionsModel
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [ReviewModel]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: MetaModel
    let images: [String]
    let thumbnail: String
}

struct DimensionsModel: Codable {
    let width: Double
    let height: Double
    let depth: Double
}

struct ReviewModel: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}

struct MetaModel: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String
}
