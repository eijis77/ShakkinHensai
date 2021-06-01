//
//  ViewController.swift
//  YouikuhiCalculation
//
//  Created by 柴英嗣 on 2021/04/11.
//

import UIKit
import Cartography
import SCLAlertView
import SafariServices

class CalculationController: UIViewController, UITextViewDelegate {
    
    let IncomeTextField0 = UITextField()
    let IncomeTextField1 = UITextField()
    let IncomeTextField2 = UITextField()
    let IncomeTextField3 = UITextField()

    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    let scrollView = UIScrollView()
    
    var kariire : String = "0"
    var riritsu : String = "0"
    
    var year : String = "0"
    var month : String = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
                
        scrollView.frame = self.view.frame
        let imageheight = (UIScreen.main.bounds.size.width - 20) * 0.4
        if UIScreen.main.nativeBounds.height > 2208 || UIScreen.main.nativeBounds.height == 1792{
            
            scrollView.contentSize = CGSize(width:screenWidth, height: 980 + Int(imageheight))
        }
        else{
            scrollView.contentSize = CGSize(width:screenWidth, height: 960 + Int(imageheight))
        }
        
        self.view.addSubview(scrollView)
        
        
        
        let toolbar0 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem0 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done0))
        let cancelItem0 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel0))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar0.setItems([cancelItem0, flexibleSpace, doneItem0], animated: true)
        
        let toolbar1 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem1 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done1))
        let cancelItem1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel1))
        toolbar1.setItems([cancelItem1, flexibleSpace, doneItem1], animated: true)
        
        let toolbar2 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem2 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done2))
        let cancelItem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel2))
        toolbar2.setItems([cancelItem2, flexibleSpace, doneItem2], animated: true)
        
        let toolbar3 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem3 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done3))
        let cancelItem3 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel3))
        toolbar3.setItems([cancelItem3, flexibleSpace, doneItem3], animated: true)
        
        let nextImage0 : UIImage = UIImage(named:"banner")!
        let imageView0 = UIImageView(image:nextImage0)
        scrollView.addSubview(imageView0)
        constrain(imageView0) { image  in
            image.width  == image.superview!.width - 20
            image.height == (image.superview!.width - 20) * 0.4
            image.centerX == image.superview!.centerX
            image.top == image.superview!.top + 30
        }
        
        let title1 = UILabel()
        title1.text = "1. 借入額を記入"
        title1.textColor = UIColor.hex(string: "#ff7e67", alpha: 1.0)
        title1.numberOfLines = 0
        title1.font = UIFont.boldSystemFont(ofSize: 30)
        scrollView.addSubview(title1)
        constrain(title1,imageView0) { label,last in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height >= 0
            label.left == label.superview!.left + 30
            label.top == last.bottom + 30
        }
 
        self.IncomeTextField0.inputAccessoryView = toolbar0
        self.IncomeTextField0.keyboardType = .numberPad
        self.IncomeTextField0.textColor = UIColor.black
        self.IncomeTextField0.textAlignment = .center
        self.IncomeTextField0.font = UIFont.systemFont(ofSize: 40)
        self.IncomeTextField0.layer.borderWidth = 4
        self.IncomeTextField0.layer.cornerRadius = 10
        self.IncomeTextField0.placeholder = "100"
        self.IncomeTextField0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.IncomeTextField0.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(IncomeTextField0)
        constrain(IncomeTextField0, title1) { label, last in
            label.width  == UIScreen.main.bounds.size.width - 200
            label.height >= 80
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        let Yen_Label1 = UILabel()
        Yen_Label1.text = "万円"
        Yen_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        Yen_Label1.numberOfLines = 1
        Yen_Label1.textAlignment = .center
        Yen_Label1.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(Yen_Label1)
        constrain(Yen_Label1, IncomeTextField0) { label, last in
            label.width  >= 20
            label.height == 20
            label.left == last.right + 10
            label.bottom == last.bottom - 7
        }
        
        let title2 = UILabel()
        title2.text = "2. 金利を記入（整数）"
        title2.textColor = UIColor.hex(string: "#ff7e67", alpha: 1.0)
        title2.numberOfLines = 0
        title2.font = UIFont.boldSystemFont(ofSize: 30)
        scrollView.addSubview(title2)
        constrain(title2, IncomeTextField0) { label,last  in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height >= 0
            label.left == label.superview!.left + 30
            label.top == last.bottom + 60
        }
        self.IncomeTextField1.inputAccessoryView = toolbar1
        self.IncomeTextField1.keyboardType = .numberPad
        self.IncomeTextField1.textColor = UIColor.black
        self.IncomeTextField1.textAlignment = .center
        self.IncomeTextField1.font = UIFont.systemFont(ofSize: 40)
        self.IncomeTextField1.layer.borderWidth = 4
        self.IncomeTextField1.layer.cornerRadius = 10
        self.IncomeTextField1.placeholder = "18"
        self.IncomeTextField1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.IncomeTextField1.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(IncomeTextField1)
        constrain(IncomeTextField1, title2) { label, last in
            label.width  == UIScreen.main.bounds.size.width - 200
            label.height >= 80
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        let P_Label1 = UILabel()
        P_Label1.text = "%"
        P_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        P_Label1.numberOfLines = 1
        P_Label1.textAlignment = .center
        P_Label1.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(P_Label1)
        constrain(P_Label1, IncomeTextField1) { label, last in
            label.width  >= 20
            label.height == 20
            label.left == last.right + 10
            label.bottom == last.bottom - 7
        }
        
        
        let title3 = UILabel()
        title3.text = "3. 借入期間を記入"
        title3.textColor = UIColor.hex(string: "#ff7e67", alpha: 1.0)
        title3.numberOfLines = 0
        title3.font = UIFont.boldSystemFont(ofSize: 30)
        scrollView.addSubview(title3)
        constrain(title3, IncomeTextField1) { label,last  in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height >= 0
            label.left == label.superview!.left + 30
            label.top == last.bottom + 60
        }
        self.IncomeTextField2.inputAccessoryView = toolbar2
        self.IncomeTextField2.keyboardType = .numberPad
        self.IncomeTextField2.textColor = UIColor.black
        self.IncomeTextField2.textAlignment = .center
        self.IncomeTextField2.font = UIFont.systemFont(ofSize: 40)
        self.IncomeTextField2.layer.borderWidth = 4
        self.IncomeTextField2.layer.cornerRadius = 10
        self.IncomeTextField2.placeholder = "3"
        self.IncomeTextField2.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.IncomeTextField2.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(IncomeTextField2)
        constrain(IncomeTextField2, title3) { label, last in
            label.width  == UIScreen.main.bounds.size.width * 0.5 - 100
            label.height >= 80
            label.left == label.superview!.left + 50
            label.top == last.bottom + 30
        }
        let Y_Label1 = UILabel()
        Y_Label1.text = "年"
        Y_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        Y_Label1.numberOfLines = 1
        Y_Label1.textAlignment = .center
        Y_Label1.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(Y_Label1)
        constrain(Y_Label1, IncomeTextField2) { label, last in
            label.width  >= 20
            label.height == 20
            label.left == last.right + 10
            label.bottom == last.bottom - 7
        }
        
        self.IncomeTextField3.inputAccessoryView = toolbar3
        self.IncomeTextField3.keyboardType = .numberPad
        self.IncomeTextField3.textColor = UIColor.black
        self.IncomeTextField3.textAlignment = .center
        self.IncomeTextField3.font = UIFont.systemFont(ofSize: 40)
        self.IncomeTextField3.layer.borderWidth = 4
        self.IncomeTextField3.layer.cornerRadius = 10
        self.IncomeTextField3.placeholder = "3"
        self.IncomeTextField3.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.IncomeTextField3.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(IncomeTextField3)
        constrain(IncomeTextField3, IncomeTextField2) { label, last in
            label.width  == UIScreen.main.bounds.size.width * 0.5 - 100
            label.height >= 80
            label.left == last.right + 50
            //label.centerX == label.superview!.left + UIScreen.main.bounds.size.width * 0.625
            label.top == last.top
        }
        let M_Label1 = UILabel()
        M_Label1.text = "ヶ月"
        M_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        M_Label1.numberOfLines = 1
        M_Label1.textAlignment = .center
        M_Label1.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(M_Label1)
        constrain(M_Label1, IncomeTextField3) { label, last in
            label.width  >= 20
            label.height == 20
            label.left == last.right + 10
            label.bottom == last.bottom - 7
        }


        
        let submit = SubmitButton.create()
        scrollView.addSubview(submit)
        let cancel = CancelButton.create()
        scrollView.addSubview(cancel)
        
        
        constrain(cancel, IncomeTextField3) { label, last in
            label.width  >= UIScreen.main.bounds.size.width - 180
            label.height == 60
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        
        constrain(submit, cancel) { label, last in
            label.width  >= UIScreen.main.bounds.size.width - 180
            label.height == 80
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 25
        }
        cancel.btnNext?.addTarget(self, action: #selector(onPressCancel(_:)), for: .touchUpInside)
        submit.btnNext?.addTarget(self, action: #selector(onPressSubmit(_:)), for: .touchUpInside)
        
        
        
        let baseString = "利用規約とプライバシーポリシーに同意してから利用してください。\n公式サイトとお問い合せフォームについてもリンクをタップしてください。"
        let attributedString = NSMutableAttributedString(string: baseString)
        attributedString.addAttribute(.link,
                                      value: "TermOfUseLink",
                                      range: NSString(string: baseString).range(of: "利用規約"))

        attributedString.addAttribute(.link,
                                      value: "PrivacyPolicyLink",
                                      range: NSString(string: baseString).range(of: "プライバシーポリシー"))
        attributedString.addAttribute(.link,
                                      value: "TopLink",
                                      range: NSString(string: baseString).range(of: "公式サイト"))
        attributedString.addAttribute(.link,
                                      value: "ContactLink",
                                      range: NSString(string: baseString).range(of: "お問い合せフォーム"))
        let textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.hex(string: "#eeeeee", alpha: 1.0)
        textView.attributedText = attributedString
        textView.isSelectable = true
        textView.isEditable = false
        textView.delegate = self
        scrollView.addSubview(textView)
        constrain(textView, submit) { label, last in
            label.width  >= UIScreen.main.bounds.size.width - 60
            label.height >= 70
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 60
        }
        
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

        let urlString = URL.absoluteString
        if urlString == "TermOfUseLink" {
            print("ffff")
            let termsUrl = NSURL(string: "https://youikuhicalculation.xyz/terms/")
            if let termsUrl = termsUrl {
                let safariViewController = SFSafariViewController(url: termsUrl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }

        if urlString == "PrivacyPolicyLink" {
            print("ffff")
            let privacypolicyUrl = NSURL(string: "https://youikuhicalculation.xyz/privacy-policy/")
            if let privacypolicyUrl = privacypolicyUrl {
                let safariViewController = SFSafariViewController(url: privacypolicyUrl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }
        
        if urlString == "TopLink" {
            print("ffff")
            let top = NSURL(string: "https://youikuhicalculation.xyz/")
            if let topurl = top {
                let safariViewController = SFSafariViewController(url: topurl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }
        
        if urlString == "ContactLink" {
            print("ffff")
            let contact = NSURL(string: "https://youikuhicalculation.xyz/contact/")
            if let contacturl = contact {
                let safariViewController = SFSafariViewController(url: contacturl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }

        return false
    }

    @objc func onPressCancel(_ sender : Any){
        print("cancel")
        //見た目のデータをリセット
        self.IncomeTextField0.text = nil
        self.IncomeTextField1.text = nil
        self.IncomeTextField2.text = nil
        self.IncomeTextField3.text = nil
        //計算用のデータをリセット
        self.kariire = "0"
        self.riritsu = "0"
        self.year = "0"
        self.month = "0"
        
    }

    @objc func onPressSubmit(_ sender : Any){
        print("submit")
        self.kariire = self.IncomeTextField0.text ?? "0"
        self.riritsu = self.IncomeTextField1.text ?? "0"
        self.year = self.IncomeTextField2.text ?? "0"
        self.month = self.IncomeTextField3.text ?? "0"
        if self.year.isEmpty == true {
            self.year = "0"
        }
        if self.month.isEmpty == true {
            self.month = "0"
        }
        

        if self.year == "0" &&
            self.month == "0" ||
            self.kariire == "0" &&
            self.riritsu == "0" ||
            Int(self.kariire) ?? 100000000 >= 99999999 ||
            self.kariire[kariire.startIndex] == "0"
            && self.kariire.count > 1 ||
            self.year[year.startIndex] == "0"
            && self.year.count > 1 ||
            self.month[month.startIndex] == "0"
            && self.month.count > 1 ||
            self.riritsu[riritsu.startIndex] == "0"
            && self.riritsu.count > 1{
            let appearance = SCLAlertView.SCLAppearance(
                showCloseButton: true
            )
            let alert = SCLAlertView(appearance: appearance)
            alert.showInfo("注意", subTitle: "すべての正しい項目を入力してください", closeButtonTitle: "OK")
        }
        
        
        else {
            let result_num = CaluculationRepository().calculation(kariire: Float(self.kariire)!, kinnri: Float(self.riritsu)!, year: Float(self.year)!, month: Float(self.month)!)
            
            let appearance = SCLAlertView.SCLAppearance(
                showCloseButton: true
            )
            let alert = SCLAlertView(appearance: appearance)
            var per_month = Float(self.year)! * 12 + Float(self.month)!
            per_month = result_num / per_month
            alert.showSuccess("計算完了！", subTitle: "支払う額の合計は\n約\(Float(floor( result_num * 1000 ) / 1000))万円です！\n月々に支払う額は\n約\(Float(floor( per_month * 1000 ) / 1000))万円です！", closeButtonTitle: "OK")
        }
    }
    //借入額
    @objc func cancel0() {
        self.IncomeTextField0.text = "0"
        self.kariire = "0"
        print(self.kariire)
        self.IncomeTextField0.endEditing(true)
    }

    @objc func done0() {
        self.kariire = self.IncomeTextField0.text ?? "0"
        print(self.kariire)
        self.IncomeTextField0.endEditing(true)
    }
    //利率
    @objc func cancel1() {
        self.IncomeTextField1.text = "0"
        self.riritsu = "0"
        print(self.riritsu)
        self.IncomeTextField1.endEditing(true)
    }

    @objc func done1() {
        self.riritsu = self.IncomeTextField1.text ?? "0"
        print(self.riritsu)
        self.IncomeTextField1.endEditing(true)
    }
    //借入期間（年）
    @objc func cancel2() {
        self.IncomeTextField2.text = "0"
        self.year = "0"
        print(self.year)
        self.IncomeTextField2.endEditing(true)
    }

    @objc func done2() {
        self.year = self.IncomeTextField2.text ?? "0"
        print(self.year)
        self.IncomeTextField2.endEditing(true)
    }
    //借入期間（月）
    @objc func cancel3() {
        self.IncomeTextField3.text = "0"
        self.month = "0"
        print(self.month)
        self.IncomeTextField3.endEditing(true)
    }

    @objc func done3() {
        self.month = self.IncomeTextField3.text ?? "0"
        print(self.month)
        self.IncomeTextField3.endEditing(true)
    }

    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

