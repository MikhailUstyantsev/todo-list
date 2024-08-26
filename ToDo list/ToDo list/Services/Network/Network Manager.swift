//
//  Network Manager.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 24.08.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func retrieveTasks(from url: URL) async throws -> Tasks {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(Tasks.self, from: data)
    }
}
