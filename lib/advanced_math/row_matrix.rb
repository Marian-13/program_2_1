module AdvancedMath
  class RowMatrix
    attr_reader :rows

    def initialize(attrs)
      @rows = attrs[:rows]
    end

    def row_size
      @row_size ||= rows.size
    end

    def column_size
      @column_size ||= rows[0].size
    end

    def [](index)
      rows[index]
    end
  end
end
