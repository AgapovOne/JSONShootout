//
//  Genome_Test.swift
//  JSONShootout
//
//  Created by Wane Wang on 10/28/16.
//  Copyright © 2016 SwiftBit. All rights reserved.
//

import XCTest
import ModelObjects
import Genome
import GenomeFoundation

class Genome_Test: XCTestCase {
    
    func testPerformance() {
        let json = try! self.data.makeNode()
        self.measure {
            guard let datas = json["ProgramList", "Programs"] else {
                XCTFail("do not get the correct data")
                return
            }
            let programs: [Program] = try! [Program](node: datas)
            XCTAssert(programs.count > 1000)
            
        }
    }
    
    private lazy var data:Data = {
        let path = Bundle(for: type(of: self)).url(forResource: "Large", withExtension: "json")
        let data = try! Data(contentsOf: path!)
        return data
    }()
    
}
