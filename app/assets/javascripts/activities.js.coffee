#= require lodash

$ ->
	_.templateSettings = {
		interpolate: /\{\{\=(.+?)\}\}/g,
		evaluate: /\{\{(.+?)\}\}/g
	}
	loadKinds STUDENT_GROUPS
	filterGroups()
	$('#groups-filter .sub-nav dd').click(filterKindHandler)
	$('#groups-filter-input').keyup(filterGroups)


filterKindHandler = () ->
	$(this).toggleClass('active')
	filterGroups()


loadKinds = (groups) ->
	kinds = [group.kinds for group in groups]
	kinds = _.uniq(_.flatten(kinds))
	kindsFilter = _.template($('#groups-kinds-template').html(), {kinds: kinds})
	$('#groups-filter').html(kindsFilter)


filterGroups = ->
	groupTemplate = _.template($('#group-template').html())
	filteredKinds = getFilteredKinds()
	renderedGroups = ""
	filterText = $('#groups-filter-input').val()
	console.log filteredKinds
	_.each STUDENT_GROUPS, (group) ->
		for k in group.kinds
			if k not in filteredKinds
				return
		if filterText.length > 0 and group.name.toLowerCase().indexOf(filterText) == -1
			return
		renderedGroups += groupTemplate(group)
	$('#groups-browser-list').html(renderedGroups)


getFilteredKinds = ->
	kinds = $('#groups-filter .active a').map((i,a) -> $(a).text()).toArray()
	if kinds.length > 0
		return kinds
	else
		return $('#groups-filter a').map((i,a) -> $(a).text()).toArray()