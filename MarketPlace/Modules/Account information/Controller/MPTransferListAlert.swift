//
//  MPTransferListAlert.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/22.
//

import UIKit
import HWPanModal
class MPTransferListAlert: BaseAlertVC ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var listTableVIew: UITableView!
    
    @IBOutlet weak var colorView: UIView!
    
    let data = ["internal transfer","Quick transfer NAPAS247","External transfer","Cash transfer"]
    
    var didSelectItemBlock : BlockWithParameters<Int>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        colorView.setGradMainColor(size: CGSize(width: SCREEN_WIDTH, height: 50))
        
        listTableVIew.delegate = self
        listTableVIew.dataSource = self
        listTableVIew.rowHeight = 50
        listTableVIew.sw_registerCellClass(UITableViewCell.self)
        
         
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        hide(param: indexPath.row, completion: didSelectItemBlock)
        
    }
    @IBAction func closeAction(_ sender: Any) {
        
        
        self.hide()
    }
    
}


// MARK: - HWPanModalPresentable

extension MPTransferListAlert {
 
    
    override func panScrollable() -> UIScrollView? {
        return self.listTableVIew
    }
    override func longFormHeight() -> PanModalHeight {
        return PanModalHeight(type: .content, height: 250 - SafeAreaBottom )
    }

    override func shortFormHeight() -> PanModalHeight {
        return PanModalHeight(type: .content, height: 250 - SafeAreaBottom )
    }

    override func showDragIndicator() -> Bool {
        return false
    }

    override func cornerRadius() -> CGFloat {
        return 15
    }

    
    
}
