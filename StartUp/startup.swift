//
//  startup.swift
//  Abstract Breathing
//
//  Created by John Nelson on 2/4/22.
//

import Foundation
import HealthKit

import HealthKitUI

class HealthKitSetupAssistant {
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }

    class func authorizeHealthKit() {
        //1. Check to see if HealthKit Is Available on this device
        guard HKHealthStore.isHealthDataAvailable() else {
            //completion(false, HealthkitSetupError.notAvailableOnDevice)
            return
        }

        //2. Prepare the data types that will interact with HealthKit
        guard
        // Symptoms
        let nausea = HKObjectType.categoryType(forIdentifier: .nausea),
        let vomiting = HKObjectType.categoryType(forIdentifier: .vomiting),
        let chestTightness = HKObjectType.categoryType(forIdentifier: .chestTightnessOrPain),
        let coughing = HKObjectType.categoryType(forIdentifier: .coughing),
        let dizziness = HKObjectType.categoryType(forIdentifier: .dizziness),
        let shortnessOfBreath = HKObjectType.categoryType(forIdentifier: .shortnessOfBreath),
        let wheezing = HKObjectType.categoryType(forIdentifier: .wheezing),
        // Events
        let inhalerUsage = HKObjectType.quantityType(forIdentifier: .inhalerUsage)

        else {
        //completion(false, HealthkitSetupError.dataTypeNotAvailable)
        return
        }
        let healthKitTypes: Set<HKSampleType> = [nausea, vomiting, chestTightness, coughing, dizziness, shortnessOfBreath, wheezing, inhalerUsage]

        //4. Request Authorization
        HKHealthStore().requestAuthorization(toShare: healthKitTypes,
            read: healthKitTypes) { (success, error) in
            //completion(success, error)
            }
        }
}

