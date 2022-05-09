//
//  SecondDataPassProtocol.swift
//  Bitcode Training App
//
//  Created by Mac on 12/04/22.
//

import Foundation
// MARK: Protocol For Back Data Passing
protocol SecondDataPassProtocol: AnyObject{
    func passData(name: String?, technology: String?, age: String?, phoneNo: String?)
}

