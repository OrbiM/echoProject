 public class GetTickerInformationPageController() {

    @AuraEnabled
    public static String scrapeData(String tickersName, String date) {
        try{
            String response =  TickersService.getYahooTickers(tickerName, date);
            return response == 'Success' ?
                JSON.serialize(new Response('Success','Successfully scraped Ticker!', 'success' )) :
                JSON.serialize(new Response('Warning','No data found, try again!', 'warning' ));
        } catch(Exception e) {
            throw new AuraHandledException('Error while scraping tickers data' + e.getMessage());
        }
    }

    public Response(String title, String message, String type){
        this.title = title;
        this.message = message;                
        this.type = type;           
    }
}