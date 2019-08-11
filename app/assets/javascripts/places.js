

$(document).ready(function() {
 // alert("test");
  handleReviewLinkClick();
  addPlaceEventListener();
  //console.log("ready");
});

function handleReviewLinkClick() {
  //debugger
  $("#review_link").click(getReviews);

}; 

function getReviews(event) {
  event.preventDefault();
  // alert("test");
  const placeId = event.target.dataset.placeId; 
  fetch("/places/"+ placeId + ".json").then(response => response.json()).then(data => displayReviews(data.reviews)) 
};

function displayReviews(reviews) {
  for (var i = 0; i < reviews.length; i++) {
    reviewList = "<li>" + reviews[i].content + "</li>"
    document.getElementById('target-id').innerHTML += reviewList;
  };
};

function addPlaceEventListener() {
  $("form").submit(function(event) {
    event.preventDefault();
    var values = $(this).serializeArray();
    var posting = $.post("/places.json", values);
    posting.done((data) => {

      let place = new Place(data)
      //let newPlace = new Place(values)
      //let newPlaceHTML = newPlace.placeHTML()
      document.querySelector("div#placeResult").innerHTML = place.placeHTML();
      
    })


      
      //placeData =>  {
      //debugger
      //document.querySelector("div#placeResult").innerHTML = 
      //`Place Created!:
      //<h2>"Place Name:" ${placeData.name}</h2>
      //<li>"Address:" ${placeData.address}</li> 
      //<li>"Website:" ${placeData.website}</li>
      //<li>"Phone Number:" ${placeData.phone_number}</li>
      //<li>"Category:" ${placeData.category}</li>
      //<li>"Changing Tables:" ${placeData.changing_tables}</li>
      //<li>"Family Bathroom:" ${placeData.family_bathroom}</li>
      //<li>"High Chairs:" ${placeData.high_chairs}</li>
      //<li>"Nursing Room:" ${placeData.nursing_room}</li>`
    //})
  })
}

class Place {
    constructor(data) {
    this.name = data.name; 
    this.address = data.address;
    this.website = data.website;
    this.phone_number = data.phone_number;
    this.category = data.category;
    this.changing_tables = data.changing_tables;
    this.family_bathroom = data.family_bathroom;
    this.high_chairs = data.high_chairs;
    this.nursing_room = data.nursing_room;
  }; 

  placeHTML() {
    return `
    <div id="placeResult"> 
    <h1>Place Created!:</h1>
    <h2>"Place Name:" ${this.name}</h2>
    <li>"Address:" ${this.address}</li> 
    <li>"Website:" ${this.website}</li>
    <li>"Phone Number:" ${this.phone_number}</li>
    <li>"Category:" ${this.category}</li>
    <li>"Changing Tables:" ${this.changing_tables}</li>
    <li>"Family Bathroom:" ${this.family_bathroom}</li>
    <li>"High Chairs:" ${this.high_chairs}</li>
    <li>"Nursing Room:" ${this.nursing_room}</li>
    </div>`
  }
}

