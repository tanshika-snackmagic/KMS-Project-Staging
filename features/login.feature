Feature: KMS Backend Testing

Background: User is logged in
Given User navigate to the website
When User enters data to login 
Then User should be Successful

@system_configuration
Scenario: System Configuration page should be accessible
When User go to system configuration page
Then User should be able to access the system configuration page

@menu_management
Scenario: Menu Management page should be accesible
When User go to menu management page
Then User should be able to select service
And Enter Revenue Centre
And Click on search to get search results

@store_group
Scenario: Store Group page should be accessible
When User go to store group page
Then User should be able to see store groups list
And User should be able to go to edit and create page of store group

@revenue_centre
Scenario: Revenue Centre pages should be accessible
When User go to OT list under Revenue Centres tab
Then User should be able to search results on the page
And User should be able to open the HQ show page
When User go to 3pp List under Revenue Centres tab
Then User should be able to filter results on the basis of services
When User go to 3pp mappings page List under Revenue Centres tab
Then User should be  able to select the elements from the drop down list of the 3pp Revenue Centres input field

@items_and_modifiers
Scenario: Item and modifier pages should be accessible
When User go to Items page under Items and Modifiers tab
Then User should be able search an item under OT categories
And User should be able to select an item
And User should be able to open Item Settings page
When User go to 3pp Items page under Items and Modifiers tab
Then User should be able to search items on 3pp Items Page
When User go to Items mappings page under Items and Modifiers tab
Then User should be able to search the items on Item mappings screen
And User should be able to select items from dropdown list
When User go to Section Manager under Items and Modifiers tab
Then User should be able add and edit a section
When User go to Mod Group Manager under Items and Modifiers tab
Then User should be able to select store group on Mod Group Manager page