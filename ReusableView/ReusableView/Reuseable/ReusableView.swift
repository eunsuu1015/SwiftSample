//
//  ReusableView.swift
//  ReusableView
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

protocol ReusableViewDelegate {
    func btnClick()
}

class ReusableView: UIView {
    
    var delegate: ReusableViewDelegate?
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func btnClick(_ sender: Any) {
        if let del = delegate {
            del.btnClick()
        }
    }
    
    let nibName = "ReusableView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
