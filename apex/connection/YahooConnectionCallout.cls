public class YahooConnectionCallout {
    //this method sends a call to Yahoo Finance and retrivies JSON data that match my TickerResponse class
    // and it will automaticaly map data to the properites of TickerResponse
    public static TickerResponse getYahooTickers(String tickerName, String date) {
        //most of these public api give a key on sign up, so let say we got a key from Yahoo Finance
        String apiKey = 'ET23FE3E32ER4BH5';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //lets say this is an endpoint of Yahoo Finance
        request.setEndpoint('https://finance.yahoo.com/apiKey='+apiKey+'&ticker='+tickerName+'&startDate='+date);
        request.setMethod('GET');
        try {
            HttpResponse reponse = http.send(request);
            return (List<TickerResponse>) JSON.deserialize(reponse.getBody(), List<TickerResponse>.class)
        } catch(Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}