# 💸 Lv-MoneyHud

A clean and modern money HUD for QBCore servers. **Lv-MoneyHud** gives your players a stylish way to track their **Cash, Bank, Job, and ID** in real-time with a minimal interface.

---

## ✨ Features

* ✅ Transparent & modern rectangle HUD cards
* ✅ **Cash, Bank, Job & ID** display with live updates
* ✅ **Bold Roboto Job text** for clear visibility
* ✅ **Server logo support** (custom image slot)
* ✅ Optimized & lightweight for performance
* ✅ Easy toggle with command or keybind (default: `F7`)
* ✅ Fully customizable (CSS/HTML/Lua)

---

## 📂 Installation

1. Download or clone this repository into your server’s `resources` folder.
2. Rename the folder to `lv-moneyhud`.
3. Add the script to your `server.cfg`:

   ```cfg
   ensure lv-moneyhud
   ```

---

## ⚙️ Configuration

Inside **client.lua** you can adjust:

* `Config.ShowCash` → Show/hide cash row
* `Config.ShowBank` → Show/hide bank row
* `Config.ShowJob`  → Show/hide job row
* `Config.ShowId`   → Show/hide server ID
* `Config.Position` → Change HUD position (default: top-right)
* `Config.Scale`    → Adjust HUD size
* `Config.Logo`     → Path to your server logo (optional)
* `Config.ToggleCommand` → Change toggle command (default: `hud`)

---

## 🎨 Customization

* **Logo:** Replace `img/logo.png` with your server’s logo.
* **Colors & Fonts:** Edit `style.css` to change glow, text, or icon colors.
* **Layout:** Edit `index.html` to rearrange or remove HUD elements.

---

## 🖼️ Preview

<img width="1027" height="767" alt="image" src="https://github.com/user-attachments/assets/3469d9ed-5faa-486c-9d57-1fe4a1ecb375" />

---

## 🔑 Credits

* Script Name: **Lv-MoneyHud**
* Framework: **QBCore**
* Languages: **HTML, CSS, JS, Lua**
