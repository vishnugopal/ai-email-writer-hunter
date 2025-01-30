class Recipient < ApplicationRecord
  enum :type_of_recipient, customer: 0, client: 10, partner: 20
end
