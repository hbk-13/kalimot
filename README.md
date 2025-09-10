🥃 KALIMOT

KALIMOT is a Bash automation script designed to simplify connecting to VikingCloud RAP (Remote Access Point) gateways and Kali Cloud instances.
It provides a convenient menu-driven interface for different connection methods, including proxychains and SOCKS proxy tunneling.

## Usage

1. Clone the Repository
```bash
git clone https://github.com/yourusername/kalimot.git
cd kalimot
```
2. Make the Script Executable
```bash
chmod +x kalimot.sh
```
3. Run the Script
```bash
./kalimot.sh
```

<br>

```csharp
=============
 ? KALIMOT ?
=============

[1] RAPGW
[2] RAP
[3] RAP w/ Proxychains (Preferably Run on Kali VM or Kali Cloud)
[4] RAP w/ Socks Proxy
[5] Kali Cloud 1 (10.128.0.4)
[6] Kali Cloud 2 (10.128.0.6)
[0] Exit
```

<br>
<br>

⚡ Requirements

Linux / macOS environment (tested on Kali Linux)

SSH client installed

Access credentials for RAP Gateway / Kali Cloud

<br>
<br>

📌 Notes

Proxychains mode is recommended when running inside Kali VM or Kali Cloud environments.

RAPID values are automatically adjusted by adding 100 before connecting.

Ensure your account has valid access rights to RAP Gateway and Kali Cloud servers.

<br>
<br>

📝 License

This project is released under the MIT License – free to use, modify, and share.
