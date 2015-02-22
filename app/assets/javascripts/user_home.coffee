class UserHomeView
  constructor: () ->
    @groupsListView = new GroupsListView(this)
    @snippetsListView = new SnippetsListView(this)
    @membersListView = new MembersListView(this)
    
class GroupsListView
  constructor: (@userHomeView) ->
    @groups = ko.observableArray []
    @groups.push { id: 132312, name: "Meimei's friends" }
    @groups.push { id: 178253, name: "We luvs snippets" }
    @groups.push { id: 138907, name: "Family" }

class SnippetsListView
  constructor: (@userHomeView) ->

class MembersListView
  constructor: (@userHomeView) ->

window.views = { userHomeView: new UserHomeView() };
