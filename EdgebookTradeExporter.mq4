#property strict
#property show_inputs

// Exports closed MT4 trades as a CSV file for Edgebook. This script never sends orders.
extern datetime FromDate = D'2020.01.01 00:00';

void OnStart()
{
   int file = FileOpen("edgebook-trades.csv", FILE_WRITE|FILE_CSV|FILE_ANSI, ',');
   if(file == INVALID_HANDLE)
   {
      Print("Could not create edgebook-trades.csv. Error: ", GetLastError());
      return;
   }

   FileWrite(file, "date", "symbol", "profit", "setup", "note");
   for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
   {
      if(!OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) || OrderCloseTime() == 0 || OrderCloseTime() < FromDate)
         continue;

      double profit = OrderProfit() + OrderSwap() + OrderCommission();
      FileWrite(file, TimeToString(OrderCloseTime(), TIME_DATE), OrderSymbol(), DoubleToString(profit, 2), "Imported MT4", "Closed ticket " + IntegerToString(OrderTicket()));
   }
   FileClose(file);
   Print("Edgebook export complete. Open File > Open Data Folder > MQL4 > Files.");
}
