//
//  ViewController.swift
//  Timer
//
//  Created by 유혜빈 on 2022/11/25.
//

import UIKit
import AudioToolbox

enum TimerStatus {
  case start
  case pause
  case end
}

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var duration = 60
    var timerStatus: TimerStatus = .end
    var currentSeconds = 0
    var timer: DispatchSourceTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    func configureToggleButton() {
      self.startButton.setTitle("시작", for: .normal)
      self.startButton.setTitle("일시정지", for: .selected)
    }

    func startTimer() {
      if self.timer == nil {
        self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
        self.timer?.schedule(deadline: .now(), repeating: 1)
        self.timer?.setEventHandler(handler: { [weak self] in
          guard let self = self else { return }
          self.currentSeconds -= 1
          let hour = self.currentSeconds / 3600
          let minutes = (self.currentSeconds % 3600) / 60
          let seconds = (self.currentSeconds % 3600) % 60
          self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
          self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
          UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
          })
          UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
          })
          if self.currentSeconds <= 0 {
            AudioServicesPlaySystemSound(1005)
            self.stopTimer()
          }
        })
        self.timer?.resume()
      }
    }

    func stopTimer() {
      if self.timerStatus == .pause {
        self.timer?.resume()
      }
      self.timerStatus = .end
      self.cancelButton.isEnabled = false

      UIView.animate(withDuration: 0.5, animations: {
        self.timerLabel.alpha = 0
        self.progressView.alpha = 0
        self.datePicker.alpha = 1
        self.imageView.transform = .identity
      })
      self.startButton.isSelected = false
      self.timer?.cancel()
      self.timer = nil
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
      switch self.timerStatus {
      case .start, .pause:
        self.stopTimer()

      default:
        break
      }
    }

    @IBAction func tapStartButton(_ sender: UIButton) {
      self.duration = Int(self.datePicker.countDownDuration)
      switch self.timerStatus {
      case .end:
        self.currentSeconds = duration
        self.timerStatus = .start
        UIView.animate(withDuration: 0.5, animations: {
          self.timerLabel.alpha = 1
          self.progressView.alpha = 1
          self.datePicker.alpha = 0
        })
        self.startButton.isSelected = true
        self.cancelButton.isEnabled = true
        self.startTimer()

      case .start:
        self.timerStatus = .pause
        self.startButton.isSelected = false
        self.timer?.suspend()

      case .pause:
        self.timerStatus = .start
        self.startButton.isSelected = true
        self.timer?.resume()
      }
    }
}

