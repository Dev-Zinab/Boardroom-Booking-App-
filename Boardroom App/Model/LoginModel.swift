//
//  LoginModel.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 24/02/2024.
//

import Foundation

struct LoginResponse: Codable{
    let token: String?
    let message: String?
    let success: Bool?
}
