#ifndef FLUTTER_PLUGIN_WINDOWSTITLEBARCOLOR_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOWSTITLEBARCOLOR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace windowstitlebarcolor {

class WindowstitlebarcolorPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WindowstitlebarcolorPlugin();

  virtual ~WindowstitlebarcolorPlugin();

  // Disallow copy and assign.
  WindowstitlebarcolorPlugin(const WindowstitlebarcolorPlugin&) = delete;
  WindowstitlebarcolorPlugin& operator=(const WindowstitlebarcolorPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace windowstitlebarcolor

#endif  // FLUTTER_PLUGIN_WINDOWSTITLEBARCOLOR_PLUGIN_H_
