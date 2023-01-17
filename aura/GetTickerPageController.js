({ 
    //this method is called  when the user clicks the button
    //here we call the method from GetTickerInformationPageController.cls where we get the response
    // if the response is success, Success toast will pop up, else it will show Error toast
    scrapeData: function(component) {
        var action = component.get("c.scrapeData");
            action.setParams({
                "tickerName": component.get("v.ticker"),
                "date" : component.get("v.date")
            });

            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {               
                    var res = JSON.parse(response.getReturnValue());    
                    var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": res.title,
                            "message": res.message,
                            "type": res.type
                        }).fire();
                        $A.get('e.force:refreshView').fire();
                } else if (state === "ERROR") {
                    var error = response.getError();
                    toastEvent.setParams({
                        "title": "Unsuccessful",
                        "message":error.message,
                        "type": "error"
                    }).fire();
                }               
            })
    }
})