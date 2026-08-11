# Edgebook broker connectors

The free GitHub Pages version of Edgebook keeps data in the browser. It does not collect broker passwords or connect directly to a broker account.

## MetaTrader 4 and MetaTrader 5 (free)

1. Copy the matching exporter file into your terminal's `MQL4/Scripts` or `MQL5/Scripts` folder.
2. Open MetaEditor, compile it, then run **EdgebookTradeExporter** from the Navigator's Scripts section.
3. The script creates `edgebook-trades.csv` in the terminal's **Files** folder.
4. In Edgebook, choose **Import trades** → **CSV import** and select that file.

The exporter only reads completed trade history and writes a local CSV. It never places trades or transmits credentials.

## cTrader

cTrader supports an OAuth-based Open API. A real `Connect cTrader` button needs an application registration, redirect URL, client ID, and a secure backend to protect the client secret. It cannot be safely implemented in this static, local-only site.

## Exness and XM

If the account is an MT4/MT5 account, use the corresponding MetaTrader exporter above. For platform-only accounts, export account history or a statement as CSV and import it in Edgebook.
