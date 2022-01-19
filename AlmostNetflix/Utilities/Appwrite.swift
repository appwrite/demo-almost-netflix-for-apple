//
//  Appwrite.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 23/12/2021.
//

import Foundation
import AppwriteModels
import Appwrite

class AppwriteService {
    let client: Client
    let database: Database
    let account: Account
    let storage: Storage
    let avatars: Avatars
    
    static let shared = AppwriteService()
    
    init() {
        client = Client()
            .setEndpoint("https://demo.appwrite.io/v1")
            .setProject("almostNetflix2")
            .setSelfSigned()
        
        database = Database(client)
        account = Account(client)
        storage = Storage(client)
        avatars = Avatars(client)
    }
}
