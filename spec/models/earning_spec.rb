require 'rails_helper'

RSpec.describe Earning do
  let(:map) {
    {
      'EmployeeID' => 'employee_id',
      'CheckDate' => ['earning_date', 'YYYY-MM-DD'],
      'Amount' => ['amount', '$']
    }
  }
  let(:employer) { Employer.create(name: 'Test Employer', mapping: map) }
  let(:csv_url) { "#{Rails.root}/spec/fixtures/test.csv" }

  context 'For a csv uploaded for an employer and employee' do
    it 'maps and save earnings according' do
      expect { Earning.upload(csv_url, employer) }.to change { Earning.count }
    end
  end
end
