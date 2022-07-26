require "csv"
#
#

class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []

    load_csv if File.exists?(@csv_path)
  end

  def all
    @elements
  end

  def create(new_element)
    new_element.id = next_id
    @elements << new_element

    update_csv
  end

  private

  def next_id
    @elements.empty? ? 1 : @elements.last.id + 1
  end
end
