require_relative '../pages/login_page.rb'

Given(/^User navigate to the website$/) do
  @home = KMS.new
  @home.load
  @home.wait_until_login_text_before_visible
end

When(/^User enters data to login$/) do
  @home.email.set 'diginn.kds@vinsol.com'
  @home.password.set 'qq11WW@@'
  @home.login_button.click
end

Then(/^User should be Successful$/) do
  @home.wait_until_close_button_visible
  @home.close_button.click
  sleep 2
end

When(/^User go to system configuration page$/) do
  @home.system_config.click
  @home.items_dd[0].click
end

Then(/^User should be able to access the system configuration page$/) do
  @home.wait_until_system_config_screen_visible
end

When(/^User go to menu management page$/) do
  @home.menu_management.click
  @home.items_dd[0].click
  @home.wait_until_menu_management_table_visible
  sleep 7
end

Then(/^User should be able to select service$/) do
  @home.mm_search_bar.click
  @home.wait_until_select_doordash_visible
  @home.select_doordash.click
end

Then(/^Enter Revenue Centre$/) do
  @home.search_revenue_centre.set "D0A2"
end

Then(/^Click on search to get search results$/) do
  @home.search_button.click
  sleep 2
  expect(@home.selected_result.text).to eq('[DD] D002')
end

When(/^User go to store group page$/) do
  @home.store_groups[2].click
  @home.store_group_list_dd.click
end

Then(/^User should be able to see store groups list$/) do
  @home.wait_until_store_group_list_visible
end

Then(/^User should be able to go to edit and create page of store group$/) do
  @home.store_group_list.click
  @home.wait_until_store_group_name_visible
  page.evaluate_script('window.history.back()')
  @home.wait_until_store_group_create_visible
  @home.store_group_create.click
  @home.wait_until_store_group_name_visible
end

When(/^User go to OT list under Revenue Centres tab$/) do
  @home.store_groups[1].click
  @home.ot_list_dd.click
end

Then(/^User should be able to search results on the page$/) do
  @home.wait_until_mm_search_bar_visible
  @home.search_shortname.click
  @home.search_shortname.set "hq"
  @home.wait_until_hq_dd_visible
  @home.hq_dd.click
  @home.service_type.click
  @home.select_olo.click
  @home.search_button.click
  sleep 2
end

Then(/^User should be able to open the HQ show page$/) do
  @home.hq[0].click
  @home.wait_until_hq_show_page_visible
end

When(/^User go to 3pp List under Revenue Centres tab$/) do
  @home.store_groups[1].click
  @home.three_pp_list_dd.click
end

Then(/^User should be able to filter results on the basis of services$/) do
  @home.wait_until_select_services_visible
  @home.select_services.click
  @home.grubhub_service.click
  @home.search_button.click
  sleep 5
  expect(@home.grubhub_result.count).to eq (40)
end

When(/^User go to 3pp mappings page List under Revenue Centres tab$/) do
  @home.store_groups[1].click
  @home.three_pp_mapping_dd.click
end

Then(/^User should be  able to select the elements from the drop down list of the 3pp Revenue Centres input field$/) do
  @home.wait_until_selection_dds_visible
  @home.selection_dds[0].click
  @home.gh_dd[0].click
  sleep 5
end

When(/^User go to OT portal to place order on HQ revenue centre$/) do
  @ot = OpenTender.new
  @ot.load
  @ot.wait_until_ot_email_visible
  @ot.ot_email.set 'achal@vinsol.com'
  @ot.ot_password.set 'qq11WW@@qq11'
  @ot.ot_login_button.click
  @ot_wait_until_loggedin_text_visible
  sleep 5
  @ot.orders.click
  sleep 5
  @ot.place_order.click
  @ot.wait_until_choose_customer_visible
  @ot.choose_customer.click
  @ot.customer_or_promo.set 'shereen.asmat@diginn.com'
  @ot.select_customer_or_promo.click
  sleep 5
  @ot.wait_until_customer_or_promo_result_visible(wait: 10)
  @ot.customer_or_promo_result.click
  @ot.select_pickup.click
  @ot.order_type.click
  @ot.online_order.click
  @ot.choose_store.click
  sleep 5
  scroll_to(@ot.store)
  @ot.store.click
  @ot.wait_until_menu_visible(wait: 10)
  scroll_to(@ot.menu_items)
  @ot.item.click
  @ot.wait_until_add_to_cart_visible
  @ot.add_to_cart.click
  @ot.wait_until_proceed_checkout_visible(wait: 10)
  @ot.proceed_checkout.click
  @ot.wait_until_summary_visible(wait: 10)
  @ot.promocode.click
  @ot.customer_or_promo.set 'vinsol100'
  @ot.select_customer_or_promo.click
  sleep 5
  @ot.wait_until_customer_or_promo_result_visible(wait: 10)
  @ot.customer_or_promo_result.click
  @ot.wait_until_summary_visible(wait: 10)
  scroll_to(@ot.submit_order)
  @ot.submit_order.click
  @ot.wait_until_order_summary_visible(wait: 10)
  $kms_order_no = @ot.order_no.text
end

When(/^Come back to KMS backend$/) do
  @home.load
end

Then(/^User should be able to go to store page$/) do
  @home.store_groups[0].click
  @home.stores_list.click
end

Then(/^Select HQ revenue centre$/) do
  @home.select_store_groups.click
  @home.gh_dd[1].click
  @home.search_button.click
  sleep 2
  @home.hq[0].click
  @home.wait_until_rev_heading_visible
  @home.hq[1].click
  @home.wait_until_total_orders_link_visible
  sleep 30
  @home.total_orders.click
end

Then(/^Go to order listing screen to view and cancel the order from KMS backend$/) do
  @home.wait_until_order_search_visible
  @home.order_search.set $kms_order_no
  @home.search_button.click
  sleep 2
  expect(@home.order_count.count).to eq (1)
  @home.view_order.click
  @home.wait_until_order_summary_kms_visible
  page.evaluate_script('window.history.back()')
  @home.cancel_button.click
  @home.wait_until_alert_message_visible
end

When(/^User go to Items page under Items and Modifiers tab$/) do
  @home.store_groups[3].click
  @home.items_dd[0].click
  @home.wait_until_card_body_visible
end

Then(/^User should be able search an item under OT categories$/) do
  @home.ot_category_field.click
  @home.gh_dd[0].click
  @home.search_item_name.set 'a'
  @home.search_button.click
  sleep 2
end

Then(/^User should be able to select an item$/) do
  @home.select_item.click
  @home.wait_until_item_details_visible
  @home.item_details.select "Default Store Group"
  @home.save_button[0].click
end

Then(/^User should be able to open Item Settings page$/) do
  #entering menu_id
  @home.wait_until_menu_id_visible
  @home.menu_id.set "1234"
  @home.save_button[1].click
  @home.wait_until_alert_message_visible
  @home.close_button.click
  #undo menu_id changes
  @home.menu_id.set " "
  @home.save_button[1].click
  @home.wait_until_alert_message_visible
  #separate ticket enabled
  @home.separate_ticket.set false
  @home.wait_until_end_section_visible
  @home.end_section.select "Sides"
  scroll_to(@home.save_button[2])
  @home.save_button[2].click
  @home.wait_until_alert_message_visible
  #separate ticket disabled
  @home.separate_ticket.set true
  @home.wait_until_end_section_invisible
  scroll_to(@home.save_button[2])
  @home.save_button[2].click
  @home.wait_until_alert_message_visible
  #add additional modifiers
  scroll_to(@home.add_mod)
  @home.add_mod.set true
  @home.add_mod_dd.select "[OT] Sauces (on the side) (#74)"
  @home.mod_items.click
  @home.mod_items_dd.click
  @home.save_button[2].click
  @home.wait_until_alert_message_visible
  #remove additional modifiers
  scroll_to(@home.add_mod)
  @home.remove_button.click
  @home.save_button[2].click
  @home.wait_until_alert_message_visible
end

When(/^User go to 3pp Items page under Items and Modifiers tab$/) do
  @home.store_groups[3].click
  @home.items_dd[1].click
  @home.wait_until_card_body_visible
end

Then(/^User should be able to search items on 3pp Items Page$/) do
  @home.search_item_name.set "spice"
  @home.search_button.click
  sleep 2
  within(@home.table_class) do
    expect(all('tr').count).to eq(3)
  end
end

When(/^User go to Items mappings page under Items and Modifiers tab$/) do
  @home.store_groups[3].click
  @home.items_dd[2].click
  @home.wait_until_card_body_visible
end

Then(/^User should be able to search the items on Item mappings screen$/) do
  @home.ot_category_field.click
  @home.gh_dd[0].click
  @home.search_item_name.set 'a'
  @home.s_button.click
  sleep 2
  scroll_to(@home.table_class)
  within(@home.table_class) do
    expect(all('tr').count).to eq(23)
  end
end

Then(/^User should be able to select items from dropdown list$/) do
  @home.selection_dds[0].click
  @home.gh_dd[0].click
end

When(/^User go to Section Manager under Items and Modifiers tab$/) do
  @home.store_groups[3].click
  @home.items_dd[11].click
  @home.wait_until_table_mod_visible
end

Then(/^User should be able add and edit a section$/) do
  @home.add_section.click
  @home.wait_until_search_button_visible
  page.evaluate_script('window.history.back()')
  @home.wait_until_table_mod_visible
  @home.edit_section[0].click
  @home.wait_until_search_button_visible
end

When(/^User go to Mod Group Manager under Items and Modifiers tab$/) do
  @home.store_groups[3].click
  @home.items_dd[12].click
end

Then(/^User should be able to select store group on Mod Group Manager page$/) do
  @home.wait_until_item_details_visible
  @home.item_details.select "Default Store Group"
  @home.save_button[0].click
  @home.wait_until_table_mod_visible
end