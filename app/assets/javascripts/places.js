

$(document).ready(function() {
 // alert("test");
  handleReviewLinkClick();
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
