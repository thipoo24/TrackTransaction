//
//  ViewController.swift
//  TrackTransaction
//
//  Created by Poornima on 02/07/21.
//

import UIKit
import MaterialComponents

class HomeView: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var trackNumText: MDCOutlinedTextField!
    @IBOutlet weak var onTrackBtn: UIButton!
    var trVM = TransactionHomeVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        onTrackBtn.setRadius(radius:3.0)
        onTrackBtn.setBtnShadow()
        trackNumText.delegate = self
        styleTextfield()
        accessoryView()
        setIndicator(indicatorColor: UIColor.black)
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
       
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           self.view.endEditing(true)
           
           return true
           // return false
       }
    func accessoryView()  {
        let toolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        toolbar.sizeToFit()
     let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDone))
        let fontColor = [NSAttributedString.Key.foregroundColor: UIColor.black]
        doneButton.setTitleTextAttributes(fontColor, for: .normal)
        let items = [doneButton]
        toolbar.items = items
        trackNumText.inputAccessoryView = toolbar
      
        }
    
    @objc func onDone(){
        trackNumText.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end edit")
        trackNumText.setOutlineColor(UIColor.lightGray, for: .normal)
        trackNumText.setFloatingLabelColor(UIColor.lightGray, for: .normal)
        trackNumText.leadingAssistiveLabel.text = ""
        trackNumText.trailingView = nil
    }
    
    func styleTextfield(){
        trackNumText.label.text = "Transaction Number"
         trackNumText.setOutlineColor(UIColor.lightGray, for: .normal)
        trackNumText.setFloatingLabelColor(UIColor.lightGray, for: .normal)
        trackNumText.setLeadingAssistiveLabelColor(.clear, for:
                                                    .normal)
        trackNumText.leadingAssistiveLabel.text = ""
        trackNumText.trailingView = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        trackNumText.setOutlineColor(UIColor.lightGray, for: .editing)
        trackNumText.setFloatingLabelColor(UIColor.lightGray, for: .editing)
        trackNumText.leadingAssistiveLabel.text = ""
        trackNumText.trailingView = nil
    }

    @IBAction func onTrack(_ sender: Any) {
        if (trackNumText.text!.isEmpty) {
            showVCAlert(title: "", message: "Enter Transaction Number")
        }
        else {
            indicator.startAnimating()
        trVM.getTrasactionsDetails(taxRefNo: trackNumText.text!) { (success) in
            indicator.stopAnimating()
            if success == true {
                let detailView = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as! TransactionDetailView
                detailView.transactDetails = self.trVM.transactDetails
                let navi = UINavigationController(rootViewController: detailView)
                self.present(navi, animated: true, completion: nil)
            }
            else {
                self.showError(errorMsg:"Contact support team with this error")
            }
        }
        }
    }
    func showError(errorMsg:String){
        let errorImg = UIImage(named: "error")
        let errorImgView = UIImageView(image: errorImg)
        trackNumText.setOutlineColor(UIColor.red, for: .normal)
        trackNumText.setFloatingLabelColor(UIColor.red, for: .normal)
        trackNumText.setLeadingAssistiveLabelColor(UIColor.red, for: .normal)
        trackNumText.leadingAssistiveLabel.text = errorMsg
       
        trackNumText.trailingView = errorImgView
        trackNumText.trailingViewMode = .always
    }
    
    
}

