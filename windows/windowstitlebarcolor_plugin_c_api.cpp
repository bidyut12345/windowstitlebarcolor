#include "include/windowstitlebarcolor/windowstitlebarcolor_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "windowstitlebarcolor_plugin.h"

void WindowstitlebarcolorPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  windowstitlebarcolor::WindowstitlebarcolorPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
