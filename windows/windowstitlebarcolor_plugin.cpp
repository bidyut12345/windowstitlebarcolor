#include "windowstitlebarcolor_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>
#include "include/windowstitlebarcolor/window_titlebar_color.cpp"

namespace windowstitlebarcolor
{
  flutter::PluginRegistrarWindows *registrar1;
  // static
  void WindowstitlebarcolorPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "windowstitlebarcolor",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<WindowstitlebarcolorPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
    registrar1 = registrar;
  }

  WindowstitlebarcolorPlugin::WindowstitlebarcolorPlugin() {}

  WindowstitlebarcolorPlugin::~WindowstitlebarcolorPlugin() {}

  HWND window;
  void WindowstitlebarcolorPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    if (method_call.method_name().compare("setTitleBarColor") == 0)
    {
      const flutter::EncodableMap &args =
          std::get<flutter::EncodableMap>(*method_call.arguments());
      window = ::GetAncestor(registrar1->GetView()->GetNativeWindow(), GA_ROOT);
      setTitleBarColor(std::get<int>(args.at(flutter::EncodableValue("color"))), window);
      result->Success(flutter::EncodableValue("Done"));
    }
    else
    {
      result->NotImplemented();
    }
  }

} // namespace windowstitlebarcolor
