//
// Created by Morita Jun on 2018/04/01.
// Copyright (c) 2018 KamuiProject. All rights reserved.
//

import Foundation
import APIKit

// DataParserプロとこるに準拠するように定義
// parse(data:)関数ではそのままDataを返すようにする

// NOTE: APIKitのver4.0(開発中)からこれは不要になるかも
final class DecodableDataParser: DataParser {
    var contentType: String? { return "application/json" }
    func parse(data: Data) throws -> Any { return data }
}
