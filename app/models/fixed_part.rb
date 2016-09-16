# == Schema Information
#
# Table name: number_parts
#
#  id               :integer          not null, primary key
#  type             :string
#  format           :string
#  number_format_id :integer
#  current          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class FixedPart < NumberPart
  after_save :reset_current

  def build
    format
  end

  private
    def reset_current
      update_column(:current, nil)
    end
end
