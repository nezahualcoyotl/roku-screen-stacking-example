sub ShowEpisodesScreen(content as Object, selectedItem as Integer)
    ' create instance of the EpisodesScreen
    episodesScreen = CreateObject("roSGNode", "EpisodesScreen")
    ' observe selectedItem field so we can know which episode is selected
    episodesScreen.ObserveField("selectedItem", "OnEpisodesScreenItemSelected")
    ' populate episodeScreen with content based on which serial was chosen
    episodesScreen.content = content.GetChild(selectedItem)
    ShowScreen(episodesScreen)
end sub

sub OnEpisodesScreenItemSelected(event as Object)
    episodesScreen = event.GetRoSGNode()
    ' extract the row and column indexes of the item the user selected
    selectedIndex = event.GetData()
    ' the entire row from the EpisodesScreen will be used by the DetailsScreen
    rowContent = episodesScreen.content.GetChild(selectedIndex[0])
    ShowDetailsScreen(rowContent, selectedIndex[1])
end sub