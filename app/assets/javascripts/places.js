

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
  alert("test");
};