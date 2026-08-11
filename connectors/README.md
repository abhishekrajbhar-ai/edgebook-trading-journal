# Edgebook broker connectors

The free GitHub Pages version keeps data in your browser. It does not collect broker passwords or connect directly to a broker account.

## MetaTrader 4 and MetaTrader 5

1. Copy the matching exporter script into the terminal's MQL4/Scripts or MQL5/Scripts folder.
2. Compile it in MetaEditor and run EdgebookTradeExporter from Navigator > Scripts.
3. It writes edgebook-trades.csv in the terminal Files folder.
4. In Edgebook choose Import trades > CSV import and select the file.

The exporter only reads completed trade history. It never places trades or sends credentials.

## cTrader

cTrader direct sync needs an OAuth application registration, redirect URL, client ID, and secure backend. Use CSV export in this free local version.

## Exness and XM

For MT4/MT5 accounts use the MetaTrader exporter. For platform-only accounts export account history as CSV and import it in Edgebook.
