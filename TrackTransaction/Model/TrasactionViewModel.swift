//
//  TrasactionViewModel.swift
//  TrackTransaction
//
//  Created by Poornima on 03/07/21.
//

import Foundation
struct TransactionRoot : Codable {
    let status : String?
    let statusCode : Int?
    let data : TransactionData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case statusCode = "statusCode"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        data = try values.decodeIfPresent(TransactionData.self, forKey: .data)
    }
}
struct TransactionData : Codable {
    let message : String?
    let transactiontime : String?
    let transactiondate : String?
    let transactiongmtdate : String?
    let remarks : String?
    let timeline : [Timeline]?
    let paymentId : String?
    let paymentmodedescription : String?
    let paymentmode : String?
    let totalsendamount : Int?
    let sendamount : Int?
    let receiveamount : Double?
    let commission : Int?
    let tax : Int?
    let othercharges : Int?
    let sendcurrency : String?
    let receivecurrency : String?
    let customermobile : String?
    let customerno : String?
    let customerid : String?
    let customercountry : String?
    let customername : String?
    let customeremail : String?
    let customeraddress : String?
    let customernationality : String?
    let customeridissuedat : String?
    let customeridissueddate : String?
    let customeridexpirydate : String?
    let sourceofincome : String?
    let purposeoftxn : String?
    let reasonfortxn : String?
    let beneficiaryno : String?
    let beneficiaryname : String?
    let beneficiarymobile : String?
    let beneficiarynationality : String?
    let beneficiarycountry : String?
    let beneficiaryaccountno : String?
    let beneficiarybankname : String?
    let beneficiarybankbranchname : String?
    let beneficiarybankbranchaddress : String?
    let iban : String?
    let swift1 : String?
    let swift2 : String?
    let beneficiarybankbranchifsc : String?
    let routingcode : String?
    let status : String?
    let tokenno : String?
    let tokenexpirygmt : String?
    let bankid : String?
    let branchid : String?
    let bankrefid : String?
    let wirebankid : String?
    let pgbankid : String?
    let agenttxnrefno : String?
    let instrumenttype : String?
    let productcode : String?
    let receivemode : String?
    let receivemodedescription : String?
    let bankbranchsortcode : String?
    let rate : String?
    let trnnumber : String?
    let taxinvoiceno : String?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case transactiontime = "transactiontime"
        case transactiondate = "transactiondate"
        case transactiongmtdate = "transactiongmtdate"
        case remarks = "remarks"
        case timeline = "timeline"
        case paymentId = "paymentId"
        case paymentmodedescription = "paymentmodedescription"
        case paymentmode = "paymentmode"
        case totalsendamount = "totalsendamount"
        case sendamount = "sendamount"
        case receiveamount = "receiveamount"
        case commission = "commission"
        case tax = "tax"
        case othercharges = "othercharges"
        case sendcurrency = "sendcurrency"
        case receivecurrency = "receivecurrency"
        case customermobile = "customermobile"
        case customerno = "customerno"
        case customerid = "customerid"
        case customercountry = "customercountry"
        case customername = "customername"
        case customeremail = "customeremail"
        case customeraddress = "customeraddress"
        case customernationality = "customernationality"
        case customeridissuedat = "customeridissuedat"
        case customeridissueddate = "customeridissueddate"
        case customeridexpirydate = "customeridexpirydate"
        case sourceofincome = "sourceofincome"
        case purposeoftxn = "purposeoftxn"
        case reasonfortxn = "reasonfortxn"
        case beneficiaryno = "beneficiaryno"
        case beneficiaryname = "beneficiaryname"
        case beneficiarymobile = "beneficiarymobile"
        case beneficiarynationality = "beneficiarynationality"
        case beneficiarycountry = "beneficiarycountry"
        case beneficiaryaccountno = "beneficiaryaccountno"
        case beneficiarybankname = "beneficiarybankname"
        case beneficiarybankbranchname = "beneficiarybankbranchname"
        case beneficiarybankbranchaddress = "beneficiarybankbranchaddress"
        case iban = "iban"
        case swift1 = "swift1"
        case swift2 = "swift2"
        case beneficiarybankbranchifsc = "beneficiarybankbranchifsc"
        case routingcode = "routingcode"
        case status = "status"
        case tokenno = "tokenno"
        case tokenexpirygmt = "tokenexpirygmt"
        case bankid = "bankid"
        case branchid = "branchid"
        case bankrefid = "bankrefid"
        case wirebankid = "wirebankid"
        case pgbankid = "pgbankid"
        case agenttxnrefno = "agenttxnrefno"
        case instrumenttype = "instrumenttype"
        case productcode = "productcode"
        case receivemode = "receivemode"
        case receivemodedescription = "receivemodedescription"
        case bankbranchsortcode = "bankbranchsortcode"
        case rate = "rate"
        case trnnumber = "trnnumber"
        case taxinvoiceno = "taxinvoiceno"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        transactiontime = try values.decodeIfPresent(String.self, forKey: .transactiontime)
        transactiondate = try values.decodeIfPresent(String.self, forKey: .transactiondate)
        transactiongmtdate = try values.decodeIfPresent(String.self, forKey: .transactiongmtdate)
        remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
        timeline = try values.decodeIfPresent([Timeline].self, forKey: .timeline)
        paymentId = try values.decodeIfPresent(String.self, forKey: .paymentId)
        paymentmodedescription = try values.decodeIfPresent(String.self, forKey: .paymentmodedescription)
        paymentmode = try values.decodeIfPresent(String.self, forKey: .paymentmode)
        totalsendamount = try values.decodeIfPresent(Int.self, forKey: .totalsendamount)
        sendamount = try values.decodeIfPresent(Int.self, forKey: .sendamount)
        receiveamount = try values.decodeIfPresent(Double.self, forKey: .receiveamount)
        commission = try values.decodeIfPresent(Int.self, forKey: .commission)
        tax = try values.decodeIfPresent(Int.self, forKey: .tax)
        othercharges = try values.decodeIfPresent(Int.self, forKey: .othercharges)
        sendcurrency = try values.decodeIfPresent(String.self, forKey: .sendcurrency)
        receivecurrency = try values.decodeIfPresent(String.self, forKey: .receivecurrency)
        customermobile = try values.decodeIfPresent(String.self, forKey: .customermobile)
        customerno = try values.decodeIfPresent(String.self, forKey: .customerno)
        customerid = try values.decodeIfPresent(String.self, forKey: .customerid)
        customercountry = try values.decodeIfPresent(String.self, forKey: .customercountry)
        customername = try values.decodeIfPresent(String.self, forKey: .customername)
        customeremail = try values.decodeIfPresent(String.self, forKey: .customeremail)
        customeraddress = try values.decodeIfPresent(String.self, forKey: .customeraddress)
        customernationality = try values.decodeIfPresent(String.self, forKey: .customernationality)
        customeridissuedat = try values.decodeIfPresent(String.self, forKey: .customeridissuedat)
        customeridissueddate = try values.decodeIfPresent(String.self, forKey: .customeridissueddate)
        customeridexpirydate = try values.decodeIfPresent(String.self, forKey: .customeridexpirydate)
        sourceofincome = try values.decodeIfPresent(String.self, forKey: .sourceofincome)
        purposeoftxn = try values.decodeIfPresent(String.self, forKey: .purposeoftxn)
        reasonfortxn = try values.decodeIfPresent(String.self, forKey: .reasonfortxn)
        beneficiaryno = try values.decodeIfPresent(String.self, forKey: .beneficiaryno)
        beneficiaryname = try values.decodeIfPresent(String.self, forKey: .beneficiaryname)
        beneficiarymobile = try values.decodeIfPresent(String.self, forKey: .beneficiarymobile)
        beneficiarynationality = try values.decodeIfPresent(String.self, forKey: .beneficiarynationality)
        beneficiarycountry = try values.decodeIfPresent(String.self, forKey: .beneficiarycountry)
        beneficiaryaccountno = try values.decodeIfPresent(String.self, forKey: .beneficiaryaccountno)
        beneficiarybankname = try values.decodeIfPresent(String.self, forKey: .beneficiarybankname)
        beneficiarybankbranchname = try values.decodeIfPresent(String.self, forKey: .beneficiarybankbranchname)
        beneficiarybankbranchaddress = try values.decodeIfPresent(String.self, forKey: .beneficiarybankbranchaddress)
        iban = try values.decodeIfPresent(String.self, forKey: .iban)
        swift1 = try values.decodeIfPresent(String.self, forKey: .swift1)
        swift2 = try values.decodeIfPresent(String.self, forKey: .swift2)
        beneficiarybankbranchifsc = try values.decodeIfPresent(String.self, forKey: .beneficiarybankbranchifsc)
        routingcode = try values.decodeIfPresent(String.self, forKey: .routingcode)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tokenno = try values.decodeIfPresent(String.self, forKey: .tokenno)
        tokenexpirygmt = try values.decodeIfPresent(String.self, forKey: .tokenexpirygmt)
        bankid = try values.decodeIfPresent(String.self, forKey: .bankid)
        branchid = try values.decodeIfPresent(String.self, forKey: .branchid)
        bankrefid = try values.decodeIfPresent(String.self, forKey: .bankrefid)
        wirebankid = try values.decodeIfPresent(String.self, forKey: .wirebankid)
        pgbankid = try values.decodeIfPresent(String.self, forKey: .pgbankid)
        agenttxnrefno = try values.decodeIfPresent(String.self, forKey: .agenttxnrefno)
        instrumenttype = try values.decodeIfPresent(String.self, forKey: .instrumenttype)
        productcode = try values.decodeIfPresent(String.self, forKey: .productcode)
        receivemode = try values.decodeIfPresent(String.self, forKey: .receivemode)
        receivemodedescription = try values.decodeIfPresent(String.self, forKey: .receivemodedescription)
        bankbranchsortcode = try values.decodeIfPresent(String.self, forKey: .bankbranchsortcode)
        rate = try values.decodeIfPresent(String.self, forKey: .rate)
        trnnumber = try values.decodeIfPresent(String.self, forKey: .trnnumber)
        taxinvoiceno = try values.decodeIfPresent(String.self, forKey: .taxinvoiceno)
    }

}
struct Timeline : Codable {
    let stage : String?
    let timestamp : String?

    enum CodingKeys: String, CodingKey {

        case stage = "stage"
        case timestamp = "timestamp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stage = try values.decodeIfPresent(String.self, forKey: .stage)
        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
    }

}


