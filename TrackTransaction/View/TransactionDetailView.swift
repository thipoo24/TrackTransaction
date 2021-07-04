//
//  TransactionDetailView.swift
//  TrackTransaction
//
//  Created by Poornima on 03/07/21.
//

import UIKit
import MaterialComponents

class TransactionDetailView: UIViewController,UITextFieldDelegate {
   
    @IBOutlet weak var detailsScroll: UIScrollView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var sentAmt: UILabel!
    @IBOutlet weak var beneNm: UILabel!
    @IBOutlet weak var beneBankVal: UILabel!
    @IBOutlet weak var trNmLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var sentFrAmt: UILabel!
    @IBOutlet weak var custSupportBtn: UIButton!
    @IBOutlet weak var accNum: MDCBaseTextField!
    @IBOutlet weak var taxAmt: MDCBaseTextField!
    @IBOutlet weak var sentCurrAmt: MDCBaseTextField!
    @IBOutlet weak var recCurrAmt: MDCBaseTextField!
    @IBOutlet weak var trIdText: MDCBaseTextField!
    let barColor = UIColor(red: 17/255.0, green: 58/255.0, blue: 96/255.0, alpha: 1.0)
   
    var grayFontAttr = [NSAttributedString.Key.font: UIFont(name:"TimesNewRomanPS-BoldMT" , size: 19.0),NSAttributedString.Key.foregroundColor: UIColor.white]
    var transactDetails : TransactionData?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = barColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        setModalPresent()
        custSupportBtn.setBorderColor(borderColor: borderClr, width: 1.0, radius: 5.0)
        detailsView.setRadius(radius: 10.0)
        detailsScroll.setRadius(radius: 10.0)
        detailsScroll.isScrollEnabled = true
        detailsScroll.contentSize = CGSize(width: self.detailsView.frame.size.width, height: detailsView.frame.height)
        loadUI()
        
        trIdText.label.text = "TransactionId"
        trIdText.setFloatingLabelColor(.lightGray, for: .normal)
        sentCurrAmt.label.text = "Sending Amount"
        sentCurrAmt.setFloatingLabelColor(.lightGray, for: .normal)
        recCurrAmt.label.text = "Received"
        recCurrAmt.setFloatingLabelColor(.lightGray, for: .normal)
        taxAmt.label.text = "Fees, Tax & Other Charges"
        taxAmt.setFloatingLabelColor(.lightGray, for: .normal)
        accNum.label.text = "Account Number"
        accNum.setFloatingLabelColor(.lightGray, for: .normal)
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func loadUI(){
        beneNm.setRadius()
        var bankDetails = ""
        guard let name = (transactDetails?.beneficiaryname) else {
            return
        }
        guard let amt = (transactDetails?.receiveamount) else {
            return
        }
        guard  let bankNm = (transactDetails?.beneficiarybankname) else {
            return
        }
        guard let accNumVal = (transactDetails?.beneficiaryaccountno) else {
            return
        }
        guard let refNum =  (transactDetails?.agenttxnrefno) else {
            return
        }
        guard  let recCurrency = (transactDetails?.receivecurrency)  else {
            return
        }
        
        
        sentAmt.text = String(format: "%.2f", amt)+" "+recCurrency
        beneNm.text = String(name.prefix(2))
        bankDetails = "Sent To \n\n"
        
        bankDetails = bankDetails + name + "\n"
        bankDetails = bankDetails + bankNm + "\n"
        bankDetails = bankDetails + accNumVal + "\n"
        bankDetails = bankDetails + "Ref No: " + refNum
        print("the bank",bankDetails)
        let attributedDetails = NSMutableAttributedString(string: bankDetails)
        let rang1 = (bankDetails as NSString).range(of: name)
        attributedDetails.addAttributes(grayFontAttr as [NSAttributedString.Key : Any], range: rang1)
        beneBankVal.attributedText = attributedDetails
        guard let actSentAmt = transactDetails?.totalsendamount else {
            return
        }
        print("the total sent amt",String(actSentAmt))
        guard let currency = transactDetails?.sendcurrency else {
            return
        }
        sentFrAmt.text = "Sent "+String(format: "%.3f", Float(actSentAmt))+" "+currency
        guard let sentTime = transactDetails?.transactiondate else {
            return
        }
        timeLbl.text = sentTime
        guard let trId = transactDetails?.paymentId else {
            return
        }
        trIdText.text = trId
        guard let recAmt = transactDetails?.sendamount else {
            return
        }
        sentCurrAmt.text = String(format: "%.3f", Float(recAmt))+" "+currency
        recCurrAmt.text = String(format: "%.2f", amt)+" "+recCurrency
        guard let taxCharge = (transactDetails?.tax)
        else {
            return
        }
        guard let commisn = (transactDetails?.commission) else {
            return
        }
        guard let otherCh =  (transactDetails?.othercharges) else {
            return
        }
        let otherCharges =  taxCharge + commisn + otherCh
        taxAmt.text = String(format: "%.3f",Float(otherCharges)) + " " + currency
        accNum.text = accNumVal

    }
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
