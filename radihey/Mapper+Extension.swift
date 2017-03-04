//
//  Mapper+Extension.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import ObjectMapper
import FirebaseDatabase

extension Mapper {
    public func map(snapshot: FIRDataSnapshot) -> N? {
        guard var json = snapshot.value as? [String : AnyObject] else { return nil }
        json["id"] = snapshot.key as AnyObject
        if let mappingObject = Mapper<N>().map(JSON: json) {
            return mappingObject
        }
        return nil
    }
}
