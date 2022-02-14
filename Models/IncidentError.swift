//
//  File.swift
//  Abstract Breathing
//
//  Created by John Nelson on 2/7/22.
//

import Foundation

enum IncidentError: Error {
    case wrongDataFormat(error: Error)
    case missingData
    case creationError
    case batchInsertError
    case batchDeleteError
    case persistentHistoryChangeError
    case unexpectedError(error: Error)
}

extension IncidentError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongDataFormat(let error):
            return NSLocalizedString("Could not digest the fetched data. \(error.localizedDescription)", comment: "")
        case .missingData:
            return NSLocalizedString("Found and will discard an incident missing some required data.", comment: "")
        case .creationError:
            return NSLocalizedString("Failed to create a new Incident object.", comment: "")
        case .batchInsertError:
            return NSLocalizedString("Failed to execute a batch insert request.", comment: "")
        case .batchDeleteError:
            return NSLocalizedString("Failed to execute a batch delete request.", comment: "")
        case .persistentHistoryChangeError:
            return NSLocalizedString("Failed to execute a persistent history change request.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}

extension IncidentError: Identifiable {
    var id: String? {
        errorDescription
    }
}
