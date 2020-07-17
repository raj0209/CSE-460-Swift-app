//
//  Model.swift
//  BMIPhase1
//
//  Created by Apple on 25/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
class Model
{
    func calculateBMI(heightDouble: Double, weightDouble: Double) -> Double
    {
        return (weightDouble/(heightDouble * heightDouble))*703
    }
}
