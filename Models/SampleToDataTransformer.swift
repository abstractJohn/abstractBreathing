//
//  SymptomTransformer.swift
//  Abstract Breathing
//
//  Created by John Nelson on 2/7/22.
//

import Foundation
import HealthKit

class SampleToDataTransformer: NSSecureUnarchiveFromDataTransformer {
    let name: NSValueTransformerName = NSValueTransformerName(rawValue: "SampleToDataTransformer")
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override class func transformedValueClass() -> AnyClass {
        return HKSample.self
    }
    
    override class var allowedTopLevelClasses: [AnyClass] {
        return [HKSample.self]
    }

    override func transformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            fatalError("Wrong data type: value must be a Data object; received \(type(of: value))")
        }
        return super.transformedValue(data)
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let sample = value as? HKSample else {
            fatalError("Wrong data type: value must be a HKSample object; received \(type(of: value))")
        }
        return super.reverseTransformedValue(sample)
    }
}

extension SampleToDataTransformer {
    static let colorToDataTransformer = NSValueTransformerName(rawValue: "SymptomToDataTransformer")
}
