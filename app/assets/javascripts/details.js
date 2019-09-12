function addAddressField() {

    //create Date object
    var date = new Date();

    //get number of milliseconds since midnight Jan 1, 1970 
    //and use it for address key
    var mSec = date.getTime(); 

    //Replace 0 with milliseconds
    idAttributDescription =  
          "invoice_details_attributes_0_description".replace("0", mSec);
    nameAttributDescription =  
          "invoice[details_attributes][0][description]".replace("0", mSec);

    idAttributAmount =  
          "invoice_details_attributes_0_amount".replace("0", mSec);
    nameAttributAmount =  
          "invoice[details_attributes][0][amount]".replace("0", mSec);
       
    //create <li> tag
    var plug = document.getElementById("more-info");

    //create label for Kind, set it's for attribute, 
    //and append it to <li> element
    // var labelDescription = document.createElement("label");
    // labelDescription.setAttribute("for", idAttributDescription);
    // var descriptionLabelText = document.createTextNode("Description");
    // labelDescription.appendChild(descriptionLabelText);
    // descriptionId.appendChild(labelDescription);

    //create input for Kind, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputDescription = document.createElement("INPUT");
    inputDescription.setAttribute("type", "text");
    // inputDescription.setAttribute("class", "form-group string optional invoice_description");
    inputDescription.setAttribute("name", nameAttributDescription);
    plug.appendChild(inputDescription);

    //create label for Street, set it's for attribute, 
    //and append it to <li> element
    // var labelAmount = document.createElement("label");
    // labelAmount.setAttribute("for", idAttributAmount);
    // var amountLabelText = document.createTextNode("Amount");
    // labelAmount.appendChild(amountLabelText);
    // amountId.appendChild(labelAmount);

    //create input for Street, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputAmount = document.createElement("INPUT");
    inputAmount.setAttribute("type", "text");
    // inputAmount.setAttribute("id", idAttributAmount);
    inputAmount.setAttribute("name", nameAttributAmount);
    plug.appendChild(inputAmount);

    //add created <li> element with its child elements 
    //(label and input) to myList (<ul>) element
    // document.getElementById("myList").appendChild(descriptionId);
    //show address header
    let total = document.getElementById('invoice_total').value;
    let subtotal = document.getElementById('invoice_subtotal').value;
    let tax = document.getElementById('invoice_tax').value;
    let credits = document.getElementById('invoice_payments_credits').value;

    console.log(subtotal + tax + credits)
    // $("#addressHeader").show(); 
}
