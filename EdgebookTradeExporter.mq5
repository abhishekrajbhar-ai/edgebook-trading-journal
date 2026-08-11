#property script_show_inputs
#property strict

// Exports closed MT5 deals as a CSV file for Edgebook. This script never sends orders.
input datetime FromDate = D'2020.01.01 00:00';

void OnStart()
{
   datetime toDate = TimeCurrent();
   if(!HistorySelect(FromDate, toDate))
   {
      Print("Could not load account history.");
      return;
   }

   int file = FileOpen("edgebook-trades.csv", FILE_WRITE|FILE_CSV|FILE_ANSI, ',');
   if(file == INVALID_HANDLE)
   {
      Print("Could not create edgebook-trades.csv. Error: ", GetLastError());
      return;
   }

   FileWrite(file, "date", "symbol", "profit", "setup", "note");
   int total = HistoryDealsTotal();
   for(int i = 0; i < total; i++)
   {
      ulong ticket = HistoryDealGetTicket(i);
      if(ticket == 0 || HistoryDealGetInteger(ticket, DEAL_ENTRY) != DEAL_ENTRY_OUT)
         continue;

      string symbol = HistoryDealGetString(ticket, DEAL_SYMBOL);
      double profit = HistoryDealGetDouble(ticket, DEAL_PROFIT)
                    + HistoryDealGetDouble(ticket, DEAL_SWAP)
                    + HistoryDealGetDouble(ticket, DEAL_COMMISSION);
      datetime closeTime = (datetime)HistoryDealGetInteger(ticket, DEAL_TIME);
      FileWrite(file, TimeToString(closeTime, TIME_DATE), symbol, DoubleToString(profit, 2), "Imported MT5", "Closed deal " + (string)ticket);
   }
   FileClose(file);
   Print("Edgebook export complete. Open File > Open Data Folder > MQL5 > Files.");
}
