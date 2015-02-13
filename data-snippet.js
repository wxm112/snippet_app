(function() {

  function getContent(id, element) {

    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState != 4) {
        return;
      }
      if (request.status == 404) { // Not Found
        console.error("data-snippet.io: there is no snippet with ID '" + id + "'");
      } else if (request.status == 500 || request.status == 503) { // Internal Server Error or Service Unavailable
        console.error("data-snippet.io: a server-side error occurred; sorry");
      } else if (request.status == 200) {
        resp = JSON.parse(request.responseText);
        element.innerHTML = resp.content;
      } else {
        console.error("data-snippet.io: response had unexpected HTTP status code (" + request.status + ")");
      }
    };
    request.open("GET", "http://api.data-snippet.io/api/v1/snippets/" + id, true);
    request.send();
  }

  function loadSnippets() {
    var nodes = document.querySelectorAll('[data-snippet]');

    [].forEach.call(nodes, function(element) {
      id = element.attributes['data-snippet'].value;
      getContent(id, element);
    });
  }
  window.addEventListener('load', loadSnippets);

})();
