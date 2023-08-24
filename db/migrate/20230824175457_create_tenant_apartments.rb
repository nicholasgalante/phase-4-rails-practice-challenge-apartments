class CreateTenantApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :tenant_apartments do |t|
      t.integer :tenant_id
      t.integer :apartment_id

      t.timestamps
    end
  end
end
