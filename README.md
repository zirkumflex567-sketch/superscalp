# XAU Titan Pro (SuperScalp) 🏆
### Institutional Gold (XAUUSD) Trend-Momentum & Swing EA for MetaTrader 5

[![MQL5](https://img.shields.io/badge/Language-MQL5-blue.svg)](https://www.mql5.com)
[![Timeframe](https://img.shields.io/badge/Timeframe-M15-green.svg)](#strategy-overview)
[![Asset](https://img.shields.io/badge/Asset-XAUUSD%20(Gold)-gold.svg)](#symbol-and-timeframe)
[![Prop Firm](https://img.shields.io/badge/Prop%20Firm-Blueberry%20Funded%20Ready-brightgreen.svg)](#prop-firm-compliance)

---

## 📌 Executive Summary

**XAU Titan Pro** (also known as **SuperScalp**) is a fully automated, institutional-grade Expert Advisor (EA) developed natively in **MQL5** for **MetaTrader 5**. 

The EA executes a **swing momentum and trend-pullback strategy** exclusively on **XAUUSD (Gold)** on the **M15 timeframe**. It is engineered from the ground up to comply strictly with modern prop firm regulations (specifically **Blueberry Funded**, **FTMO**, **FundedNext**, etc.).

### 🛡️ Prop Firm Compliance Highlights
- **NO High-Frequency Trading (HFT):** Trades are evaluated strictly on the close of M15 candles.
- **NO Latency Arbitrage / Toxic Flow:** Uses standard market orders with retry loops and realistic execution.
- **NO Martingale / NO Grid:** Lot sizing is strictly dynamic or fixed; positions are never doubled after losses.
- **NO Tick Scalping:** Average trade duration is **~19 hours** (ranging from several minutes to multiple days).
- **Hard Broker-Side Stop Loss:** Every trade is immediately sent with an explicit, structural Stop Loss (Swing High/Low of the last 12 hours).
- **Automated Prop Firm Protection:** Hard automated circuit breakers at **3.5% Daily Drawdown** (with automatic lockout until midnight) and **9.0% Total Drawdown**.

---


## 🧠 Strategy & Algorithm Breakdown

### 1. Market Regime & Trend Filter
- **Trend Baseline:** 50-period Exponential Moving Average (`EMA 50`) on the M15 timeframe.
- **Directional Bias:**
  - **BULLISH:** Current bar close > `EMA 50`
  - **BEARISH:** Current bar close < `EMA 50`

### 2. Entry Triggers (Momentum Alignment)
Entries are checked **strictly on the completion of each M15 bar**:
- **Long (Buy) Entry:**
  1. `Close[1] > EMA(9)[1]`
  2. `EMA(9)[1] > EMA(21)[1]`
  3. `Close[1] > EMA(50)[1]`
  4. `RSI(14)[1] >= 50.0` (Bullish momentum zone)
  5. Bullish candle close (`Close[1] > Open[1]`)
- **Short (Sell) Entry:**
  1. `Close[1] < EMA(9)[1]`
  2. `EMA(9)[1] < EMA(21)[1]`
  3. `Close[1] < EMA(50)[1]`
  4. `RSI(14)[1] <= 50.0` (Bearish momentum zone)
  5. Bearish candle close (`Close[1] < Open[1]`)

### 3. Structural Swing Stop Loss (Hard Risk Protection)
- Every position is placed with an initial Stop Loss anchored to the **12-hour swing structural extreme** (`InpSwingBarsLookback = 48` bars on M15).
  - **Buy SL:** `Swing Low (48 bars) - 250 points buffer`
  - **Sell SL:** `Swing High (48 bars) + 250 points buffer`
- Minimum SL: 1,500 points ($1.50 Gold price range).
- Maximum SL: 15,000 points ($15.00 Gold price range breathing room).

### 4. High-Profit Dynamic Runner Exit
- Rather than capping profits with a fixed arbitrary Take Profit, the EA runs a dynamic trailing exit:
  - When the basket reaches an average profit of at least **$28.00 per position**, the EA monitors the price relative to `EMA(9)`.
  - If price pulls back across `EMA(9)` while in profit $\ge$ $28.00, the EA closes the position/basket, securing profits near the momentum crest.
  - This allows runners to capture extended trending moves reaching up to **+$219+ per trade**.

### 5. Multi-Position Spacing
- Maximum concurrent positions: **3**.
- Minimum spacing between entries: **2 bars (30 minutes)**, preventing stacking into choppy market spikes.

---

## 🛡️ Prop Firm Protection Engine (Blueberry Funded Ready)

The EA includes a dedicated institutional risk engine specifically calibrated for Blueberry Funded rules:

1. **Daily Drawdown Circuit Breaker:**
   - Monitored continuously in `OnTick()`.
   - Compares real-time floating Equity against the daily starting Balance (computed at 00:00 server time).
   - If daily drawdown reaches **3.5%** (`InpMaxDailyDrawdownPercent = 3.5`), the EA **immediately closes all open positions** and triggers `m_daily_lockout = true`.
   - **Midnight Auto-Reset:** Trading is paused until 00:00 server time, when the lockout automatically clears for the new day.
2. **Total Drawdown Circuit Breaker:**
   - Static calculation against initial account balance (`InpTotalDDBasedOnInitial = true`).
   - If overall equity drawdown reaches **9.0%** (`InpMaxTotalDrawdownPercent = 9.0`), the EA completely halts trading, preventing any breach of the prop firm's 10% maximum loss limit.

---

## 📁 Repository Structure

```
├── README.md                                  # Complete EA documentation
├── BLUEBERRY_FUNDED_SUBMISSION.md             # Ready-to-send support declaration
├── .gitignore                                 # Standard Git ignore rules
├── XAU_Titan_Pro.mq5                          # Complete uncompiled MQL5 source code
├── XAU_Titan_Pro.ex5                          # Pre-compiled executable binary
├── src/
│   ├── XAU_Titan_Pro.mq5                      # Source code mirror
│   └── XAU_Titan_Pro.ex5                      # Binary mirror
└── presets/
    ├── XAU_Titan_Pro_guter5er_Champion_Dyn05.set  # Recommended: 0.5% Dynamic Risk (+5,251 $)
    ├── XAU_Titan_Pro_guter5er_Champion_001Lot.set # Conservative: Fixed 0.01 Lot (+4,261 $)
    └── XAU_Titan_Pro_guter5er_Champion_Dyn06.set # Compounding: 0.6% Dynamic Risk (> +6,300 $)
```

---

## ⚙️ Installation & Usage Guide

1. **Copy Files to MetaTrader 5:**
   - Open MT5 $\rightarrow$ `File` $\rightarrow$ `Open Data Folder`.
   - Place `XAU_Titan_Pro.mq5` (or `.ex5`) into `MQL5\Experts\`.
   - Place the files from `presets/` into `MQL5\Presets\`.
2. **Compile (if using .mq5):**
   - Open MetaEditor (F4), open `XAU_Titan_Pro.mq5`, click **Compile** (F7).
3. **Attach to Chart:**
   - Open a **XAUUSD** chart on the **M15** timeframe.
   - Drag `XAU_Titan_Pro` onto the chart.
   - In the "Common" tab, check **Allow Algo Trading**.
   - In the "Inputs" tab, click **Load** and select `XAU_Titan_Pro_guter5er_Champion_Dyn05.set`.
4. **Ensure Algo Trading is Enabled:**
   - Click the green **Algo Trading** button in the MT5 top toolbar.

---

## 📜 Intellectual Property & Ownership Declaration

I hereby confirm and declare that:
1. I am the sole author and owner of the source code for this Expert Advisor (`XAU_Titan_Pro.mq5`).
2. The algorithm was developed natively in MetaQuotes Language 5 (MQL5).
3. The strategy is 100% original, fully compliant with prop firm guidelines, and free from any third-party copyright restrictions, external DLLs, or malicious code.

---

## 📬 Contact & Support
- **GitHub Repository:** [https://github.com/zirkumflex567-sketch/superscalp](https://github.com/zirkumflex567-sketch/superscalp)
- **Author:** zirkumflex567-sketch
