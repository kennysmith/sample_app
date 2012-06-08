class AddStatusEventsremainingToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :status, :string
    add_column :payments, :eventsremaining, :integer
  end
end
