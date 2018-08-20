package top.dodeman.flutterwanandroid

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.os.Bundle
import android.widget.Toast

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity(): FlutterActivity() {
  val CHANNEL="top.dodeman/wanandroid"
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    MethodChannel(flutterView,CHANNEL).setMethodCallHandler { methodCall, result ->
      when(methodCall.method){
        "copyToClipBoard"->copyToClipboard(methodCall.argument("message"))
      }
    }
    GeneratedPluginRegistrant.registerWith(this)
  }


  /**
   * 复制到剪贴板
   */
  fun copyToClipboard(str:String) {
    val cm = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
    cm.primaryClip = ClipData.newPlainText("text", str)
    Toast.makeText(applicationContext,"复制成功～",Toast.LENGTH_SHORT).show()
  }
}
