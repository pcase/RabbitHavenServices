//
//  TimeViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CalendarDelgate {
    
    var booking = Booking()
    
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var donationAmount: UILabel!
    @IBOutlet weak var USDAmount: UILabel!
    
    var calendarPicker: CalendarModel?
    var cellIdentifier = "CalendarViewCell"
    var currentDate = Date()
    var calendarArray: NSArray?
    var selectedDate: Int = 0
    
    func getCalendar() -> CalendarModel {
        
        if calendarPicker == nil {
            calendarPicker = CalendarModel()
            calendarPicker?.delegate = self
        }
        return calendarPicker!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.calendarArray = getCalendar().arrayOfDates()
        
        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
        self.calendarCollectionView.selectItem(at: indexPathForFirstRow, animated: false, scrollPosition: [])
        self.collectionView(self.calendarCollectionView, didSelectItemAt: indexPathForFirstRow)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceLabel.text = booking.service
        donationAmount.text = Constants.DOLLAR_SIGN + Utils.intToString(num: booking.donation)
        USDAmount.text = Utils.floatToString(num: booking.donationUSD)
        
        // Get first working day
        
        // Get available time slots
        
        // Display available time slots
        
        // When time slot button is clicked, book service
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if calendarCollectionView == scrollView {
            setSelectedItemFromScrollView(scrollView)
        }
    }
    
    func setSelectedItemFromScrollView(_ scrollView: UIScrollView) {
        if calendarCollectionView == scrollView {
            let center = CGPoint(x: scrollView.center.x + scrollView.contentOffset.x, y: scrollView.center.y + scrollView.contentOffset.y)
            let index = calendarCollectionView.indexPathForItem(at: center)
            if index != nil {
                calendarCollectionView.scrollToItem(at: index!, at: .centeredHorizontally, animated: true)
                self.calendarCollectionView.selectItem(at: index, animated: false, scrollPosition: [])
                self.collectionView(self.calendarCollectionView, didSelectItemAt: index!)
                
                self.selectedDate = (index?.row)!
                self.selectedDateLabel.text = self.calendarArray?[(index?.row)!] as? String
            }
            else {
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if calendarCollectionView == scrollView && !decelerate  {
            setSelectedItemFromScrollView(scrollView)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return (calendarArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CalendarViewCell

        cell.dateLabel.text = self.calendarArray?[indexPath.row] as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedDate = indexPath.row
        let centeredIndexPath = IndexPath.init(item: selectedDate, section: 0)
        collectionView.scrollToItem(at: centeredIndexPath, at: .centeredHorizontally, animated: true)
        if indexPath == centeredIndexPath {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        self.selectedDateLabel.text = self.calendarArray?[indexPath.row] as! String?
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CalendarViewCell
        cell.dateLabel!.textColor = UIColor.black
    }
}
