public class TickersService {
    // here I call the getYahooTickers from YahooConnectionCallout to retrieve the data and store it in a list
    // after that I store the data in DB if the list is not empty
    // also it will send a toast msg to the user on the UI
    //if the list is empty it will show a warning
    //add check if the member entered the values correctly ? :)
    public static String getYahooTickers(String tickersName, String dt) {
        //let's say we have an object in SF called Tickers with matching fields
        List<Tickers> tickersList = new List<Tickers>();
        try {
            tickersList = YahooConnectionCallout.getYahooTickers(tickersName, dt);
            if(tickersList.isEmpty()) {
                return 'Warning'
            }
               Database.SaveResult resultSA = Database.insert(tickersList);
            if (resultSA.isSuccess()) {
                return = 'Success'
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}