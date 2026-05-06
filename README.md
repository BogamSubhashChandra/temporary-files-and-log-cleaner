# 🧹 Windows Temp & Prefetch Cleaner

A lightweight Windows batch script to clean temporary files and prefetch data safely, silently, and automatically.

---

## 🚀 Features

* 🗑️ Cleans **User Temp** (`%TEMP%`)
* 🧹 Cleans **Windows Temp** (`C:\Windows\Temp`)
* ⚡ Cleans **Prefetch files**
* 🔇 Runs **silently** (no pop-ups)
* 🚫 Skips files currently in use (no errors)
* 🧾 Optional logging support (if enabled)
* 🔁 Can be scheduled for automatic cleanup

---

## 📂 Script Overview

The script removes:

* Temporary files created by applications
* System temporary files
* Prefetch cache (used by Windows for faster startup)

---

## ⚙️ Usage

### ▶️ Run manually

1. Download or clone this repository
2. Double-click the `.bat` file

> ⚠️ For full cleanup, **Run as Administrator**

---

### ⏱️ Schedule automatic cleanup

1. Press `Win + R`
2. Type `taskschd.msc`
3. Click **Create Basic Task**
4. Choose:

   * Trigger: Daily / Weekly
   * Action: Start a Program → select the `.bat` file
5. Enable:

   * ✅ Run with highest privileges

---

## 🧠 How It Works

* Uses `del` to remove files
* Uses `rd` to remove directories
* Suppresses errors for locked/in-use files
* Continues execution without interruption

---

## ⚠️ Notes & Warnings

* 🔸 Files currently in use are **skipped automatically**
* 🔸 Cleaning **Prefetch** may temporarily slow app startup
* 🔸 Some files require **admin rights** to delete
* 🔸 Safe for regular use, but **weekly cleanup is recommended**

---

## 📌 Requirements

* Windows 10 / 11
* No additional software required

---

## 🛠️ Customization

You can modify the script to:

* Add logging
* Exclude specific folders
* Adjust cleanup targets

---

## 📄 License

Free to use and modify.

---

## 🙌 Contribution

Feel free to improve or extend the script (logging, GUI, automation, etc.)

---


## 📄 License

This project is licensed under the MIT License.
