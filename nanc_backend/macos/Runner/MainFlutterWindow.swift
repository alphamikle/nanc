import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    //  let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(NSRect(x:0, y:0, width: 1920, height: 1080), display: true)
    //  self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
