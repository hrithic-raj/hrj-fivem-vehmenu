# DevX Vehicle Spawn Menu

A customizable vehicle spawn menu for FiveM using NativeUI.  
Supports ACE permissions per category and flexible menu opening methods.

---

## Features

- Vehicle spawn menu with categories and vehicles defined in a config file  
- Each category can have its own ACE permission  
- Global ACE permission (`devx.vehiclemenu`) grants access to all categories  
- Choose how to open the menu: keybind or command  
- Fully customizable vehicle list and categories via `config.lua`  
- Uses NativeUI for a clean, native GTA menu experience

---

## Installation

1. Place the resource folder in your server's `resources` directory.  
2. Ensure `NativeUI.lua` is included in the folder (download from [NativeUI GitHub](https://github.com/FrazzIe/NativeUILua)).  
3. Add the resource to your `server.cfg` & ensure VehicleMenu

4. Configure your `config.lua` as needed (see configuration section).

---

## Configuration (`config.lua`)

- `MenuTrigger`: `'command'` or `'key'` — how the menu opens  
- `MenuKey`: key to open the menu if `MenuTrigger` is `'key'` (default `F5`)  
- `MenuCommand`: command name if `MenuTrigger` is `'command'` (default `vehicles`)  
- `UseAcePerms`: set to `true` to enable ACE permission checks  
- `GlobalAcePerm`: global permission that grants access to all categories  
- `VehicleCategories`: list of categories, each with:
  - `label`: category name shown in the menu  
  - `acePerm`: ACE permission string required to access this category  
  - `vehicles`: list of vehicles with `name` (model) and `label` (display name)

---

## Usage

- If using command: type `/vehicles` (or your configured command) in chat to open the menu  
- If using keybind: press the configured key (default `F5`)  
- The menu will only show categories you have permission for  
- If you have the global ACE permission (`devx.vehiclemenu`), you can access all categories

---

## Permissions Setup

Add ACE permissions to your server’s `server.cfg` or `permissions.cfg` like this:

add_ace group.admin devx.vehiclemenu allow
add_ace group.police devx.vehiclemenu.police allow
add_ace group.civilians devx.vehiclemenu.civilians allow

Adjust groups and permissions to suit your server’s roles.

---

## Support

If you encounter issues or have feature requests, feel free to reach out.

---

**Author:** Matthew R. (DevX)  