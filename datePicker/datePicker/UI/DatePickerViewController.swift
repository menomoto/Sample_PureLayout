import UIKit
import PureLayout

class DatePickerViewController: UIViewController {
    
    // MARK: - Properties
    var days: [String] = [] // (1...30).map { $0 }
    let hours = (0...23).map { $0 }

    // MARK: - View Elements
    let textField = UITextField()
    let pickerView = UIPickerView()
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(textField)
    }
    
    fileprivate func configureSubviews() {
        pickerView.backgroundColor = .white
        pickerView.delegate = self
        pickerView.dataSource = self

        textField.borderStyle = .roundedRect
        textField.inputView = pickerView
//        textField.inputView = configureDatePicker()
        textField.inputAccessoryView = configureAccessoryView()
        
        days = configureDate()
    }
    
    fileprivate func configureAccessoryView() -> UIView {
        let accessoryView = UIToolbar()
        accessoryView.sizeToFit()
        let doneButton = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(didTapDoneButton))
        accessoryView.items = [doneButton]
        
        return accessoryView
    }
    
    fileprivate func configureDatePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ja_JP")
        datePicker.minimumDate = Date()
        datePicker.maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 7)
        datePicker.backgroundColor = .white
        
        return datePicker
    }
    
    fileprivate func configureDate() -> [String] {
        let calendar = Calendar.current
        let now = Date()
        
        var days: [String] = []
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: i, to: calendar.startOfDay(for: now)) {
                let fmt = DateFormatter()
                fmt.dateFormat = "MM月dd日 E"
                days.append(fmt.string(from: date))
            }
        }
        
        return days
    }
    
    fileprivate func addConstraints() {
        textField.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        textField.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        textField.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
    }
    
    @objc fileprivate func didTapDoneButton() {
        textField.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDataSource
extension DatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return hours.count
        default:
            return 0
        }
    }
}

// MARK: - UIPickerViewDelegate
extension DatePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(days[row])"
        case 1:
            return "\(hours[row])時から\(hours[row] + 1)時"
        default:
            return nil
        }
    }
}
