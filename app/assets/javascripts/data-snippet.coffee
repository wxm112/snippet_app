do ->
  getContent = (id, element) ->
    request = new XMLHttpRequest()
    request.onreadystatechange = () ->
      return if request.readyState != 4
      if request.status == 404 # not found
        console.error "data-snippet.io: there is no snippet with ID '#{id}'"
      else if request.status == 500 or request.status == 503 # Internal Server Error | Service Unavailable
        console.error "data-snippet.io: a server-side error occurred; sorry"
      else if request.status == 200
        element.innerHTML = JSON.parse(request.responseText).content
      else
        console.error "data-snippet.io: response had unexpected HTTP status code (#{request.status})"
    request.open "GET", "http://api.data-snippet.io/api/v1/snippets/#{id}", true
    request.send
  
  loadSnippets = () ->
    nodes = document.querySelectorAll '[data-snippet]'
    
    [].forEach.call nodes, (element) ->
      id = element.attributes['data-snippet'].value;
      getContent id, element

  window.addEventListener 'load', loadSnippets
