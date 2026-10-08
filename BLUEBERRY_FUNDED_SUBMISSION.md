# Blueberry Funded EA Approval & Submission Document

> **Instructions for the Trader:**  
> You can copy and paste the English section below directly into your email or support ticket with Blueberry Funded. A German version is also included below for your reference.

---

## 🇬🇧 English Submission Template (Copy & Paste to Blueberry Funded Support)

**Subject:** EA Approval Request: SuperScalp / XAU Titan Pro (Account ID: [Insert Account Number])

Dear Blueberry Funded Support Team,

I am writing to formally request approval for the Expert Advisor (EA) that I intend to use on my Blueberry Funded trading account. 

Below you will find the full details regarding the strategy, entry/exit criteria, risk management, and proof of source code ownership as requested:

### 1. General EA Information
- **EA Name:** SuperScalp (XAU Titan Pro)
- **Asset / Symbol:** XAUUSD (Gold)
- **Timeframe:** M15 (15-Minute Chart)
- **Platform:** MetaTrader 5 (Native MQL5)
- **GitHub Repository (Source Code):** https://github.com/zirkumflex567-sketch/superscalp

---

### 2. Strategy Overview (Strict Prop Firm Compliance)
This EA operates a **rule-based institutional trend-momentum and pullback swing strategy**.
- **NO High-Frequency Trading (HFT):** Signals are checked only on the close of M15 bars.
- **NO Latency Arbitrage / Toxic Flow:** Trades execute via standard market orders using realistic broker execution.
- **NO Martingale / NO Grid:** Position sizing is static or fixed percentage; losing trades are never doubled or averaged down recklessly.
- **NO Tick Scalping:** The average trade duration is approximately **19.5 hours** (trades typically range from several hours to 1–2 days).

---

### 3. Entry & Exit Logic
- **Entry Rules (Trend & Momentum Alignment on M15):**
  1. **Macro Trend Filter:** Price must align with the 50-period Exponential Moving Average (`EMA 50`).
  2. **Short-Term Momentum:** `EMA 9` must cross/lead `EMA 21` in the trend direction.
  3. **RSI Confirmation:** 14-period RSI must be above 50.0 for Long positions, or below 50.0 for Short positions.
  4. **Bar-Close Trigger:** Trades are only entered upon the close of a completed M15 candle confirming the direction.
  5. **Spacing:** A minimum interval of 2 M15 bars (30 minutes) is enforced between entries; maximum of 3 concurrent positions.

- **Exit Rules & Stop Loss Protection:**
  1. **Hard Structural Stop Loss:** Every position is placed immediately with a hard Stop Loss anchored to the 12-hour swing high/low (lookback 48 bars on M15 + buffer).
  2. **Dynamic Runner Exit:** Once a trade/basket reaches at least $28 USD profit per position, the EA monitors the price relative to `EMA 9`. A pullback across `EMA 9` triggers an automatic market exit, locking in profits near the momentum peak.

---

### 4. Risk Management & Prop Firm Protection
- **Risk Per Trade:** Conservative **0.5% dynamic risk** based directly on the distance to the structural swing Stop Loss (or fixed 0.01 lot).
- **Automated Daily Loss Killswitch:** Hard-coded circuit breaker at **3.5% daily drawdown** (based on equity vs. daily opening balance). If triggered, the EA immediately closes all open positions and locks out further entries until 00:00 server midnight, strictly protecting the account well before Blueberry's 4.0% daily limit.
- **Automated Total Drawdown Killswitch:** Hard-coded stop at **9.0% total drawdown** from the initial account balance (strictly before Blueberry's 10.0% limit).

---

### 5. Proof of Source Code Ownership
I confirm that I own and maintain the complete, uncompiled source code (`XAU_Titan_Pro.mq5`). It has been written natively in MQL5 without third-party proprietary libraries, external DLLs, or malicious hooks. 

The full source code, executable binary, presets, and documentation are publicly available for your inspection at:
👉 **https://github.com/zirkumflex567-sketch/superscalp**

Please let me know if you require any additional information or have further questions. I look forward to your confirmation.

Best regards,  
[Your Name]  
[Your Email / Contact Information]  
Blueberry Funded Account ID: [Your Account Number]

---

---

## 🇩🇪 Deutsche Vorlage (Zur Referenz / Für deutsche Ansprechpartner)

**Betreff:** EA-Zulassungsanfrage: SuperScalp / XAU Titan Pro (Konto-ID: [Kontonummer einfügen])

Sehr geehrtes Blueberry Funded Support-Team,

hiermit reiche ich die Unterlagen und Informationen zur Zulassung meines Expert Advisors (EA) für mein Blueberry Funded Trading-Konto ein.

Nachfolgend finden Sie alle Details zur Handelsstrategie, den Ein- und Ausstiegsregeln, dem Risikomanagement sowie dem Nachweis über den Quellcode-Besitz:

### 1. Allgemeine Angaben
- **Name des EA:** SuperScalp (XAU Titan Pro)
- **Handelsinstrument:** XAUUSD (Gold)
- **Zeiteinheit:** M15 (15-Minuten-Chart)
- **Plattform:** MetaTrader 5 (MQL5)
- **GitHub-Link (Quellcode & Presets):** https://github.com/zirkumflex567-sketch/superscalp

### 2. Was der EA tut (Strategie & Regelkonformität)
Der EA verfolgt eine **systematische Trendfolge- und Momentum-Swing-Strategie** auf Gold:
- **KEIN High-Frequency Trading (HFT):** Signale werden ausschließlich bei Kerzenschluss auf M15 geprüft.
- **KEINE Latenz-Arbitrage / toxischer Flow:** Normale Marktausführung mit Standard-Orderbefehlen.
- **KEIN Martingale / KEIN toxisches Grid:** Feste oder prozentuale Positionsgrößen; Verlusttrades werden niemals verdoppelt.
- **KEIN Tick-Scalping:** Durchschnittliche Haltedauer beträgt ca. **19,5 Stunden** (Swing-Trades über mehrere Stunden bis Tage).

### 3. Ein- und Ausstiegsregeln
- **Einstieg (Trend & Momentum auf M15):**
  - M15 EMA 50 als übergeordneter Trendfilter.
  - EMA 9 / EMA 21 Crossover als Momentum-Signal.
  - RSI(14) Momentum-Bestätigung (über 50 für Long, unter 50 für Short).
  - Einstieg nur bei fertigem Kerzenschluss; maximal 3 Positionen mit mind. 30 Min. Abstand.
- **Ausstieg & Stop Loss:**
  - **Fester struktureller Stop Loss:** Jede Position wird sofort mit einem harten SL am 12-Stunden-Swing-Extremwert (48 M15-Kerzen + Puffer) versehen.
  - **Dynamischer Runner-Ausstieg:** Sobald eine Position mindestens $28 Gewinn erreicht hat, sichert der EA Gewinne ab, wenn der Kurs die 9er EMA zurückkreuzt.

### 4. Risikomanagement & Blueberry-Schutz
- **Risiko pro Trade:** 0,5 % dynamisches Kontorisiko (anhand des SL-Abstands) oder feste 0.01 Lot.
- **Täglicher Notaus (3,5 %):** Schließt bei 3,5 % Tagesverlust sofort alle Positionen und sperrt neue Trades bis Mitternacht (weit vor der 4,0 % Blueberry-Grenze).
- **Gesamter Notaus (9,0 %):** Statischer Schutz vor der 10,0 % Blueberry-Grenze.

### 5. Nachweis des Quellcode-Besitzes
Ich bestätige, dass ich der rechtmäßige Eigentümer des vollständigen `.mq5`-Quellcodes bin. Der Code wurde nativ in MQL5 ohne externe DLLs oder Fremdlizenzen entwickelt. Der Quellcode kann unter dem oben genannten GitHub-Link eingesehen werden.
