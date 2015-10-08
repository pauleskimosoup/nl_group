require 'rails_helper'

RSpec.feature "Destroying A Client", type: :feature do
  subject!(:client) { create(:client) }
  it "should allow a client to be destroyed", js: true do
    login_with("optimised", "optipoipoip")

    click_link "Clients"

    expect(current_path).to eq(optimadmin.clients_path)
    expect(page).to have_content(client.name)

    within("#item_#{ client.id }") do
      find("a[data-method='delete']").click
    end

    expect(page).to have_content('Client was successfully destroyed.')
  end
end
