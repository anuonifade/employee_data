class Earning < ApplicationRecord
  require 'csv'
  belongs_to :employer

  def self.upload(file_path, employer)
    map = employer.mapping

    CSV.foreach(file_path, headers: true) do |row|
      data = {}

      row.each do |k, v|
        key = map[k]

        v = Earning.new.change_date_format(v, key[1]) if key[0].to_sym == :earning_date
        v = Earning.new.currency_value(v, key[1]) if key[0].to_sym == :amount

        if key.is_a? Array
          data[key[0].to_sym] = v
        else
          data[key.to_sym] = v
        end
      end
      employer.earnings.create! data
    end
  end

  def change_date_format(date_value, incoming_format)
    return incoming_format if incoming_format == 'YYYY-MM-DD'

    date = Date.parse(date_value)
    date.strftime('%Y-%m-%d')
  end

  def currency_value(value, currency_sym)
    return value[1..].to_f if currency_sym.present?

    value
  end
end
