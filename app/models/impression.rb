# frozen_string_literal: true

# == Schema Information
#
# Table name: impressions
#
#  id                :uuid             not null, primary key
#  campaign_id       :bigint(8)
#  property_id       :bigint(8)
#  ip                :string
#  user_agent        :text
#  country           :string
#  postal_code       :string
#  latitude          :decimal(, )
#  longitude         :decimal(, )
#  payable           :boolean          default(FALSE), not null
#  reason            :string
#  displayed_at      :datetime
#  displayed_at_date :date
#  clicked_at        :datetime
#  fallback_campaign :boolean          default(FALSE), not null
#

class Impression < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................

  # relationships .............................................................
  belongs_to :campaign
  belongs_to :distribution, optional: true
  belongs_to :property

  # validations ...............................................................
  validates :country, length: { maximum: 255 }
  validates :ip, length: { maximum: 255, allow_blank: false }
  validates :postal_code, length: { maximum: 255 }

  # callbacks .................................................................
  # scopes ....................................................................

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  range_partition_by :displayed_at_date

  # class methods .............................................................
  class << self
  end

  # public instance methods ...................................................

  # protected instance methods ................................................
  protected

  # private instance methods ..................................................
  private
end
