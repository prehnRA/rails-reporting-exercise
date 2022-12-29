# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
  customer = Customer.create!(name: Faker::Company.name)

  20.times do
    job = Job.create!(customer: customer, name: Faker::Educator.university)
    invoices = [1, 2, 3].map { |_i| Invoice.create!(job: job, number: Faker::Number.number(digits: 5), due_date: Faker::Date.forward(days: 90)) }

    50.times do
      type = ["freight", "plants", "commission", "discount"].sample
      amount = if type == "discount" then
        -Faker::Invoice.amount_between(from: 0, to: 1000)
      else
        Faker::Invoice.amount_between(from: 0, to: 1000)
      end

      description = "#{type} transaction: #{Faker::Company.name}"

      invoice =
        if Random.rand(10) < 5 then
          invoices.sample
        else
          nil
        end
      LineItem.create!(job: job, invoice: invoice, amount: amount, line_item_type: type, description: description)
    end
  end
end
